export HOST = merlin
export PROJECT = blurbs

export TEOSDIR ?= /srv/www/zoid6/teos/
export PROD = $(HOST):$(TEOSDIR)

export RSYNC = rsync --delete-after --chmod=Dg=rwxs,Fgu=rw,Fo=r --verbose \
	--archive --update --backup --recursive \
	--human-readable --rsh=ssh \
	--no-owner --no-group --checksum --mkpath

export TIMEZONES = America/New_York:NYC
# export TIMEZONES = America/New_York:NYC America/Los_Angeles:LAP America/Chicago:CHI Europe/London:LON

.PHONY: prod help

prod:
	@for f in $$(find . -type f); do \
		frontmatter_date=$$(sed -n 's/^date: //p' "$$f" 2>/dev/null); \
		if [ -n "$$frontmatter_date" ]; then \
			epoch=$$(stat -c %Y "$$f"); \
			frontmatter_epoch=$$(date -u -d "$$frontmatter_date" +%s 2>/dev/null || echo "0"); \
			if [ "$$epoch" -gt "$$frontmatter_epoch" ]; then \
				tz_parts=""; \
				for tz in $(TIMEZONES); do \
					tz_name=$${tz%:*}; \
					tz_label=$${tz#*:}; \
					tz_str=$$(TZ=$$tz_name date -d "@$$epoch" '+%H:%M:%S'); \
					tz_parts="$$tz_parts ($$tz_str $$tz_label)"; \
				done; \
				gmt_date=$$(date -u -d "@$$epoch" '+%Y-%m-%d %H:%M:%S'); \
				sed -i "s/^date: .*/date: $$gmt_date GMT$$tz_parts/" "$$f"; \
			fi \
		fi \
	done
	$(RSYNC) --exclude='Makefile' --exclude='*~' . $(TEOSDIR)/
	$(RSYNC) $(TEOSDIR) $(PROD)

help:
	@echo "Available targets:"
	@echo "  make prod              - Install blurbs locally and sync to merlin"
