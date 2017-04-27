%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%	Document class mecanica_quantica offers a formatted
%	latex class to be used in the assignments of the course
%	Mecânica Quântica 2017.
%
%	author:
%		Krissia de Zawadzki
%	contact:
%		krissia.zawadzki@gmail.com
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{mecanica_quantica}[2017/04/06 v0.0]



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%						USEFUL PACKAGES
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% codification
\RequirePackage[utf8]{inputenc}

%tikz
\RequirePackage{tikz}
\usetikzlibrary{shapes, calc, fit, positioning}

% ifthen
\RequirePackage{ifthen}

% ident first
\RequirePackage{indentfirst} 


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%						HANDLING OPTIONS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\DeclareOption{customcolor}{\colorlet{maincolor}{customcolor}}
\DeclareOption{red}{\colorlet{maincolor}{red}}
\DeclareOption{blue}{\colorlet{maincolor}{blue}}
\DeclareOption{purple}{\colorlet{maincolor}{purple}}
\def\@@ptsize{12pt}
\DeclareOption{10pt}{\def\@@ptsize{10pt}}
\DeclareOption{11pt}{\def\@@ptsize{11pt}}
\DeclareOption{12pt}{\def\@@ptsize{12pt}}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass[letterpaper,oneside,onecolumn,final,openany,\@@ptsize]{article}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%							PAGE FORMATING
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\usepackage{geometry}
\geometry{a4paper, includeall, left=2. cm, right=-0.75 cm, top=0.25 cm, bottom=0.5 cm, footskip=1.0cm, headheight=1.25cm, headsep=0.5cm}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%						FONTS AND MATH SYMBOLS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{times}      % Loads the Times-Roman Fonts
%\RequirePackage{mathptmx}   % Loads the Times-Roman Math Fonts

% math
\RequirePackage{amsmath, amsfonts, amssymb, mathrsfs}



\usepackage{relsize}
\DeclareTextFontCommand{\fonttimesnewroman}{\rmfamily}

\newcommand{\fonteautores}{\rmfamily \fontsize{10}{12}\selectfont}
\newcommand{\fontecurso}{\rmfamily \fontsize{10}{12}\selectfont}

\newcommand{\fontegeral}{\rmfamily \relsize{0}} 
\newcommand{\fontesection}{\rmfamily \relsize{+1}}
\newcommand{\fontesubsection}{\rmfamily \relsize{+0.25}}
\newcommand{\fonteabstract}{ \small}

\usepackage{setspace}
\linespread{1.25}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%								COLORS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{xcolor}
\definecolor{maincolor}{HTML}{019A72}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%						FIGURES AND TABLES
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% figures
\RequirePackage{graphicx}

% tables
\RequirePackage[labelfont={bf,rm,small},labelsep=period, justification=raggedright]{caption}
\setlength{\abovecaptionskip}{0.25cm}
\setlength{\belowcaptionskip}{0.5pt}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%						TIKZ CUSTOM TITLES
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def \espacotitulosecao{0.5cm}

\newcommand{\drawnodetitle}[1]{
\begin{tikzpicture}
	\node[] (origem) at (0,0) {};
	\node[rectangle, inner sep=1mm, rounded corners=1mm, top color=maincolor!30, bottom color=maincolor!90] (phanthomtext) at ($(origem)+(0,0)$) 
	{\fontegeral \bfseries \color{white} #1};
\end{tikzpicture}
}

\newcommand{\drawnodetitlesec}[1]{
\begin{tikzpicture}
	\node[] (origem) at (0,0) {};
	\node[rectangle, inner sep=1mm, rounded corners=1mm, top color=maincolor!3, bottom color=maincolor!18, minimum height=0.65cm] (texto) at ($(origem)+(0,0)$) 
	{\fontegeral \bfseries \color{maincolor} #1};
	\node[] (spacebelow) at ($(texto) + (0, -0.25*\espacotitulosecao)$) {};
\end{tikzpicture}
}

\newcommand{\drawnodetitlesubsec}[1]{
\begin{tikzpicture}
	\node[] (origem) at (0,0) {};
	\node[rectangle, inner sep=1mm, rounded corners=1mm, top color=maincolor!1, bottom color=maincolor!10, minimum height=0.65cm] (texto) at ($(origem)+(1.75cm,0)$) 
	{\fontegeral \bfseries \color{maincolor} #1};
	\node[] (spacebelow) at ($(texto) + (0, -\espacotitulosecao)$) {};
\end{tikzpicture}
}

%----------------------------------------------------------------------
%	MULTIPLE AUTHOR SET
%----------------------------------------------------------------------  
  
\newcount\@authcnt
\newcount\@tmpcnt\@tmpcnt\z@

\def\@affiliation{%
  \ifnum\@tmpcnt<\@authcnt
   \global\advance\@tmpcnt1
    \raggedright \csname @auth\romannumeral\the\@tmpcnt\endcsname\hfill\\%
   \let\next\@affiliation \vskip1pt
  \else
   \let\next\relax
  \fi
\next}
	 
\newcommand{\affiliation}[1]{%
    \global\advance\@authcnt1
    \expandafter\gdef\csname @auth\romannumeral\the\@authcnt\endcsname
    {#1}}
    
    
\def\@cursosalunos{%
  \ifnum\@tmpcnt<\@authcnt
   \global\advance\@tmpcnt1
    \centering \csname @auth\romannumeral\the\@tmpcnt\endcsname \quad
   \let\next \@cursosalunos \quad %\vskip1pt
  \else
   \let\next\relax
  \fi
\next}
	 
\newcommand{\cursosalunos}[1]{%
    \global\advance\@authcnt1
    \expandafter\gdef\csname @auth\romannumeral\the\@authcnt\endcsname
    {#1}}    


\newcommand{\inseresimbolocurso}[1]{
\textsuperscript{\color{maincolor}#1}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%							CLASS MACROS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%\newcommand{\Titulo}[1]{\def\@Titulo{#1}}
%\newcommand{\tituloAtividade}[1]{\def\@tituloAtividade{#1}}
%\newcommand{\Autores}[1]{\def\@Autores{#1}}
%\newcommand{\GrupoID}[1]{\def\@GrupoID{#1}}
%\newcommand{\Docente}[1]{\def\@Docente{#1}}

\def\@Docente{Prof. ...}
\newcommand{\Docente}[1]{
  \def\@Docente{#1}
}
\def\@Titulo{\@empty}
\newcommand{\Titulo}[1]{
  \def\@Titulo{#1}
}
\def\@tituloAtividade{Atividade}
\newcommand{\tituloAtividade}[1]{
  \def\@tituloAtividade{#1}
}
\def\@Autores{\@empty}
\newcommand{\Autores}[1]{
  \def\@Autores{#1}
}
\def\@GrupoID{Grupo}
\newcommand{\GrupoID}[1]{
  \def\@GrupoID{#1}
}
\def\@Instituicao{\@empty}
\newcommand{\Instituicao}[1]{
  \def\@Instituicao{#1}
}
\def\@Curso{\@empty}
\newcommand{\Curso}[1]{
  \def\@Curso{#1}
}
\def\@Keywords{\@empty}
\newcommand{\Keywords}[1]{
  \def\@Keywords{#1}
}
\def\@dataEntrega{\@}
\newcommand{\dataEntrega}[1]{
  \def\@dataEntrega{#1}
}




% formatting date
\newcommand{\mostraData}{
\ifx\@dataEntrega\@empty%
\fontegeral \@dataEntrega%
\else%
\fontegeral \today
\fi%
}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%						HEADER AND FOOTER
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{fancyhdr}  % Needed to define custom headers/footers
\RequirePackage{lastpage}  % Number of pages in the document
\pagestyle{fancy}          % Enables the custom headers/footers

%\setlength\parindent{0em}
%\setlength\parskip{0.2in}

% Headers
\lhead{\fontegeral \@Docente}
\chead{
\ifx\@Curso\@empty%
\quad
\else%
\drawnodetitle{\@Curso}
\fi%
}
\rhead{\fontegeral \@tituloAtividade} %/\pageref{LastPage}}
% Footers
\lfoot{\fontegeral \@GrupoID}

\cfoot{\mostraData}%
\rfoot{\footnotesize \rmfamily  \thepage}%
\renewcommand{\headrulewidth}{1.75pt}
\renewcommand{\footrulewidth}{0.25pt}

\usepackage{etoolbox}
\newcommand{\headrulecolor}[1]{\patchcmd{\headrule}{\hrule}{\color{#1}\hrule}{}{}}
\newcommand{\footrulecolor}[1]{\patchcmd{\footrule}{\hrule}{\color{#1}\hrule}{}{}}
\headrulecolor{maincolor}
\footrulecolor{maincolor}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%						MAKETITLE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\renewcommand{\@maketitle}{%
\thispagestyle{fancy}


{\centering\color{maincolor}\rmfamily\bfseries\fontsize{14}{16}\selectfont \@Titulo\par}%
\vskip7.5pt%
{\centering    
\color{black} \fonteautores \@Autores\par}%

\vskip2pt%
\begingroup%
\raggedright\rmfamily\small%
\footnotesize\@cursosalunos\par%
\endgroup%%

\vskip25pt%

}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%						SECTION TITLES FORMATTING
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage[explicit]{titlesec}
\titleformat{\section}
  {\color{maincolor}\large\sffamily\bfseries}
  {}
  {0em}
  {\drawnodetitlesec{\centering\arabic{section}. #1}}
  []
\titleformat{name=\section,numberless}
  {\color{maincolor}\large\sffamily\bfseries}
  {}
  {0em}
   {\drawnodetitlesec{\centering #1}}
  []  
\titleformat{\subsection}
  {\color{maincolor}\large\sffamily\bfseries}
  {}
  {0em}
   {\drawnodetitlesubsec{\centering \thesubsection \hspace{0.5em} #1}}
  []
\titleformat{\subsubsection}
  {\color{maincolor}\large\sffamily\bfseries}
   {\drawnodetitlesec{\centering \thesubsubsection}}
  {0.5em}
  {#1}
  []    
\titleformat{\paragraph}[runin]
  {\sffamily\small\bfseries}
  {}
  {0em}
  {#1} 
\titlespacing*{\section}{0pc}{3ex \@plus4pt \@minus3pt}{5pt}
\titlespacing*{\subsection}{0pc}{2.5ex \@plus3pt \@minus2pt}{0pt}
\titlespacing*{\subsubsection}{0pc}{2ex \@plus2.5pt \@minus1.5pt}{0pt}
\titlespacing*{\paragraph}{0pc}{1.5ex \@plus2pt \@minus1pt}{10pt}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%						REFERENCE AUX COMMANDS 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\refeq}[1]{\!(\ref{#1})}
\newcommand{\refig}[1]{\!(\ref{#1})}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%						QUANTUM MECHANICS AUX NEWCOMMANDS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\valoresperado}[1]{\langle #1\rangle}
\newcommand{\observavel}[1]{\langle #1\rangle}
\newcommand{\operador}[1]{\hat{#1}}
