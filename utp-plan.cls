% utp-plan.cls - Plantilla para Proyecto de Trabajo de Investigación UTP

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{utp-plan}[2026/09/12 UTP Proyecto de Trabajo de Investigacion]

\LoadClass[12pt,a4paper]{article}

\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage[spanish,es-nodecimaldot]{babel}
\RequirePackage{mathptmx}
\RequirePackage{geometry}
\geometry{a4paper,top=2.5cm,bottom=2.5cm,left=3cm,right=1.5cm}
\RequirePackage{setspace}
\RequirePackage{graphicx}
\RequirePackage{float}
\RequirePackage{array}
\RequirePackage{longtable}
\RequirePackage{booktabs}
\RequirePackage{caption}
\RequirePackage{amsmath,amssymb}
\RequirePackage{enumitem}
\RequirePackage[hidelinks]{hyperref}
\RequirePackage{url}
\RequirePackage{xstring}
\RequirePackage{fancyhdr}
\RequirePackage{titlesec}
\RequirePackage{etoolbox}
\RequirePackage[titles]{tocloft}
% ---------------- Estilo general ----------------
\setstretch{1.3}
\setlength{\parindent}{0pt}
\setlength{\parskip}{6pt}
\setlength{\emergencystretch}{2em}

% El documento oficial utiliza Times New Roman 12 pt.
% mathptmx proporciona una aproximación tipográfica disponible en Overleaf.
\AtBeginDocument{\fontsize{12}{18}\selectfont}

% Encabezado/pie: el Word no muestra encabezado; el número de página va al pie.
\pagestyle{fancy}
\fancyhf{}
\fancyfoot[C]{\thepage}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}

% ---------------- Estilo de títulos ----------------
\titleformat{\section}
  {\normalfont\bfseries\fontsize{12}{24}\selectfont}
  {\thesection.}{0.5em}{\MakeUppercase}
\titlespacing*{\section}{0pt}{0pt}{0pt}

\titleformat{\subsection}
  {\normalfont\bfseries\fontsize{12}{24}\selectfont}
  {\thesubsection.}{0.5em}{}
\titlespacing*{\subsection}{0pt}{0pt}{0pt}

% La plantilla usa títulos numerados sin "Section" y con texto explicativo
% entre paréntesis. El alumno puede editar libremente el título.
\setcounter{secnumdepth}{2}
\setcounter{tocdepth}{2}

% ---------------- Estilo de citado ----------------
% Uso:
%   \documentclass[citestyle=apa]{utp-plan}
% o
%   \documentclass[citestyle=ieee]{utp-plan}
\newcommand{\UTPCiteStyle}{apa}
\DeclareOption*{%
  \IfSubStr{\CurrentOption}{citestyle=}{%
    \StrBehind{\CurrentOption}{citestyle=}[\UTPCiteStyle]
  }{}
}
\ProcessOptions\relax

% BibTeX (no Biber): apacite para APA / IEEEtran para IEEE.
\IfStrEq{\UTPCiteStyle}{apa}{%
  \RequirePackage[natbibapa]{apacite}
  \bibliographystyle{apacite}
}{%
  \RequirePackage{cite}
  \bibliographystyle{IEEEtran}
}

\newcommand{\utpcite}[1]{%
  \IfStrEq{\UTPCiteStyle}{apa}{\citep{#1}}{\cite{#1}}%
}
\newcommand{\utpcitet}[1]{%
  \IfStrEq{\UTPCiteStyle}{apa}{\citet{#1}}{\cite{#1}}%
}

% ---------------- Figuras y tablas ----------------
\IfStrEq{\UTPCiteStyle}{apa}{%
  \DeclareCaptionLabelSeparator{utpcolon}{: }
  \captionsetup[figure]{name=Figura,labelsep=utpcolon,font=normalsize}
  \captionsetup[table]{name=Tabla,labelsep=utpcolon,font=normalsize}
}{%
  \DeclareCaptionLabelSeparator{utpperiod}{. }
  \captionsetup[figure]{name=Fig.,labelsep=utpperiod,font=normalsize}
  \captionsetup[table]{name=TABLA,labelsep=utpperiod,font=normalsize}
}
\captionsetup{font=normalsize,labelfont=bf}
\numberwithin{equation}{section}

% Comandos auxiliares para notas/fuentes bajo figuras y tablas.
\newcommand{\fuente}[1]{\par\noindent{\itshape Fuente:} #1\par}
\newcommand{\nota}[1]{\par\noindent{\itshape Nota.} #1\par}

% ---------------- Carátula ----------------
\newcommand{\UTPLogo}{logo-utp.png}
\newcommand{\UTPCampus}{Nombre de Campus UTP}
\newcommand{\UTPCarrera}{Denominación oficial de la carrera}
\newcommand{\UTPTitulo}{Título del Proyecto de Investigación}
\newcommand{\UTPIntegranteUno}{Apellidos, Nombres (Código Estudiante)}
\newcommand{\UTPIntegranteDos}{Apellidos, Nombres (Código Estudiante)}
\newcommand{\UTPDocente}{Apellidos, Nombres}
\newcommand{\UTPCiudad}{Ciudad, Perú}
\newcommand{\UTPCiclo}{Nombre de Ciclo Regular}

\newcommand{\campus}[1]{\renewcommand{\UTPCampus}{#1}}
\newcommand{\carrera}[1]{\renewcommand{\UTPCarrera}{#1}}
\newcommand{\titulo}[1]{\renewcommand{\UTPTitulo}{#1}}
\newcommand{\integranteuno}[1]{\renewcommand{\UTPIntegranteUno}{#1}}
\newcommand{\integrantedos}[1]{\renewcommand{\UTPIntegranteDos}{#1}}
\newcommand{\docente}[1]{\renewcommand{\UTPDocente}{#1}}
\newcommand{\ciudad}[1]{\renewcommand{\UTPCiudad}{#1}}
\newcommand{\ciclo}[1]{\renewcommand{\UTPCiclo}{#1}}

\newcommand{\UTPportada}{%
\begin{titlepage}
\thispagestyle{empty}
\begin{center}
\vspace*{0.1cm}
\includegraphics[width=0.7\textwidth]{\UTPLogo}

\vspace{1.5cm}
{\itshape \bfseries \UTPCampus \par}
\vspace{0.5cm}
{\itshape \UTPCarrera \par}
\vspace{-0.4cm}
{\small [Ver aquí: \url{https://www.utp.edu.pe/transparencia/curricula-pregrado}]\par}

\vfill
{\bfseries Proyecto de Trabajo de Investigación \par}
%\vspace{-0.2cm}
{\itshape \UTPTitulo\par}

\vfill
{\bfseries Integrantes\par}
%\vspace{-0.5cm}
{\itshape \UTPIntegranteUno\par}
%\vspace{-0.5cm}
{\itshape \UTPIntegranteDos\par}

\vspace{1.2cm}
{\bfseries Docente\par}
%\vspace{-0.5cm}
{\itshape \UTPDocente\par}

\vfill
{\itshape \UTPCiudad\par}
%\vspace{-0.5cm}
{\bfseries Ciclo\par}
\vspace{-0.5cm}
{\itshape \UTPCiclo\par}
\end{center}
\end{titlepage}
}

% ---------------- Índice ----------------
\newcommand{\UTPindice}{%
\clearpage
\setcounter{page}{2}
% Ocultar subsecciones del índice (Muestra solo hasta \section)
\setcounter{tocdepth}{1} 

% --- Quitar Negritas de las Secciones en el Índice ---
  \renewcommand{\cftsecfont}{\normalfont}       % Texto de la sección en fuente normal
  \renewcommand{\cftsecpagefont}{\normalfont}   % Número de página en fuente normal
  \renewcommand{\cftsecleader}{\normalfont\cftdotfill{\cftdotsep}} % Puntos guía en fuente normal
  
  
% --- Reducción de espacios ---
\setlength{\cftbeforesecskip}{2pt}  % Espacio antes de cada \section (ej. 1. Problema de...)
\setlength{\cftbeforesubsecskip}{0pt} % Espacio antes de cada \subsection (si tuvieras)
% -----------------------------

\phantomsection
%\addcontentsline{toc}{section}{ÍNDICE}
%\begin{center}
%{\bfseries ÍNDICE}
%\end{center}
%\vspace{0.4cm}
\tableofcontents
\clearpage
}

\endinput
