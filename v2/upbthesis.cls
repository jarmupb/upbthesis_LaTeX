% upbthesis.cls
%
% Creado por:
% Juan Alberto Ramírez Macías
% Facultad de Ingeniería Mecánica
% Grupo de Automática y Diseño A+D
% Universidad Pontificia Bolivariana
% email: juan.ramirez@upb.edu.co
%
% La Universidad Pontificia Bolivariana es propietaria de los derechos de autor de esta plantilla - 2011
% 
% v0.0 - versión inicial con elementos básicos y funcionales para crear documentos. Se usa bibliografía con número entre corchetes.
% v0.1 - posibilidad para crear bibliografías ICONTEC, usando la opción icontec ó con número entre corchetes, usando la opción numcit (por defecto).
% v0.2 - corrección de error en bibliografía que se generaba usando el paquete hyperref.
% v0.3 - inclusión del comando \appendix para la generación de anexos y corrección en la página de aprobación.
% v1.0 - primera versión oficial de la plantilla
% v1.1 - corrección de espacio antes de \paragraph
% v1.2 - corrección de hipervículos de introducción, conclusiones, recomendaciones y bibliografía.
% v1.3 - nueva versión de márgenes
% v1.4 - environments de abstract y keywords en inglés y español y declaración de originalidad
% v1.5 - se programa la opción english para la redacción de documentos en inglés
% v1.6 - se actualiza Pág en tablas de contenido, versión en inglés.
%
% v2.0 - nueva version, más parecida a "book"
% v2.1 - actualización de la declaración de originalidad
%
% Bibliografia:
% * book.cls
% * Goosens et. al., ''The LaTeX Companion'', 2 ed.
% * Lamport, ''LaTeX a document preparation system'', 2 ed.
% * http://en.wikibooks.org/wiki/LaTeX

\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{upbthesis}[2018/05/24 v2.0 UPB LaTeX Thesis class]
%\newcommand\@ptsize{}
%\newif\if@restonecol
%\newif\if@titlepage
%\@titlepagetrue
\newif\if@openright
\newif\if@mainmatter \@mainmattertrue
\newif\if@numcit
\newif\if@print \@printfalse
\newif\if@english \@englishfalse
\newif\if@xptsize \@xptsizefalse
\newif\if@xiptsize \@xiptsizefalse
\newif\if@xiiptsize \@xiiptsizefalse

% Options declaration
\DeclareOption{10pt}{\@xptsizetrue}
\DeclareOption{11pt}{\@xiptsizetrue}
\DeclareOption{12pt}{\@xiiptsizetrue}
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
\DeclareOption{english}{\@englishtrue}
\DeclareOption{spanish}{\@englishfalse}
\ExecuteOptions{12pt,twoside,onehalfspace,openright,numcit,spanish}
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

% Header, footer and margins definition
\setlength{\topmargin}{-10.4mm} % 
\setlength{\headheight}{5mm} % Header height
\setlength{\headsep}{12.5mm} % Header separation
\setlength{\footskip}{10mm} % Footer position
%\setlength{\topmargin}{4.6mm}
%\setlength{\headsep}{0pt} % Header separation
%\setlength{\headheight}{0pt} % Header height
%\setlength{\footskip}{15mm} % Footer position

%\setlength\lineskip{24pt}
%\setlength\normallineskip{12pt}
\setlength{\parskip}{12pt} % Space between paragraphs
\setlength{\parindent}{0pt} % Indentation of paragraph

% Numbering
\pagenumbering{arabic}

% Fonts
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


\if@twoside
  \def\ps@headings{%
      %\let\@oddfoot\@empty\let\@evenfoot\@empty
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
    %\let\@oddfoot\@empty
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


\newcommand\maketitle{
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
\newcommand\@dotsep{4.5} % Table of contents dot separation4.5
\setcounter{tocdepth}{4}
% Sectioning definitions
\setcounter{secnumdepth}{4}
\newcounter{part}
\newcounter{chapter}
\newcounter{section}[chapter]
\newcounter{subsection}[section]
\newcounter{subsubsection}[subsection]
\newcounter{paragraph}[subsubsection]
%\newcounter{subparagraph}[paragraph]
% Appendix name
\newcommand\appname{ANEXOS}
\if@english
\renewcommand\appname{APPENDIX}
\fi
% Sections
\renewcommand\thepart{\Roman{part}}
\renewcommand\thechapter{\arabic{chapter}}
\renewcommand\thesection{\thechapter.\arabic{section}}
%\renewcommand\thesection{\arabic{section}}
\renewcommand\thesubsection{\thesection.\arabic{subsection}}
\renewcommand\thesubsubsection{\thesubsection.\arabic{subsubsection}}
\renewcommand\theparagraph{\thesubsubsection.\arabic{paragraph}}

\newcommand\@chapapp{\chaptername}

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
%\addcontentsline{toc}{section}{\protect \appname}
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


%\newcommand\section{\if@openright\cleardoublepage\else\clearpage\fi
%																	 \vspace*{-10mm}
%																	 \@startsection{section}{1}{0pt}%
%                                   {-3\baselineskip}
%                                   {2\baselineskip}
%                                   {\centering\normalfont\normalsize\bfseries\MakeUppercase}}
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
																	 {\vfill\begin{center}\bf \appname \end{center}\vfill\null\vfill}
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
% Caption definition
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
%\if@english
%\renewcommand\approvalpage{\if@openright\cleardoublepage\else\clearpage\fi
												%\twocolumn\null\vfill\@address, \today \newpage
												%Nota de aceptación\par
												%\vspace{48pt}
												%\null\hrulefill\null\par
												%\vspace{24pt}
												%\null\hrulefill\null\\
												%\null\hrulefill\null\\
												%\null\hrulefill\null\par
												%\vspace{48pt}
												%\null\hrulefill\null\\
												%Firma\\
												%Nombre:\\
												%Presidente del jurado\par
												%%\vspace{48pt}
												%\null\hrulefill\null\\
												%Firma\\
												%Nombre:\\
												%Jurado\par
												%\null\hrulefill\null\\
												%Firma\\
												%Nombre:\\
												%Jurado
												%\onecolumn}
%\fi
% Dedication environment
\newcommand\originality{\if@openright\cleardoublepage\else\clearpage\fi
               \section*{Declaraci\'on de originalidad}
							{\bf \today}
							\par
							{\bf \@author}
							\par
							``El contenido de este documento no ha sido presentado con anterioridad para optar a un t\'itulo, ya sea en igual forma o con variaciones, en esta o en cualquiera otra universidad.''.\par
							Firma:\\
							\rule[-10pt]{7.5cm}{1pt}
							}
% Dedication environment
\newenvironment{dedication}
               {\if@openright\cleardoublepage\else\clearpage\fi
               \null\vfil}%\begin{center} \end{center}
               {\null\vfil}
% Acknowledgements environment
\newenvironment{acknowledgements}
               {\if@openright\cleardoublepage\else\clearpage\fi \chapter*{Acknowledgements \phantomsection\addcontentsline{toc}{chapter}{\protect Acknowledgements}}}
               {}
% Glossary environment
\newenvironment{gloss}
               {\section*{\if@english Glossary \else Glosario \fi}}
               {}
% Resumen environment
\newenvironment{resumen}
               {\if@openright\cleardoublepage\else\clearpage\fi \chapter*{Resumen \phantomsection\addcontentsline{toc}{chapter}{\protect Resumen}}}
               {}
% Abstract environment
\newenvironment{abstract}
               {\if@openright\cleardoublepage\else\clearpage\fi \chapter*{Abstract \phantomsection\addcontentsline{toc}{chapter}{\protect Abstract}}}
               {}
% Keywords environment
\newenvironment{pclave}
               {\section*{Palabras Clave:}}
               {}
% Keywords environment
\newenvironment{keywords}
               {\section*{Keywords:}}
               {}
% Introduction
\newenvironment{introduction}
               {\phantomsection\addcontentsline{toc}{section}{\if@english \protect INTRODUCTION \else \protect INTRODUCCIÓN \fi} 
							 \section*{\if@english Introduction \else Introducción \fi}}
               {}
% Conclusions
\newenvironment{conclusions}
               {\phantomsection\addcontentsline{toc}{section}{\if@english \protect CONCLUSIONS \else \protect CONCLUSIONES \fi } 
							 \section*{\if@english Conclusions \else Conclusiones \fi }}
               {}
% Recommendations
\newenvironment{recommendations}
               {\phantomsection\addcontentsline{toc}{section}{\if@english \protect RECOMENDATIONS \else \protect RECOMENDACIONES \fi }
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
		\begin{flushright}{\if@english Pag. \else P\'{a}g. \fi}\end{flushright}%
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
    \begin{flushright}{\if@english Pag. \else P\'{a}g. \fi}\end{flushright}
    \@starttoc{lof}%
    }
\newcommand*\l@figure{\@dottedtocline{1}{0pt}{2.3em}}
\newcommand\listoftables{%
    \chapter*{\listtablename \phantomsection\addcontentsline{toc}{chapter}{\protect \listtablename}}%
    \begin{flushright}{\if@english Pag. \else P\'{a}g. \fi}\end{flushright}
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
     {\chapter*{\bibname}
     \phantomsection\addcontentsline{toc}{chapter}{\if@english References \else BIBLIOGRAFÍA \fi}%
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
     \phantomsection\addcontentsline{toc}{chapter}{\if@english References \else BIBLIOGRAFÍA \fi }%\MakeUppercase{\bibname}
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
\def\newblock{\hskip .11em plus .33em minus .07em}
% Names
\newcommand\partname{Parte}
\newcommand\chaptername{Cap\'itulo}
\newcommand\contentsname{Contenido}
\newcommand\listfigurename{Lista de Figuras}
\newcommand\listtablename{Lista de Tablas}
\newcommand\bibname{Bibliografía}
\newcommand\indexname{Glosario}
\newcommand\figurename{Figura}
\newcommand\tablename{Tabla}
\newcommand\appendixname{Apéndice}
\def\today{\ifcase\month\or
  Enero\or Febrero\or Marzo\or Abril\or Mayo\or Junio\or
  Julio\or Agosto\or Septiembre\or Octubre\or Noviembre\or Diciembre\fi
  \space\number\day{} de \number\year}

\if@english
\renewcommand\partname{Part}
\renewcommand\chaptername{Chapter}
\renewcommand\contentsname{Contents}
\renewcommand\listfigurename{List of Figures}
\renewcommand\listtablename{List of Tables}
\renewcommand\bibname{References}
\renewcommand\indexname{Glossary}
\renewcommand\figurename{Figure}
\renewcommand\tablename{Table}
\renewcommand\appendixname{Appendix}
\def\today{\ifcase\month\or
  January\or February\or March\or April\or May\or June\or
  July\or August\or September\or October\or November\or December\fi
  \space\number\day{}, \number\year}
\fi
