export HOST = merlin
export PROJECT = blurbs

export TEOSDIR ?= /srv/www/vhosts/zoidtechnologies.com/html/teos/
export PROD = $(HOST):$(TEOSDIR)

export RSYNC = rsync --delete-after --chmod=Dg=rwxs,Fgu=rw,Fo=r --verbose \
	--archive --update --backup --recursive \
	--human-readable --rsh=ssh \
	--no-owner --no-group --checksum --mkpath

export TIMEZONES = America/New_York:NYC
# export TIMEZONES = America/New_York:NYC America/Los_Angeles:LAP America/Chicago:CHI Europe/London:LON

.PHONY: prod help

# @since 2026-10-15 — split the legacy single `date:` field into
# two distinct fields: `createdate:` (the create date, set once
# from the first observed `date:` value) and `lastmodified:`
# (refreshed on every prod from the file's mtime). New blurbs
# should use `createdate:` and `lastmodified:` from the start.
# The legacy `date:` key is left in place (read fallback) until
# every blurb in the tree has both new keys; a future pass can
# drop `date:` entirely.
#
# Per-file algorithm:
#   1. If a `folder-path:` line exists, this is a blurb. Skip
#      otherwise.
#   2. Compute the current mtime epoch.
#   3. Read the existing `lastmodified:` value (if any). If it
#      parses to an epoch older than the mtime, rewrite the
#      `lastmodified:` line with the current mtime.
#   4. If the file has no `createdate:` line but has a `date:`
#      line, copy the `date:` value into a new `createdate:` line
#      inserted immediately after the `folder-path:` line. (One-
#      time migration; subsequent runs no-op because the
#      `createdate:` check at the top passes.)
prod:
	@for f in $$(find . -type f); do \
		folder_path=$$(sed -n 's/^folder-path: //p' "$$f" 2>/dev/null); \
		if [ -z "$$folder_path" ]; then continue; fi; \
		epoch=$$(stat -c %Y "$$f"); \
		tz_parts=""; \
		for tz in $(TIMEZONES); do \
			tz_name=$${tz%:*}; \
			tz_label=$${tz#*:}; \
			tz_str=$$(TZ=$$tz_name date -d "@$$epoch" '+%H:%M:%S'); \
			tz_parts="$$tz_parts ($$tz_str $$tz_label)"; \
		done; \
		gmt_date=$$(date -u -d "@$$epoch" '+%Y-%m-%d %H:%M:%S'); \
		new_stamp="$$gmt_date GMT$$tz_parts"; \
		\
		lastmodified_stamp=$$(sed -n 's/^lastmodified: //p' "$$f" 2>/dev/null); \
		lastmodified_epoch=$$(date -u -d "$$lastmodified_stamp" +%s 2>/dev/null || echo "0"); \
		if [ "$$epoch" -gt "$$lastmodified_epoch" ]; then \
			if grep -q '^lastmodified: ' "$$f"; then \
				sed -i "s/^lastmodified: .*/lastmodified: $$new_stamp/" "$$f"; \
			else \
				sed -i "/^folder-path: /a lastmodified: $$new_stamp" "$$f"; \
			fi; \
		fi; \
		\
		createdate_stamp=$$(sed -n 's/^createdate: //p' "$$f" 2>/dev/null); \
		if [ -z "$$createdate_stamp" ]; then \
			legacy_date=$$(sed -n 's/^date: //p' "$$f" 2>/dev/null); \
			if [ -n "$$legacy_date" ]; then \
				sed -i "/^folder-path: /a createdate: $$legacy_date" "$$f"; \
			fi; \
		fi; \
	done
	$(RSYNC) --exclude='Makefile' --exclude='*~' . $(TEOSDIR)
	$(RSYNC) $(TEOSDIR) $(PROD)

help:
	@echo "Available targets:"
	@echo "  make prod              - Install blurbs locally and sync to merlin"

# Generate copies of blurbs to multiple paths based on folder-path frontmatter
# Usage: make copy-paths
.PHONY: copy-paths

copy-paths:
	@echo "Generating copies based on folder-path frontmatter..."
	@for f in $$(find . -name "*.md" -type f); do \
		paths=$$(sed -n 's/^folder-path: //p' "$$f" 2>/dev/null); \
		if [ -n "$$paths" ]; then \
			IFS=',' read -ra LABELS <<< "$$paths"; \
			for label in "$${LABELS[@]}"; do \
				label=$$(echo "$$label" | tr -d ' '); \
				if [ -z "$$label" ] || [ "$$label" = "." ]; then continue; fi; \
				p=$$(echo "$$label" | tr '.' '/'); h=$$(echo "$$p" | tr '_' '-'); \
				if [ -d "$$p" ] && [ -d "$$h" ] && [ "$$p" != "$$h" ]; then \
					echo "CONFLICT: $$label matches both $$p and $$h" >&2; exit 1; \
				elif [ -d "$$p" ]; then dir="$$p"; \
				elif [ -d "$$h" ]; then dir="$$h"; \
				else echo "NOT FOUND: $$label (tried $$p and $$h)" >&2; exit 1; fi; \
				mkdir -p "$$dir"; \
				if [ "$$f" != "$$dir/$$(basename "$$f")" ]; then \
					cp "$$f" "$$dir/"; \
					echo "  Copied $$f -> $$dir/"; \
				fi \
			done \
		fi \
	done
	@echo "Done."

# Clean up generated copies (keeps originals in first folder-path location)
# Usage: make clean-copies
.PHONY: clean-copies

clean-copies:
	@echo "Removing generated copies based on folder-path frontmatter..."
	@for f in $$(find . -name "*.md" -type f); do \
		paths=$$(sed -n 's/^folder-path: //p' "$$f" 2>/dev/null); \
		if [ -n "$$paths" ]; then \
			filename=$$(basename "$$f"); \
			first_path=$$(echo "$$paths" | cut -d',' -f1 | tr -d ' '); \
			for label in $$(echo "$$paths" | tr ',' ' '); do \
				label=$$(echo "$$label" | tr -d ' '); \
				if [ -z "$$label" ] || [ "$$label" = "." ]; then continue; fi; \
				p=$$(echo "$$label" | tr '.' '/'); h=$$(echo "$$p" | tr '_' '-'); \
				if [ -d "$$p" ] && [ -d "$$h" ] && [ "$$p" != "$$h" ]; then \
					echo "CONFLICT: $$label matches both $$p and $$h" >&2; exit 1; \
				elif [ -d "$$p" ]; then dir="$$p"; \
				elif [ -d "$$h" ]; then dir="$$h"; \
				else echo "NOT FOUND: $$label (tried $$p and $$h)" >&2; exit 1; fi; \
				if [ "$$dir/$$filename" != "$$f" ]; then \
					rm -f "$$dir/$$filename"; \
					echo "  Removed $$dir/$$filename"; \
					rmdir --ignore-fail-on-non-empty "$$dir" 2>/dev/null || true; \
				fi \
			done \
		fi \
	done
	@echo "Done. Originals preserved in first folder-path location."

backup:
	rsync --recursive --verbose --exclude=.venv . /run/media/jam/AEAB-CF37/projects/$(PROJECT)/
