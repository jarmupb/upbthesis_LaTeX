% upbthesis.cls
%
% Plantilla LaTeX para tesis y trabajos de grado de la
% Universidad Pontificia Bolivariana (UPB).
%
% Autor original:
%   Juan Alberto Ramírez Macías
%   Facultad de Ingeniería Mecánica - Grupo de Automática y Diseño A+D
%   Universidad Pontificia Bolivariana, 2011
%   email: juan.ramirez@upb.edu.co
%
% Actualización v3.0 (2026):
%   PhD. Fabio Andrés Guzmán Figueroa
%   Facultad de Ingeniería Electrónica
%
% La Universidad Pontificia Bolivariana es propietaria de los derechos de
% autor de la plantilla original (2011).
%
% Historial original (v0.0 - v2.2): ver https://github.com/jarmupb/upbthesis_LaTeX
%   v2.2 - actualización de la declaración de originalidad según el reglamento
%          estudiantil de posgrado más reciente.
%
% --- Fork modernizado --------------------------------------------------------
% v3.0 (2026) - Modernización manteniendo la API pública de la clase:
%   * Codificación UTF-8 (antes latin1) + fontenc T1 + Latin Modern.
%   * babel (español/inglés) para una correcta separación silábica.
%   * Logo institucional integrado en la portada (comando \logo).
%   * Nueva opción de clase "apa": formato y bibliografía conforme a APA 7
%     (rótulos de tabla/figura arriba en negrita + título en cursiva,
%      encabezado con solo el número de página, numeración global de tablas
%      y figuras, niveles de título APA, portada de una página con logo,
%      bibliografía con biblatex estilo apa / backend biber).
%   * Se conserva el formato clásico (Vancouver/ICONTEC, doble portada) cuando
%     NO se usa la opción "apa", para compatibilidad con documentos previos.
% -----------------------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}[2018/04/01]
\ProvidesClass{upbthesis}[2026/05/27 v3.0 UPB LaTeX Thesis class (APA 7)]

\newif\if@openright
\newif\if@mainmatter \@mainmattertrue
\newif\if@numcit
\newif\if@print \@printfalse
\newif\if@english \@englishfalse
\newif\if@apa \@apafalse
\newif\if@xptsize \@xptsizefalse
\newif\if@xiptsize \@xiptsizefalse
\newif\if@xiiptsize \@xiiptsizefalse

% Options declaration
\DeclareOption{10pt}{\@xptsizetrue}
\DeclareOption{11pt}{\@xiptsizetrue}
\DeclareOption{12pt}{\@xiiptsizetrue}
\DeclareOption{oneside}{\@twosidefalse}
\DeclareOption{twoside}{\@twosidetrue}
\DeclareOption{print}{\@printtrue}
\DeclareOption{singlespace}{\renewcommand\baselinestretch{1}}
\DeclareOption{onehalfspace}{\renewcommand\baselinestretch{1.5}}
\DeclareOption{doublespace}{\renewcommand\baselinestretch{2}}
\DeclareOption{openright}{\@openrighttrue}
\DeclareOption{openany}{\@openrightfalse}
\DeclareOption{sserif}{\renewcommand\familydefault{\sfdefault}}
% numcit / icontec / apa son excluyentes: elegir una desactiva apa.
\DeclareOption{numcit}{\@numcittrue\@apafalse}
\DeclareOption{icontec}{\@numcitfalse\@apafalse}
\DeclareOption{apa}{\@apatrue}
\DeclareOption{english}{\@englishtrue}
\DeclareOption{spanish}{\@englishfalse}
% Defaults de la plantilla moderna: entrega digital, una cara, APA 7, español.
\ExecuteOptions{12pt,oneside,onehalfspace,openany,apa,spanish}
\ProcessOptions

% --- Tamaños de fuente -------------------------------------------------------
% IMPORTANTE: se definen ANTES de cargar paquetes (microtype, caption, etc.),
% porque algunos invocan \normalsize / \footnotesize al cargarse.
% 10pt
\if@xptsize
	\renewcommand\normalsize{\fontsize{10pt}{10pt}\selectfont}
	\newcommand\small{%
	   \@setfontsize\small\@ixpt{11}%
	   \abovedisplayskip 8.5\p@ \@plus3\p@ \@minus4\p@
	   \abovedisplayshortskip \z@ \@plus2\p@
	   \belowdisplayshortskip 4\p@ \@plus2\p@ \@minus2\p@
	   \def\@listi{\leftmargin\leftmargini
				   \topsep 4\p@ \@plus2\p@ \@minus2\p@
				   \parsep 2\p@ \@plus\p@ \@minus\p@
				   \itemsep \parsep}%
	   \belowdisplayskip \abovedisplayskip
	}
	\newcommand\scriptsize{\@setfontsize\scriptsize\@viipt\@viiipt}
	\newcommand\tiny{\@setfontsize\tiny\@vpt\@vipt}
	\newcommand\large{\@setfontsize\large\@xiipt{14}}
	\newcommand\Large{\@setfontsize\Large\@xivpt{18}}
	\newcommand\LARGE{\@setfontsize\LARGE\@xviipt{22}}
	\newcommand\huge{\@setfontsize\huge\@xxpt{25}}
	\newcommand\Huge{\@setfontsize\Huge\@xxvpt{30}}
\else
% 11pt
\if@xiptsize
	\renewcommand\normalsize{\fontsize{11pt}{11pt}\selectfont}
	\newcommand\small{%
	   \@setfontsize\small\@xpt\@xiipt
	   \abovedisplayskip 10\p@ \@plus2\p@ \@minus5\p@
	   \abovedisplayshortskip \z@ \@plus3\p@
	   \belowdisplayshortskip 6\p@ \@plus3\p@ \@minus3\p@
	   \def\@listi{\leftmargin\leftmargini
				   \topsep 6\p@ \@plus2\p@ \@minus2\p@
				   \parsep 3\p@ \@plus2\p@ \@minus\p@
				   \itemsep \parsep}%
	   \belowdisplayskip \abovedisplayskip
	}
	\newcommand\scriptsize{\@setfontsize\scriptsize\@viiipt{9.5}}
	\newcommand\tiny{\@setfontsize\tiny\@vipt\@viipt}
	\newcommand\large{\@setfontsize\large\@xiipt{14}}
	\newcommand\Large{\@setfontsize\Large\@xivpt{18}}
	\newcommand\LARGE{\@setfontsize\LARGE\@xviipt{22}}
	\newcommand\huge{\@setfontsize\huge\@xxpt{25}}
	\newcommand\Huge{\@setfontsize\Huge\@xxvpt{30}}
\else
% 12pt
\if@xiiptsize
	\renewcommand\normalsize{\fontsize{12pt}{12pt}\selectfont}
	\newcommand\small{%
	   \@setfontsize\small\@xipt{13.6}%
	   \abovedisplayskip 11\p@ \@plus3\p@ \@minus6\p@
	   \abovedisplayshortskip \z@ \@plus3\p@
	   \belowdisplayshortskip 6.5\p@ \@plus3.5\p@ \@minus3\p@
	   \def\@listi{\leftmargin\leftmargini
				   \topsep 9\p@ \@plus3\p@ \@minus5\p@
				   \parsep 4.5\p@ \@plus2\p@ \@minus\p@
				   \itemsep \parsep}%
	   \belowdisplayskip \abovedisplayskip
	}
	\newcommand\scriptsize{\@setfontsize\scriptsize\@viiipt{9.5}}
	\newcommand\tiny{\@setfontsize\tiny\@vipt\@viipt}
	\newcommand\large{\@setfontsize\large\@xivpt{18}}
	\newcommand\Large{\@setfontsize\Large\@xviipt{22}}
	\newcommand\LARGE{\@setfontsize\LARGE\@xxpt{25}}
	\newcommand\huge{\@setfontsize\huge\@xxvpt{30}}
	\let\Huge=\huge
\fi
\fi
\fi
% \footnotesize (también puede ser invocada por paquetes al cargar)
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

% --- Codificación y tipografía moderna --------------------------------------
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage{lmodern}
% --- Idioma (separación silábica y cadenas) ---------------------------------
\if@english
  \RequirePackage[spanish,main=english]{babel}
\else
  \RequirePackage[english,main=spanish]{babel}
\fi
\RequirePackage{multicol}
\RequirePackage{graphicx}

% --- Paquetes de formato APA 7 (solo en modo apa) ---------------------------
\if@apa
  \RequirePackage{array}
  \RequirePackage{booktabs}
  \RequirePackage{float}
  \RequirePackage{caption}
  \RequirePackage{fancyhdr}
  \RequirePackage{ragged2e}
  \RequirePackage{colortbl}
  \RequirePackage{microtype}
  \RequirePackage{csquotes}
  \RequirePackage[backend=biber,style=apa,sortcites=true,sorting=nyt]{biblatex}
\fi

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

% Header, footer and margins definition
\setlength{\topmargin}{-10.4mm} %
\setlength{\headheight}{5mm} % Header height
\setlength{\headsep}{12.5mm} % Header separation
\setlength{\footskip}{10mm} % Footer position

\setlength{\parskip}{12pt} % Space between paragraphs
\setlength{\parindent}{0pt} % Indentation of paragraph

% Numbering
\pagenumbering{arabic}

% --- Datos de la portada -----------------------------------------------------
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
% Logo institucional (opcional). Por defecto img/logo-upb.png.
\newcommand\@logo{img/logo-upb.png}
\newcommand\logo[1]{\gdef\@logo{#1}}
\newcommand\@logowidth{8cm}
\newcommand\logowidth[1]{\gdef\@logowidth{#1}}

\if@twoside
  \def\ps@headings{%
      \def\@evenhead{\thepage\hfil\slshape\leftmark}%
      \def\@oddhead{{\slshape\rightmark}\hfil\thepage}%
      \let\@mkboth\markboth
    \def\chaptermark##1{%
      \markboth {\MakeUppercase{%
        \ifnum \c@secnumdepth >\m@ne
          \if@mainmatter
            \@chapapp\ \thechapter. \ %
          \fi
        \fi
        ##1}}{}}%
    \def\sectionmark##1{%
      \markright {\MakeUppercase{%
        \ifnum \c@secnumdepth >\z@
          \thesection. \ %
        \fi
        ##1}}}}
\else
  \def\ps@headings{%
    \def\@oddhead{{\slshape\rightmark}\hfil\thepage}%
    \let\@mkboth\markboth
    \def\chaptermark##1{%
      \markright {\MakeUppercase{%
        \ifnum \c@secnumdepth >\m@ne
          \if@mainmatter
            \@chapapp\ \thechapter. \ %
          \fi
        \fi
        ##1}}}}
\fi

% --- Portada -----------------------------------------------------------------
% \maketitle selecciona la portada clásica (doble página) o la portada APA
% (una página, con logo) según la opción de clase.
\newcommand\maketitle{\if@apa\@maketitleapa\else\@maketitleclassic\fi}

% Portada APA (una página): logo, título, autor, grado, director e institución.
\newcommand\@maketitleapa{%
  \thispagestyle{empty}%
  \begin{center}%
    \vspace*{1cm}%
    \IfFileExists{\@logo}{%
      \includegraphics[width=\@logowidth]{\@logo}\\[0.9cm]%
    }{%
      \ClassWarning{upbthesis}{No se encontro el archivo de logo '\@logo';
        la portada se genera sin logo}%
    }%
    {\hyphenpenalty=10000 \large\bfseries\@title\par}\vspace{1.3cm}%
    {\normalsize\@author\par}\vspace{1.3cm}%
    \@degree\par\vspace{1.3cm}%
    \if@english Advisor\else Director\fi\par\vspace{0.2cm}%
    \@director\par\vspace{2.2cm}%
    Universidad Pontificia Bolivariana\par\vspace{0.15cm}%
    \@school\par\vspace{0.15cm}%
    \@faculty\par\vspace{0.15cm}%
    \@address\par\vspace{0.15cm}%
    \number\year\par%
  \end{center}%
  \clearpage}

% Portada clásica (doble página, en mayúsculas) -- compatibilidad v2.x.
\newcommand\@maketitleclassic{%
	\begin{center}%
    {\bfseries\@title}
    \vfill
    {\bfseries\MakeUppercase\@author}
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
        {\MakeUppercase\@author}
      }%
    \vfill
    {\bfseries \@degree}
    \vfill
    {\bfseries
    	\begin{tabular}[t]{c}%
      	\if@english Advisor(s) \else Director(es) \fi \\
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
\newcommand\@dotsep{4.5} % Table of contents dot separation
\setcounter{tocdepth}{4}
% Sectioning definitions
\setcounter{secnumdepth}{4}
\newcounter{part}
\newcounter{chapter}
\newcounter{section}[chapter]
\newcounter{subsection}[section]
\newcounter{subsubsection}[subsection]
\newcounter{paragraph}[subsubsection]
% Appendix name
\newcommand\appname{ANEXOS}
\if@english
\renewcommand\appname{APPENDIX}
\fi
% Sections
\renewcommand\thepart{\Roman{part}}
\renewcommand\thechapter{\arabic{chapter}}
\renewcommand\thesection{\thechapter.\arabic{section}}
\renewcommand\thesubsection{\thesection.\arabic{subsection}}
\renewcommand\thesubsubsection{\thesubsection.\arabic{subsubsection}}
\renewcommand\theparagraph{\thesubsubsection.\arabic{paragraph}}

\newcommand\@chapapp{\chaptername}

% Marcas por defecto: \chaptermark/\sectionmark solo se (re)definen al activar
% \pagestyle{headings}; en modo apa (pagestyle fancy) deben existir igualmente.
\providecommand\chaptermark[1]{}
\providecommand\sectionmark[1]{}

\newcommand\part{%
  \if@openright
    \cleardoublepage
  \else
    \clearpage
  \fi
  \thispagestyle{plain}%
  \if@twocolumn
    \onecolumn
    \@tempswatrue
  \else
    \@tempswafalse
  \fi
  \null\vfil
  \secdef\@part\@spart}

\def\@part[#1]#2{%
    \ifnum \c@secnumdepth >-2\relax
      \refstepcounter{part}%
      \addcontentsline{toc}{part}{\thepart\hspace{1em}#1}%
    \else
      \addcontentsline{toc}{part}{#1}%
    \fi
    \markboth{}{}%
    {\centering
     \interlinepenalty \@M
     \normalfont
     \ifnum \c@secnumdepth >-2\relax
       \huge\bfseries \partname\nobreakspace\thepart
       \par
       \vskip 20\p@
     \fi
     \Huge \bfseries #2\par}%
    \@endpart}
\def\@spart#1{%
    {\centering
     \interlinepenalty \@M
     \normalfont
     \Huge \bfseries #1\par}%
    \@endpart}
\def\@endpart{\vfil\newpage
              \if@twoside
               \if@openright
                \null
                \thispagestyle{empty}%
                \newpage
               \fi
              \fi
              \if@tempswa
                \twocolumn
              \fi}
\newcommand\chapter{\if@openright\cleardoublepage\else\clearpage\fi
                    \thispagestyle{plain}%
                    \global\@topnum\z@
                    \@afterindentfalse
                    \secdef\@chapter\@schapter}
\def\@chapter[#1]#2{\ifnum \c@secnumdepth >\m@ne
                       \if@mainmatter
                         \refstepcounter{chapter}%
                         \typeout{\@chapapp\space\thechapter.}%
                         \addcontentsline{toc}{chapter}%
                                   {\protect \numberline{\thechapter}#1}%
                       \else
                         \addcontentsline{toc}{chapter}{#1}%
                       \fi
                    \else
                      \addcontentsline{toc}{chapter}{#1}%
                    \fi
                    \chaptermark{#1}%
                    \addtocontents{lof}{\protect\addvspace{10\p@}}%
                    \addtocontents{lot}{\protect\addvspace{10\p@}}%
                    \if@twocolumn
                      \@topnewpage[\@makechapterhead{#2}]%
                    \else
                      \@makechapterhead{#2}%
                      \@afterheading
                    \fi}
\def\@makechapterhead#1{%
  \vspace*{50\p@}%
  {\parindent \z@ \raggedright \normalfont
    \ifnum \c@secnumdepth >\m@ne
      \if@mainmatter
        \huge\bfseries \@chapapp\space \thechapter
        \par\nobreak
        \vskip 20\p@
      \fi
    \fi
    \interlinepenalty\@M
    \Huge \bfseries #1\par\nobreak
    \vskip 40\p@
  }}
\def\@schapter#1{\if@twocolumn
                   \@topnewpage[\@makeschapterhead{#1}]%
                 \else
                   \@makeschapterhead{#1}%
                   \@afterheading
                 \fi}
\def\@makeschapterhead#1{%
  \vspace*{50\p@}%
  {\parindent \z@ \raggedright
    \normalfont
    \interlinepenalty\@M
    \Huge \bfseries  #1\par\nobreak
    \vskip 40\p@
  }}

\newcommand\section{\@startsection{section}{1}{0pt}%
                                   {-2\baselineskip}
                                   {\baselineskip}
                                   {\normalfont\normalsize\bfseries\MakeUppercase}}
\newcommand\subsection{\@startsection{subsection}{2}{0pt}
                                     {-\baselineskip}
                                     {0.5\baselineskip}
                                     {\normalfont\normalsize\itshape\MakeUppercase}}
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
															 {\vfill\begin{center}\bfseries \appname \end{center}\vfill\null\vfill}
															 \phantomsection\addcontentsline{toc}{chapter}{\protect \appname}
															 \setcounter{chapter}{0}
															 \gdef\thesection{\Alph{section}.}}
% Itemized list
\def\@listi{\leftmargin 2em
            \parsep 0pt
            \topsep 0pt
            \itemsep 0pt
            \labelsep 1em
            \labelwidth 1em
            \listparindent 2em}
\let\@listii\@listi
\let\@listiii\@listi
\let\@listiv\@listi
\let\@listv\@listi
\let\@listvi\@listi
% Enumeration labels
\renewcommand\theenumi{\@arabic\c@enumi}
\renewcommand\theenumii{\@alph\c@enumii}
\renewcommand\theenumiii{\@roman\c@enumiii}
\renewcommand\theenumiv{\@Alph\c@enumiv}
\renewcommand\labelenumi{\theenumi.}
\renewcommand\labelenumii{(\theenumii)}
\renewcommand\labelenumiii{\theenumiii.}
\renewcommand\labelenumiv{\theenumiv.}
\renewcommand\p@enumii{\theenumi}
\renewcommand\p@enumiii{\theenumi(\theenumii)}
\renewcommand\p@enumiv{\p@enumiii\theenumiii}
% Itemize labels
\renewcommand\labelitemi{\textbullet}
\renewcommand\labelitemii{\normalfont\bfseries \textendash}
\renewcommand\labelitemiii{\textasteriskcentered}
\renewcommand\labelitemiv{\textperiodcentered}
% Equation environment
\@addtoreset{equation}{chapter}
\renewcommand\theequation{\arabic{chapter}.\arabic{equation}}
\newcounter{figure}
% Figure environment
\@addtoreset{figure}{chapter}
\renewcommand\thefigure{\arabic{chapter}.\arabic{figure}}
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
\@addtoreset{table}{chapter}
\renewcommand\thetable{\arabic{chapter}.\arabic{table}}
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
% Caption definition. En modo apa lo gobierna el paquete caption (\captionsetup);
% aquí solo se define el rótulo clásico cuando NO se usa apa.
\if@apa\else
\newlength\abovecaptionskip
\newlength\belowcaptionskip
\setlength\abovecaptionskip{10pt}
\setlength\belowcaptionskip{6pt}
\newcommand\@makecaption[2]{%
  \vskip\abovecaptionskip
  \sbox\@tempboxa{#1. #2}%
  \ifdim \wd\@tempboxa >\hsize
    \small #1. #2\par
  \else
    \global \@minipagefalse
    \hb@xt@\hsize{\box\@tempboxa\hfil}%
  \fi
  \vskip\belowcaptionskip}
\fi
% Approvalpage
\newcommand\approvalpage{\if@openright\cleardoublepage\else\clearpage\fi
												\twocolumn\null\vfill\@address, \today \newpage
												Nota de aceptación\par
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
												\null\hrulefill\null\\
												Firma\\
												Nombre:\\
												Jurado\par
												\null\hrulefill\null\\
												Firma\\
												Nombre:\\
												Jurado
												\onecolumn}
% Declaración de originalidad: solo el mensaje (conforme a la tesis de referencia)
\newcommand\originality{\if@openright\cleardoublepage\else\clearpage\fi
  \noindent El contenido de este documento no ha sido presentado con anterioridad para optar a un título, ya sea en igual forma o con variaciones, en esta o en cualquiera otra universidad.\par}
% Dedication environment
\newenvironment{dedication}
               {\if@openright\cleardoublepage\else\clearpage\fi
               \null\vfil}
               {\null\vfil}
% Acknowledgements environment (contenido centrado)
\newenvironment{acknowledgements}
               {\if@openright\cleardoublepage\else\clearpage\fi
                \chapter*{\if@english Acknowledgements\else Agradecimientos\fi
                  \phantomsection\addcontentsline{toc}{chapter}{\if@english Acknowledgements\else Agradecimientos\fi}}\centering}
               {\par}
% Glossary environment
\newenvironment{gloss}
               {\section*{\if@english Glossary \else Glosario \fi}}
               {}
% Siglas / acrónimos environment (título centrado a nivel de capítulo)
\newenvironment{siglas}
               {\if@openright\cleardoublepage\else\clearpage\fi
                \chapter*{\if@english Acronyms and abbreviations\else Siglas, acrónimos y abreviaturas\fi
                  \phantomsection\addcontentsline{toc}{chapter}{\if@english Acronyms and abbreviations\else Siglas, acrónimos y abreviaturas\fi}}}
               {}
% Resumen environment
\newenvironment{resumen}
               {\if@openright\cleardoublepage\else\clearpage\fi \chapter*{Resumen \phantomsection\addcontentsline{toc}{chapter}{\protect Resumen}}}
               {}
% Abstract environment
\newenvironment{abstract}
               {\if@openright\cleardoublepage\else\clearpage\fi \chapter*{Abstract \phantomsection\addcontentsline{toc}{chapter}{\protect Abstract}}}
               {}
% Spanish keywords
\newenvironment{pclave}
               {\section*{\if@english Keywords: \else Palabras clave: \fi}}
               {}
% English keywords
\newenvironment{keywords}
               {\section*{Keywords:}}
               {}
% Introduction (título centrado, capítulo sin numerar)
\newenvironment{introduction}
               {\if@openright\cleardoublepage\else\clearpage\fi
                \chapter*{\if@english Introduction\else Introducción\fi
                  \phantomsection\addcontentsline{toc}{chapter}{\if@english Introduction\else Introducción\fi}}}
               {}
% Conclusions
\newenvironment{conclusions}
               {\phantomsection\addcontentsline{toc}{section}{\if@english \protect CONCLUSIONS \else \protect CONCLUSIONES \fi }
							 \section*{\if@english Conclusions \else Conclusiones \fi }}
               {}
% Recommendations
\newenvironment{recommendations}
               {\phantomsection\addcontentsline{toc}{section}{\if@english \protect RECOMMENDATIONS \else \protect RECOMENDACIONES \fi }
							 \section*{\if@english Recommendations \else Recomendaciones \fi }}
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
    \chapter*{\contentsname \phantomsection\addcontentsline{toc}{chapter}{\protect \contentsname}}
		\begin{flushright}{\if@english Page \else Pág. \fi}\end{flushright}%
    \@starttoc{toc}%
    }
% Table of contents numbers and lines dimensions
\newcommand*\l@part[2]{%
  \ifnum \c@tocdepth >-2\relax
    \addpenalty{-\@highpenalty}%
    \addvspace{2.25em \@plus\p@}%
    \setlength\@tempdima{3em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      {\leavevmode
       \large \bfseries #1\hfil \hb@xt@\@pnumwidth{\hss #2}}\par
       \nobreak
         \global\@nobreaktrue
         \everypar{\global\@nobreakfalse\everypar{}}%
    \endgroup
  \fi}
\newcommand*\l@chapter[2]{%
  \ifnum \c@tocdepth >\m@ne
    \addpenalty{-\@highpenalty}%
    \vskip 1.0em \@plus\p@
    \setlength\@tempdima{1.5em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode \bfseries
      \advance\leftskip\@tempdima
      \hskip -\leftskip
      #1\nobreak\hfil \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
      \penalty\@highpenalty
    \endgroup
  \fi}
\newcommand*\l@section{\@dottedtocline{1}{0pt}{2.3em}}
\newcommand*\l@subsection{\@dottedtocline{2}{0pt}{3.2em}}
\newcommand*\l@subsubsection{\@dottedtocline{3}{0pt}{4.1em}}
\newcommand*\l@paragraph{\@dottedtocline{4}{0pt}{5em}}
% List of tables and list of figures
\newcommand\listoffigures{%
    \chapter*{\listfigurename \phantomsection\addcontentsline{toc}{chapter}{\protect \listfigurename}}%
    \begin{flushright}{\if@english Page \else Pág. \fi}\end{flushright}
    \@starttoc{lof}%
    }
\newcommand*\l@figure{\@dottedtocline{1}{0pt}{2.3em}}
\newcommand\listoftables{%
    \chapter*{\listtablename \phantomsection\addcontentsline{toc}{chapter}{\protect \listtablename}}%
    \begin{flushright}{\if@english Page \else Pág. \fi}\end{flushright}
    \@starttoc{lot}%
    }
\let\l@table\l@figure % Command copy/paste
% Table and array dimensions
\setlength\arraycolsep{5\p@}
\setlength\tabcolsep{6\p@}
\setlength\arrayrulewidth{.4\p@}
\setlength\doublerulesep{2\p@}
% Footnotes
\@addtoreset{footnote}{page}
\newcommand\@makefntext[1]{%
    \parindent 1em%
    \noindent
    \hb@xt@1.8em{\hss\@makefnmark}#1}
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

% --- Bibliografía clásica (Vancouver/ICONTEC) -------------------------------
% Solo se define cuando NO se usa la opción apa (en modo apa se usa biblatex).
\if@apa\else
\if@numcit
% The bibliography numcit
\newenvironment{thebibliography}[1]
     {\chapter*{\bibname}
     \phantomsection\addcontentsline{toc}{chapter}{\if@english References \else Bibliografía \fi}%
      \list{\@biblabel{\@arabic\c@enumiv}}
           {\leftmargin 0pt
            \parsep 6pt
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
     {\chapter*{\bibname}
     \phantomsection\addcontentsline{toc}{chapter}{\if@english References \else Bibliografía \fi }%
      \list{}
           {\leftmargin 0pt
            \parsep 6pt
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
\fi
\def\newblock{\hskip .11em plus .33em minus .07em}

% --- Nombres (vía babel: se sobreescriben los valores por defecto) ----------
\addto\captionsspanish{%
  \renewcommand\partname{Parte}%
  \renewcommand\chaptername{Capítulo}%
  \renewcommand\contentsname{Contenido}%
  \renewcommand\listfigurename{Lista de figuras}%
  \renewcommand\listtablename{Lista de tablas}%
  \renewcommand\bibname{Bibliografía}%
  \renewcommand\indexname{Glosario}%
  \renewcommand\figurename{Figura}%
  \renewcommand\tablename{Tabla}%
  \renewcommand\appendixname{Apéndice}%
}
\addto\captionsenglish{%
  \renewcommand\partname{Part}%
  \renewcommand\chaptername{Chapter}%
  \renewcommand\contentsname{Contents}%
  \renewcommand\listfigurename{List of Figures}%
  \renewcommand\listtablename{List of Tables}%
  \renewcommand\bibname{References}%
  \renewcommand\indexname{Glossary}%
  \renewcommand\figurename{Figure}%
  \renewcommand\tablename{Table}%
  \renewcommand\appendixname{Appendix}%
}

% =============================================================================
%  Formato APA 7 (solo con la opción de clase "apa")
% =============================================================================
\if@apa
  % Espaciado entre párrafos y control de viudas/huérfanas
  \setlength{\parskip}{6pt}
  \clubpenalty=20000
  \widowpenalty=20000
  % Numeración global y consecutiva de tablas y figuras (kernel >= 2018)
  \counterwithout{table}{chapter}
  \counterwithout{figure}{chapter}
  \renewcommand\thetable{\arabic{table}}
  \renewcommand\thefigure{\arabic{figure}}
  % Rótulo APA: "Tabla N"/"Figura N" en negrita en su línea; título en cursiva
  \captionsetup{labelfont=bf,textfont=it,labelsep=newline,%
                justification=raggedright,singlelinecheck=false}
  % Rótulo de las figuras ARRIBA (igual que las tablas)
  \floatstyle{plaintop}
  \restylefloat{figure}
  % Encabezado de capítulo APA: centrado, negrita, "N. Título" (sin "Capítulo")
  \renewcommand\@makechapterhead[1]{%
    \vspace*{20\p@}{\parindent\z@\centering\normalfont\interlinepenalty\@M
      \large\bfseries \thechapter.\quad #1\par\nobreak\vskip 20\p@}}
  \renewcommand\@makeschapterhead[1]{%
    \vspace*{20\p@}{\parindent\z@\centering\normalfont\interlinepenalty\@M
      \large\bfseries #1\par\nobreak\vskip 20\p@}}
  % Listas de tablas/figuras: anteponer "Tabla N"/"Figura N" en negrita
  \let\apa@numberline\numberline
  \newcommand\apa@tablenum[1]{\apa@numberline{\textbf{\tablename~#1}}}
  \newcommand\apa@fignum[1]{\apa@numberline{\textbf{\figurename~#1}}}
  \renewcommand*\l@table[2]{\begingroup\let\numberline\apa@tablenum
    \@dottedtocline{1}{0em}{5.5em}{#1}{#2}\endgroup}
  \renewcommand*\l@figure[2]{\begingroup\let\numberline\apa@fignum
    \@dottedtocline{1}{0em}{5.5em}{#1}{#2}\endgroup}
  % Niveles de título APA (mismo tamaño que el texto; sin mayúsculas)
  \renewcommand\section{\@startsection{section}{1}{\z@}%
    {-3.25ex \@plus -1ex \@minus -.2ex}{1.5ex \@plus .2ex}%
    {\normalfont\normalsize\bfseries}}
  \renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
    {-3.25ex \@plus -1ex \@minus -.2ex}{1.5ex \@plus .2ex}%
    {\normalfont\normalsize\bfseries\itshape}}
  \renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
    {-3.25ex \@plus -1ex \@minus -.2ex}{1.5ex \@plus .2ex}%
    {\normalfont\normalsize\bfseries}}
  % Encabezado de la bibliografía a nivel de capítulo (igual que Resumen, etc.).
  % biblatex se carga antes de que la clase defina \chapter, por lo que su
  % heading por defecto queda a nivel de sección; aquí se fuerza el capítulo.
  \defbibheading{bibintoc}[\bibname]{%
    \chapter*{#1}\phantomsection\addcontentsline{toc}{chapter}{#1}}
  % Notas al pie con numeración arábiga
  \renewcommand\thefootnote{\arabic{footnote}}
  % Encabezado APA: solo el número de página, arriba a la derecha, sin regla
  \setlength{\headheight}{15pt}
  \fancypagestyle{fancy}{\fancyhf{}\fancyhead[R]{\thepage}%
    \renewcommand\headrulewidth{0pt}}
  \fancypagestyle{plain}{\fancyhf{}\fancyhead[R]{\thepage}%
    \renewcommand\headrulewidth{0pt}}
  % El número de página debe verse también en los preliminares
  \renewcommand\frontmatter{\cleardoublepage\@mainmatterfalse\pagestyle{fancy}}
  \renewcommand\mainmatter{\cleardoublepage\@mainmattertrue\pagestyle{fancy}}
  \pagestyle{fancy}
\fi
\endinput
