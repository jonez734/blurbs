---
folder-path: comp.editors
createdate: 2026-10-30 19:21:34 GMT (15:21:34 NYC)
lastmodified: 2026-10-30 19:21:34 GMT (15:21:34 NYC)
---

# Emacs

Emacs is a family of text editors characterized by extensibility. Its most widely used member is GNU Emacs, the free-software implementation maintained by the GNU Project. Emacs is built around an interpreter for Emacs Lisp, a Lisp dialect, so most of the editor, including basic editing, is written in Lisp and can be changed while the editor is running [emacs-1].

---

## Name and origin

The original name was EMACS, short for "Editing MACroS" (or "Editor MACroS"). The name came from TECO, the line editor used on the MIT AI Lab's PDP-10 machines running the ITS operating system. Users had written many TECO macro packages, usually with names ending in MAC or MACS. In the mid-1970s, Guy L. Steele Jr. unified these divergent macro sets into one package, which Richard M. Stallman then largely completed and extended [emacs-1].

Stallman is credited with choosing the name. He picked the letter "E" partly because <E> was not in use as an abbreviation on ITS at the time [emacs-1]. A later recursive acronym, "EMACS Makes All Computing Simple," also became popular [emacs-1].

The name is sometimes pluralized as "emacsen," by analogy with "boxen" and "VAXen," to refer to different varieties of Emacs [emacs-1].

---

## The "E" editor

The name "E" has no connection to Emacs' name. It refers to a separate editor, written by Fred Wright at the Stanford AI Lab. In 1976, Stallman visited Stanford and was impressed by E's intuitive WYSIWYG behavior, the display-as-you-type style that most modern editors now use by default [emacs-1].

E also had random-access editing, which TECO lacked. TECO was page-sequential and designed for paper tape. Stallman did not copy E's disk structure. He changed TECO to read, edit, and write the whole file as one buffer, which most modern editors also do [emacs-1].

E is therefore a predecessor that influenced Emacs' design, not the source of its name.

---

## The first Emacs

The original Emacs ran only on the PDP-10 under ITS. Mike McMahon later ported it to the TENEX and TOPS-20 operating systems. By 1979 it was the main editor at the MIT AI Lab and the Laboratory for Computer Science [emacs-1].

Stallman's early Emacs was distributed on the basis of communal sharing. Improvements had to be sent back to him for inclusion in the distribution, a condition he used to limit uncontrolled forking [emacs-1].

---

## Other early Emacs-like editors

Several Emacs-like editors appeared on other systems in the late 1970s and early 1980s:

- **EINE** and **ZWEI** (Lisp Machine), by Mike McMahon and Daniel Weinreb. EINE was the first Emacs written in Lisp [emacs-1].
- **Multics Emacs**, written in 1978 by Bernard Greenberg almost entirely in Multics Lisp [emacs-1].
- **Gosling Emacs**, written by James Gosling in 1981. It was the first Emacs-like editor for Unix, written in C with the Mocklisp extension language [emacs-1].
- **CCA EMACS**, a commercial version from Computer Corporation of America, sold from 1983 [emacs-1].

---

## GNU Emacs

Stallman began GNU Emacs in 1984 as a free replacement for the proprietary Gosling Emacs. He replaced Gosling's Mocklisp interpreter with a true Lisp interpreter, which required rewriting nearly all of the code. This became the first program of the GNU Project [emacs-1].

GNU Emacs is written in C, with Emacs Lisp as its extension language. Version 13, the first public release, was made on 20 March 1985 and announced on Usenet. The first widely distributed version was 15.34, later in 1985 [emacs-1][emacs-2].

About 70% of GNU Emacs is written in Emacs Lisp, so porting it mostly means porting the C core that runs the Lisp interpreter [emacs-1].

Development was relatively closed until 1999, which made it an example of the "cathedral" model in Raymond's *The Cathedral and the Bazaar*. Source control moved from CVS to Bazaar in 2008 and to Git in 2014 [emacs-1].

Stallman remained principal maintainer for a long time. Later maintainers include Stefan Monnier and Chong Yidong (2008-2015), John Wiegley (2015-2018), and Eli Zaretskii as lead maintainer from 2018 [emacs-1].

---

## Release history

The dates below are from the GNU release history page [emacs-2]. The table is a selection of major releases, not a complete list.

| Version | Released     | Notes                                                |
| ------- | ------------ | ---------------------------------------------------- |
| 13      | 1985-03-20   | First public release                                 |
| 15.34   | 1985-05-07   | Last 15.x release; first widely distributed version  |
| 17.36   | 1985-12-20   | First 17.x release                                   |
| 18.59   | 1992-10-30   | Last 18.x release                                    |
| 19.7    | 1993-05-22   | First 19.x release                                   |
| 20.1    | 1997-09-15   |                                                      |
| 21.1    | 2001-10-28   |                                                      |
| 22.1    | 2007-06-02   |                                                      |
| 23.1    | 2009-07-29   |                                                      |
| 24.1    | 2012-06-10   | Package system introduced                            |
| 25.1    | 2016-09-17   |                                                      |
| 26.1    | 2018-05-28   |                                                      |
| 27.1    | 2020-08-10   |                                                      |
| 28.1    | 2022-04-04   |                                                      |
| 29.1    | 2023-07-30   |                                                      |
| 30.1    | 2025-02-23   | Native compilation on by default; Android port; Tree-Sitter modes |
| 30.2    | 2025-08-14   | Maintenance release                                  |
| 31.1    | 2026-08-24   | Current release as of this writing                   |

In 2014 the project announced a faster release cadence, so version numbers would increase more quickly [emacs-1][emacs-3].

Notable recent features from the project's release notes:

- **30.1:** native compilation enabled by default, Android port, EditorConfig support, new Tree-Sitter major modes, the `which-key` package, and a `visual-wrap-prefix-mode` minor mode [emacs-2].
- **31.1:** mouse control in terminal frames enabled by default, a new `user-lisp/` subdirectory in the configuration directory, child frames on text terminals, and a package review step before installing or upgrading packages [emacs-2].

---

## Variants and forks

- **XEmacs** began as Lucid Emacs in 1991, based on an early alpha of GNU Emacs 19, by Jamie Zawinski and others at Lucid Inc. It was later renamed XEmacs. Development has been very slow. The most recent stable version is 21.4.22 (January 2009), and a beta was released in June 2025 [emacs-1][emacs-4].
- **Aquamacs** is based on GNU Emacs and focuses on integration with the macOS interface. Version 3.2 was based on GNU Emacs 24, and 3.3 on GNU Emacs 25 [emacs-1].
- **Meadow** is a Japanese port of Emacs to Microsoft Windows, with an installer similar to the one used for Cygwin [emacs-1].
- **Spacemacs** and **Doom Emacs** are distributions built on GNU Emacs, with curated configurations and keybinding layouts [emacs-1].

Smaller clones remain in use, often for small systems or quick edits:

- **MicroEMACS**, originally by Dave Conroy and later developed by Daniel Lawrence, with many variants [emacs-1].
- **mg**, a public-domain offshoot of MicroEMACS, installed by default on OpenBSD and macOS [emacs-1].
- **JOVE** (Jonathan's Own Version of Emacs), a non-programmable implementation for Unix-like systems [emacs-1].
- **Zile** (Zile Is Lossy Emacs), a small, fast clone for low-memory machines [emacs-1].

---

## Platforms

GNU Emacs runs on the following platforms, according to the project's download page [emacs-2]:

- GNU/Linux
- BSD systems
- Haiku
- Windows
- macOS
- Android

It can also run in a text terminal (`emacs -nw`), and it can run as a background daemon that clients connect to [emacs-1][emacs-2].

---

## Folklore

- **Emack & Bolio's.** Some say Emacs was named after Emack & Bolio's, a Boston ice cream shop. Stallman's own answer was that neither the editor nor the shop had anything to do with the other [emacs-1].
- **The operating system line.** The saying "Emacs would be a great operating system if it only had a decent editor" is widely repeated among Emacs users. It is unattributed here: no original source has been identified.
- **Church of Emacs.** A parody religion formed by Stallman for Emacs users. It calls vi "the editor of the beast," since "vi-vi-vi" is 6-6-6 in Roman numerals. Supporters of vi formed the Cult of vi in reply [emacs-1].
- **Editor wars.** GNU Emacs and vi are the two main contenders in the traditional editor wars of Unix culture [emacs-1].
- **Emacs pinky.** Folklore attributes a repetitive strain injury to Emacs' heavy use of modifier keys. No studies have shown Emacs causes more such problems than other keyboard-heavy programs [emacs-1].
- **Self-documentation.** The first Emacs had a help library with documentation for every command and internal function. Its documentation strings helped popularize the idea of self-documenting software [emacs-1].

---

## References

[emacs-1]: https://en.wikipedia.org/wiki/Emacs (Wikipedia, "Emacs"; accessed 2026-10-30)
[emacs-2]: https://www.gnu.org/software/emacs/history.html (GNU Emacs Release History; accessed 2026-10-30)
[emacs-3]: https://www.gnu.org/software/emacs/ (GNU Emacs project page; accessed 2026-10-30)
[emacs-4]: https://en.wikipedia.org/wiki/XEmacs (Wikipedia, "XEmacs")
