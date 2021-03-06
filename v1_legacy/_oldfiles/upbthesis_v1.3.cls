% upbthesis.cls
%
% Creado por:
% Juan Alberto Ram�rez Mac�as
% Facultad de Ingenier�a Mec�nica
% Grupo de Autom�tica y Dise�o A+D
% Universidad Pontificia Bolivariana
% email: juan.ramirez@upb.edu.co
%
% La Universidad Pontificia Bolivariana es propietaria de los derechos de autor de esta plantilla - 2011
% 
% v0.0 - versi�n inicial con elementos b�sicos y funcionales para crear documentos. Se usa bibliograf�a con n�mero entre corchetes.
% v0.1 - posibilidad para crear bibliograf�as ICONTEC, usando la opci�n icontec � con n�mero entre corchetes, usando la opci�n numcit (por defecto).
% v0.2 - correcci�n de error en bibliograf�a que se generaba usando el paquete hyperref.
% v0.3 - inclusi�n del comando \appendix para la generaci�n de anexos y correcci�n en la p�gina de aprobaci�n.
% v1.0 - primera versi�n oficial de la plantilla
% v1.1 - correcci�n de espacio antes de \paragraph
% v1.2 - correcci�n de hiperv�culos de introducci�n, conclusiones, recomendaciones y bibliograf�a.
% v1.3 - nueva versi�n de m�rgenes
%
% Bibliografia:
% * book.cls
% * Goosens et. al., ''The LaTeX Companion'', 2 ed.
% * Lamport, ''LaTeX a document preparation system'', 2 ed.
% * http://en.wikibooks.org/wiki/LaTeX

\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{upbthesis}[2010/01/27 v1.1 UPB LaTeX Thesis class]
%\newcommand\@ptsize{}
%\newif\if@restonecol
%\newif\if@titlepage
%\@titlepagetrue
\newif\if@openright
\newif\if@mainmatter \@mainmattertrue
\newif\if@numcit
\newif\if@print \@printfalse
% Options declaration
\DeclareOption{10pt}{\renewcommand\normalsize{\fontsize{10pt}{10pt}\selectfont}}
\DeclareOption{11pt}{\renewcommand\normalsize{\fontsize{11pt}{11pt}\selectfont}}
\DeclareOption{12pt}{\renewcommand\normalsize{\fontsize{12pt}{12pt}\selectfont}}
\DeclareOption{oneside}{\@twosidefalse}% \@mparswitchfalse
\DeclareOption{twoside}{\@twosidetrue}% \@mparswitchtrue
\DeclareOption{print}{\@printtrue}
\DeclareOption{singlespace}{\renewcommand\baselinestretch{1}}
\DeclareOption{onehalfspace}{\renewcommand\baselinestretch{1.5}}
\DeclareOption{doublespace}{\renewcommand\baselinestretch{2}}
\DeclareOption{openright}{\@openrighttrue}
\DeclareOption{openany}{\@openrightfalse}
\DeclareOption{sserif}{\renewcommand\familydefault{cmss}}
\DeclareOption{numcit}{\@numcittrue}
\DeclareOption{icontec}{\@numcitfalse}
\ExecuteOptions{12pt,twoside,onehalfspace,openright,numcit}
\ProcessOptions
% Spanish special characters 
\RequirePackage[latin1]{inputenc}
\RequirePackage{multicol}
% Paper dimensions
\setlength{\paperwidth}{8.5in}
\setlength{\paperheight}{11in}
% Text dimensions
\setlength{\textwidth}{156mm}%
\setlength{\textheight}{219.4mm}
% Margins
\if@print
	\if@twoside
		\setlength{\oddsidemargin}{14.6mm}% 30mm margin (30 - 25.4)
		\setlength{\evensidemargin}{-5.4mm}% 30mm margin (30 - 25.4)
		\def\ps@headings{
		\def\@oddfoot{\hfil\thepage}
		\def\@evenfoot{\thepage\hfil}
		}
	\else
		\setlength{\oddsidemargin}{14.6mm}% 30mm margin (30 - 25.4)
		\setlength{\evensidemargin}{14.6mm}% 30mm margin (30 - 25.4)
		\def\ps@headings{
		\def\@oddfoot{\hfil\thepage\hfil}
		}
	\fi
\else
	\if@twoside
		\setlength{\oddsidemargin}{4.6mm}% 30mm margin (30 - 25.4)
		\setlength{\evensidemargin}{4.6mm}% 30mm margin (30 - 25.4)
		\def\ps@headings{
		\def\@oddfoot{\hfil\thepage}
		\def\@evenfoot{\thepage\hfil}
		}
	\else
		\setlength{\oddsidemargin}{4.6mm}% 30mm margin (30 - 25.4)
		\setlength{\evensidemargin}{4.6mm}% 30mm margin (30 - 25.4)
		\def\ps@headings{
		\def\@oddfoot{\hfil\thepage\hfil}
		}
	\fi
\fi
% Section page
\def\ps@atsectionini{
	\setlength{\topmargin}{14.6mm}
	\setlength{\textheight}{109.4mm}
}
% Header, footer and magins definition
\setlength{\topmargin}{4.6mm}
\setlength{\headsep}{0pt} % Header separation
\setlength{\headheight}{0pt} % Header height
\setlength{\footskip}{15mm} % Footer position
%\setlength\lineskip{24pt}
%\setlength\normallineskip{12pt}
\setlength{\parskip}{12pt} % Space between paragraphs
\setlength{\parindent}{0pt} % Indentation of paragraph
% Numbering
\pagenumbering{arabic}
% Title
\newcommand\@school{}
\newcommand\@faculty{}
\newcommand\@address{}
\newcommand\@degree{}
\newcommand\@director{}
\newcommand\school[1]{\gdef\@school{#1}}
\newcommand\faculty[1]{\gdef\@faculty{#1}}
\newcommand\address[1]{\gdef\@address{#1}}
\newcommand\degree[1]{\gdef\@degree{#1}}
\newcommand\director[1]{\gdef\@director{#1}}
\newcommand\maketitle{
	\begin{center}%
    {\bfseries\@title}
    \vfill
    {\bfseries\@author}
      \vfill
    {\bfseries
    	\begin{tabular}[t]{c}%
      	UNIVERSIDAD PONTIFICIA BOLIVARIANA \\
      	{\MakeUppercase\@school} \\
      	{\MakeUppercase\@faculty} \\
      	{\MakeUppercase\@address} \\
      	\number\year
      \end{tabular}}
  \end{center}
  \if@twoside\cleardoublepage\else\clearpage\fi
  \begin{center}%
    {\bfseries\@title}
    \vfill%
    {\bfseries
    	%\begin{tabular}[t]{c}%\MakeUppercase
        \@author
      %\end{tabular}
      }%
    \vfill
    {\bfseries \@degree}
    \vfill
    {\bfseries
    	\begin{tabular}[t]{c}%
      	Director \\
        \@director
      \end{tabular}}
    \vfill
    {\bfseries
    	\begin{tabular}[t]{c}%
      	UNIVERSIDAD PONTIFICIA BOLIVARIANA \\
      	{\MakeUppercase\@school} \\
      	{\MakeUppercase\@faculty} \\
      	{\MakeUppercase\@address} \\
      	\number\year
      \end{tabular}}
  \end{center}
  \thispagestyle{empty}
  }
% Table of contents page dimensions
\newcommand\@pnumwidth{1.55em} % Table of contents page number width
\newcommand\@tocrmarg{2.55em} % Table of contents right margin
\newcommand\@dotsep{4.5} % Table of contents dot separation4.5
\setcounter{tocdepth}{4}
% Sectioning definitions
\setcounter{secnumdepth}{4}
\newcounter{section}
\newcounter{subsection}[section]
\newcounter{subsubsection}[subsection]
\newcounter{paragraph}[subsubsection]
\newcounter{subparagraph}[paragraph]
\renewcommand\thesection{\arabic{section}.}
\renewcommand\thesubsection{\thesection\arabic{subsection}.}
\renewcommand\thesubsubsection{\thesubsection\arabic{subsubsection}.}
\renewcommand\theparagraph{\thesubsubsection\arabic{paragraph}.}
\newcommand\section{\if@openright\cleardoublepage\else\clearpage\fi
																	 \vspace*{-10mm}
																	 \@startsection{section}{1}{0pt}%
                                   {-3\baselineskip}
                                   {2\baselineskip}
                                   {\centering\normalfont\normalsize\bfseries\MakeUppercase}}
\newcommand\subsection{\@startsection{subsection}{2}{0pt}
                                     {-2\baselineskip}
                                     {\baselineskip}
                                     {\normalfont\normalsize\bfseries\MakeUppercase}}
\newcommand\subsubsection{\@startsection{subsubsection}{3}{0pt}
                                     {-\baselineskip}
                                     {0.25\baselineskip}
                                     {\normalfont\normalsize\itshape}}
\newcommand\paragraph{\@startsection{paragraph}{4}{0pt}
                                    {-0.5\baselineskip}
                                    {-1em}
                                    {\normalfont\normalsize}}
\newcommand\appendix{\if@openright\cleardoublepage\else\clearpage\fi
																	 \vspace*{-10mm}
																	 {\vfill\begin{center}\bf ANEXOS\end{center}\vfill\null\vfill}
																	 \phantomsection\addcontentsline{toc}{section}{\protect ANEXOS}
																	 \setcounter{section}{0}
																	 \gdef\thesection{\Alph{section}.}}
% Itemized list
\def\@listi{\leftmargin 2em
            \parsep 0pt
            \topsep 0pt
            \itemsep 0pt
            \labelsep 1em
            \labelwidth 1em
            \listparindent 2em}
\def\@listii {\leftmargin 2em
              \parsep 0pt
            	\topsep 0pt
            	\itemsep 0pt
            	\labelsep 1em
            	\labelwidth 1em
            	\listparindent 2em}
\def\@listiii{\leftmargin 2em
              \parsep 0pt
            	\topsep 0pt
            	\itemsep 0pt
            	\labelsep 1em
            	\labelwidth 1em
            	\listparindent 2em}
\def\@listiv {\leftmargin 2em
              \parsep 0pt
            	\topsep 0pt
            	\itemsep 0pt
            	\labelsep 1em
            	\labelwidth 1em
            	\listparindent 2em}
\def\@listv  {\leftmargin 2em
              \parsep 0pt
            	\topsep 0pt
            	\itemsep 0pt
            	\labelsep 1em
            	\labelwidth 1em
            	\listparindent 2em}
\def\@listvi {\leftmargin 2em
              \parsep 0pt
            	\topsep 0pt
            	\itemsep 0pt
            	\labelsep 1em
            	\labelwidth 1em
            	\listparindent 2em}
% Enumeration labels
\renewcommand\theenumi{\@arabic\c@enumi}
\renewcommand\theenumii{\@alph\c@enumii}
\renewcommand\theenumiii{\@roman\c@enumiii}
\renewcommand\theenumiv{\@Alph\c@enumiv}
\newcommand\labelenumi{\theenumi.}
\newcommand\labelenumii{(\theenumii)}
\newcommand\labelenumiii{\theenumiii.}
\newcommand\labelenumiv{\theenumiv.}
\renewcommand\p@enumii{\theenumi}
\renewcommand\p@enumiii{\theenumi(\theenumii)}
\renewcommand\p@enumiv{\p@enumiii\theenumiii}
% Itemize labels
\newcommand\labelitemi{\textbullet}
\newcommand\labelitemii{\normalfont\bfseries \textendash}
\newcommand\labelitemiii{\textasteriskcentered}
\newcommand\labelitemiv{\textperiodcentered}
% Equation environment
\@addtoreset{equation}{chapter}
\renewcommand\theequation{\arabic{equation}}
\newcounter{figure}
% Figure environment
\renewcommand\thefigure{\arabic{figure}}
\def\fps@figure{tbp}
\def\ftype@figure{1}
\def\ext@figure{lof}
\def\fnum@figure{\figurename\nobreakspace\thefigure}
\newenvironment{figure}
               {\@float{figure}}
               {\end@float}
\newenvironment{figure*}
               {\@dblfloat{figure}}
               {\end@dblfloat}
% Table environment
\newcounter{table}
\renewcommand\thetable{\arabic{table}}
\def\fps@table{tbp}
\def\ftype@table{2}
\def\ext@table{lot}
\def\fnum@table{\tablename\nobreakspace\thetable}
\newenvironment{table}
               {\@float{table}}
               {\end@float}
\newenvironment{table*}
               {\@dblfloat{table}}
               {\end@dblfloat}
% Caption definition
\newlength\abovecaptionskip
\newlength\belowcaptionskip
\setlength\abovecaptionskip{10pt}
\setlength\belowcaptionskip{6pt}
\newcommand\@makecaption[2]{%
  \vskip\abovecaptionskip
  \sbox\@tempboxa{#1. #2}%
  \ifdim \wd\@tempboxa >\hsize
    #1. #2\par
  \else
    \global \@minipagefalse
    \hb@xt@\hsize{\box\@tempboxa\hfil}%
  \fi
  \vskip\belowcaptionskip}
% Approvalpage
\newcommand\approvalpage{\if@openright\cleardoublepage\else\clearpage\fi
												\twocolumn\null\vfill\@address, \today \newpage
												Nota de aceptaci�n\par
												\vspace{48pt}
												\null\hrulefill\null\par
												\vspace{24pt}
												\null\hrulefill\null\\
												\null\hrulefill\null\\
												\null\hrulefill\null\par
												\vspace{48pt}
												\null\hrulefill\null\\
												Firma\\
												Nombre:\\
												Presidente del jurado\par
												%\vspace{48pt}
												\null\hrulefill\null\\
												Firma\\
												Nombre:\\
												Jurado\par
												\null\hrulefill\null\\
												Firma\\
												Nombre:\\
												Jurado
												\onecolumn}
% Dedication environment
\newenvironment{dedication}
               {\if@openright\cleardoublepage\else\clearpage\fi
               \null\vfil\begin{center}}%
               {\end{center}\vfil}
% Acknowledgements environment
\newenvironment{acknowledgements}
               {\section*{Agradecimientos}}
               {}
% Glossary environment
\newenvironment{gloss}
               {\section*{Glosario}}
               {}
% Abstract environment
\newenvironment{abstract}
               {\section*{Resumen}}
               {}
% Keywords environment
\newenvironment{keywords}
               {\subsection*{Palabras Clave:}}
               {}
% Introduction
\newenvironment{introduction}
               {\phantomsection\addcontentsline{toc}{section}{\protect INTRODUCCI�N}
							 \section*{Introducci�n}}
               {}
% Conclusions
\newenvironment{conclusions}
               {\phantomsection\addcontentsline{toc}{section}{\protect CONCLUSIONES}
							 \section*{Conclusiones}}
               {}
% Recommendations
\newenvironment{recommendations}
               {\phantomsection\addcontentsline{toc}{section}{\protect RECOMENDACIONES}
							 \section*{Recomendaciones}}
               {}
% Frontmatter - Mainmatter - Backmatter
\newcommand\frontmatter{%
    \cleardoublepage
  \@mainmatterfalse
  \pagestyle{empty}}
\newcommand\mainmatter{%
    \cleardoublepage
  \@mainmattertrue
  \pagestyle{headings}}
\newcommand\backmatter{%
  \if@openright
    \cleardoublepage
  \else
    \clearpage
  \fi
  \@mainmatterfalse}
% Shortcut commands
\DeclareOldFontCommand{\rm}{\normalfont\rmfamily}{\mathrm}
\DeclareOldFontCommand{\sf}{\normalfont\sffamily}{\mathsf}
\DeclareOldFontCommand{\tt}{\normalfont\ttfamily}{\mathtt}
\DeclareOldFontCommand{\bf}{\normalfont\bfseries}{\mathbf}
\DeclareOldFontCommand{\it}{\normalfont\itshape}{\mathit}
\DeclareOldFontCommand{\sl}{\normalfont\slshape}{\@nomath\sl}
\DeclareOldFontCommand{\sc}{\normalfont\scshape}{\@nomath\sc}
\DeclareRobustCommand*\cal{\@fontswitch\relax\mathcal}
\DeclareRobustCommand*\mit{\@fontswitch\relax\mathnormal}
% Definition of the table of contents command
\newcommand\tableofcontents{%
    \section*{\MakeUppercase\contentsname}
		\begin{flushright}{P\'{a}g.}\end{flushright}%
    \@starttoc{toc}%
    }
% Table of contents numbers and lines dimensions
\newcommand*\l@section{\@dottedtocline{1}{0pt}{2.3em}}
\newcommand*\l@subsection{\@dottedtocline{2}{0pt}{3.2em}}
\newcommand*\l@subsubsection{\@dottedtocline{3}{0pt}{4.1em}}
\newcommand*\l@paragraph{\@dottedtocline{4}{0pt}{5em}}
% List of tables and list of figures
\newcommand\listoffigures{%
    \section*{\MakeUppercase\listfigurename}%
    \begin{flushright}{P\'{a}g.}\end{flushright}
    \@starttoc{lof}%
    }
\newcommand*\l@figure{\@dottedtocline{1}{0pt}{2.3em}}
\newcommand\listoftables{%
    \section*{\listtablename}%
    \begin{flushright}{P\'{a}g.}\end{flushright}
    \@starttoc{lot}%
    }
\let\l@table\l@figure % Command copy/paste
% Table and array dimensions
\setlength\arraycolsep{5\p@}
\setlength\tabcolsep{6\p@}
\setlength\arrayrulewidth{.4\p@}
\setlength\doublerulesep{2\p@}
%\setlength\tabbingsep{\labelsep}
%\skip\@mpfootins = \skip\footins
%\setlength\fboxsep{3\p@}
%\setlength\fboxrule{.4\p@}
% Footnotes
\@addtoreset{footnote}{page}
\newcommand\@makefntext[1]{%
    \parindent 1em%
    \noindent
    \hb@xt@1.8em{\hss\@makefnmark}#1}
\newcommand\footnotesize{%
   \@setfontsize\footnotesize\@viiipt{9.5}%
   \abovedisplayskip 6\p@ \@plus2\p@ \@minus4\p@
   \abovedisplayshortskip \z@ \@plus\p@
   \belowdisplayshortskip 3\p@ \@plus\p@ \@minus2\p@
   \def\@listi{\leftmargin\leftmargini
               \topsep 3\p@ \@plus\p@ \@minus\p@
               \parsep 2\p@ \@plus\p@ \@minus\p@
               \itemsep \parsep}%
   \belowdisplayskip \abovedisplayskip
}
\setlength\footnotesep{12pt}
\setlength{\skip\footins}{24pt}
\if@numcit
	\renewcommand\thefootnote{\fnsymbol{footnote}}
\else
	\renewcommand\thefootnote{\arabic{footnote}}
\fi
\renewcommand\footnoterule{%
  \vspace*{-3pt}
  \hrule width 2in height 0.4pt
  \vspace*{2.6pt}}
\if@numcit
% The bibliography numcit
\newenvironment{thebibliography}[1]
     {\section*{\bibname}
     \phantomsection\addcontentsline{toc}{section}{BIBLIOGRAF�A}%
      \list{\@biblabel{\@arabic\c@enumiv}}
           {\leftmargin 0pt
            \parsep 12pt
            \topsep 0pt
           	\itemsep 0pt
           	\labelsep 1em
            \labelwidth 1em
            \listparindent 2em
          	\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      }
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist}
\else
% The bibliography icontec
\newenvironment{thebibliography}
     {\section*{\bibname}
     \phantomsection\addcontentsline{toc}{section}{BIBLIOGRAF�A}%\MakeUppercase{\bibname}
      \list{}
           {\leftmargin 0pt
            \parsep 12pt
            \topsep 0pt
           	\itemsep 0pt
           	\labelsep 1em
            \labelwidth 1em
            \listparindent 2em
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      }
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist}
\fi
\def\newblock{\hskip .11em plus .33em minus .07em}
% Names
\newcommand\contentsname{Contenido}
\newcommand\listfigurename{Lista de Figuras}
\newcommand\listtablename{Lista de Tablas}
\newcommand\bibname{Bibliograf�a}
\newcommand\indexname{Glosario}
\newcommand\figurename{Figura}
\newcommand\tablename{Tabla}
\newcommand\appendixname{Ap�ndice}
\def\today{\ifcase\month\or
  Enero\or Febrero\or Marzo\or Abril\or Mayo\or Junio\or
  Julio\or Agosto\or Septiembre\or Octubre\or Noviembre\or Diciembre\fi
  \space\number\day{} de \number\year}