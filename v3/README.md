# upbthesis v3.0 — UPB thesis class (APA 7)

**`upbthesis.cls`** is the LaTeX class for writing your thesis or final-year
project at **UPB**. This **v3.0** modernizes [`v2`](../v2): **UTF-8**, **babel**,
the **UPB logo** on the title page, and **APA 7** formatting and bibliography —
while preserving the original class API (by Juan Alberto Ramírez Macías).

*Knowing how to write using LaTeX is a prerequisite.* It compiles with
`pdflatex` + `biber`; see the sample output in [`upbthesis.pdf`](upbthesis.pdf).

## What's new in v3.0

| Aspect | Official class (v2.2, 2018) | This class (v3.0) |
|---|---|---|
| Encoding | `inputenc[latin1]` (obsolete) | **UTF-8** + `fontenc[T1]` + Latin Modern |
| Language | manual strings, no babel | **`babel`** (es/en hyphenation) |
| UPB logo | not integrated | **on the title page** (`\logo`) |
| Bibliography | Vancouver / ICONTEC | **APA 7** (`biblatex`, style `apa`) |
| Table/figure numbering | per chapter | **global** (APA 7) |
| Captions | "Table N. Title" inline | **"Table N"** bold + italic title, **on top** |
| Page header | chapter name, uppercase | **page number only**, top-right (APA 7) |
| Chapter titles | "Chapter N", uppercase | **"N. Title"** centered, no "Chapter" word |

> The classic format (Vancouver/ICONTEC, two-page cover) is **preserved** and
> enabled with the `numcit` or `icontec` options, for backward compatibility.

## Files

| Path | Description |
|---|---|
| `upbthesis.cls` | The class (formatting + API). |
| `upbthesis.tex` | Blank example: cover, front matter, acronyms, 2 chapters, 2 tables, 1 figure. |
| `upbthesis.bib` | 3 example references in APA 7. |
| `upbthesis.pdf` | Sample compiled output. |
| `img/` | UPB logo (`logo-upb.png`) and the example figure. |

> Previous versions live in [`../v2`](../v2) and [`../v1_legacy`](../v1_legacy).

## Dependencies

A TeX distribution (TeX Live / MacTeX / MiKTeX) plus the APA 7 stack:
`biblatex`, `biblatex-apa`, `csquotes`, `logreq`, and the **`biber`** program.
Check what is missing with:

```bash
kpsewhich biblatex.sty csquotes.sty apa.bbx logreq.sty   # a path = installed
biber --version
```

| Option | Command | Admin rights |
|---|---|---|
| **A — user tree** (recommended on macOS/BasicTeX) | `tlmgr init-usertree`<br>`tlmgr --usermode install biblatex biblatex-apa csquotes logreq`<br>`brew install biber` | No `sudo` |
| **B — global** | `sudo tlmgr update --self`<br>`sudo tlmgr install biber biblatex biblatex-apa csquotes logreq` | Requires admin |

> `biber` and `biblatex` must be compatible versions (e.g. biber 2.21 ↔ biblatex 3.21).

## Compilation

APA 7 uses `biblatex` with the `biber` backend, so the sequence is:

```bash
pdflatex upbthesis
biber    upbthesis
pdflatex upbthesis
pdflatex upbthesis
```

Or simply `latexmk -pdf upbthesis.tex` (it detects `biber` automatically). In GUI
editors (TeXShop, TeXstudio, VS Code/LaTeX Workshop, Overleaf), set the
bibliography engine to **biber** (not bibtex).

## Usage

```latex
\documentclass[12pt,oneside,onehalfspace,apa,spanish]{upbthesis}
```

### Class options

| Group | Options | Default |
|---|---|---|
| Font size | `10pt` · `11pt` · `12pt` | `12pt` |
| Sides | `oneside` · `twoside` | `oneside` |
| Line spacing | `singlespace` · `onehalfspace` · `doublespace` | `onehalfspace` |
| Chapter opening | `openany` · `openright` | `openany` |
| Format / citations | **`apa`** (APA 7) · `numcit` (Vancouver) · `icontec` | `apa` |
| Language | `spanish` · `english` | `spanish` |
| Print | `print` (symmetric margins) | — |
| Typeface | `sserif` (sans serif) | serif |

> `apa`, `numcit` and `icontec` are mutually exclusive: choosing `numcit` or
> `icontec` disables `apa` and falls back to the classic `\begin{thebibliography}`.

### Title-page metadata

```latex
\title{...}   \author{...}
\school{...}  \faculty{...}  \address{...}
\degree{...}  \director{...}
\logo{img/logo-upb.png}   % optional; this is the default
\logowidth{8cm}           % optional
```

### Document structure (environment API)

```latex
\frontmatter
\maketitle                 % cover with logo (single page in apa mode)
\originality               % UPB originality statement
\begin{dedication}...\end{dedication}
\begin{acknowledgements}...\end{acknowledgements}
\begin{resumen}...\end{resumen}    \begin{pclave}...\end{pclave}
\begin{abstract}...\end{abstract}  \begin{keywords}...\end{keywords}
\tableofcontents  \listoftables  \listoffigures
\begin{siglas}...\end{siglas}      % acronyms & abbreviations
\begin{gloss}...\end{gloss}        % glossary
\mainmatter
\begin{introduction}...\end{introduction}
\chapter{...}  \section{...}  \subsection{...}  \subsubsection{...}
\chapter{Conclusions}      % numbered (or \begin{conclusions}…\end{conclusions} for unnumbered)
\begin{recommendations}...\end{recommendations}   % optional
\appendix  \chapter{...}                           % appendices (optional)
\printbibliography[heading=bibintoc,title={Referencias}]
```

### APA 7 citations

```latex
\addbibresource{upbthesis.bib}   % in the preamble
...
\parencite{key}    % -> (Author, Year)
\textcite{key}     % -> Author (Year)
```

Load `hyperref` **last** in the preamble (after `\addbibresource`).

> **No `biber`?** As a fallback, `apacite` gives APA-like output with `bibtex`
> (closer to APA 6): install `apacite`, use the `numcit` option, and replace
> `\printbibliography` with `\usepackage{apacite}` + `\bibliography{upbthesis}`.

To use the class from any folder, place `upbthesis.cls` next to your document, or
install it in your personal tree (`~/Library/texmf/tex/latex/upbthesis/`, then run
`mktexlsr`).

## Credits

Original `upbthesis.cls` © **Universidad Pontificia Bolivariana** (2011), created
by **Juan Alberto Ramírez Macías** (Faculty of Mechanical Engineering).

v3.0 (2026) update — UTF-8, babel, UPB logo and APA 7 — by
**Fabio Andrés Guzmán Figueroa, PhD** (Faculty of Electronic Engineering).
