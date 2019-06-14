\ProvidesClass{johnsona_cv}[2015/09/22]
\NeedsTeXFormat{LaTeX2e}

\DeclareOption{print}{\def\@cv@print{}}
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article}%
}
\ProcessOptions\relax
\LoadClass{article}


% Colors %

\RequirePackage{xcolor}

\definecolor{white}{RGB}{255,255,255}
\definecolor{darkgray}{HTML}{333333}
\definecolor{gray}{HTML}{4D4D4D}
\definecolor{lightgray}{HTML}{999999}
\colorlet{textcolor}{gray}
\colorlet{headercolor}{gray}

% Fonts %

\RequirePackage[quiet]{fontspec}
\RequirePackage{unicode-math}

\newfontfamily\bodyfont[]{Helvetica Neue}
\newfontfamily\thinfont[]{Helvetica Neue UltraLight}
\newfontfamily\headingfont[]{Helvetica Neue Condensed Bold}

\defaultfontfeatures{Mapping=tex-text}
\setmainfont[Mapping=tex-text, Color=textcolor]{Helvetica Neue Light}

% Header %

\RequirePackage{tikz}

\newcommand{\rolefont}{%
  \fontsize{14pt}{24pt}\selectfont%
  \thinfont%
  \color{white}%
}

\newcommand{\header}[4]{%
  \begin{tikzpicture}[remember picture,overlay]
    \node [rectangle, fill=white, anchor=north, minimum width=\paperwidth, minimum height=3cm] (box) at (current page.north){};
    \node [anchor=center] (name) at (box) {%
      \fontsize{40pt}{72pt}\color{gray}%
      {\thinfont #1} {\bodyfont  #2}
    };
    \node [anchor=north] at (name.south) {%
      \fontsize{14pt}{24pt}\color{gray}%
      {\thinfont #3} {\thinfont #4}%
    };
  \end{tikzpicture}
  \vspace{1.5cm}
  \vspace{-2\parskip}
}


% Structure %
\RequirePackage{parskip}



\newcommand{\datedsection}[2]{
    \section[#1]{#1 \hfill #2}
}

\newcommand{\datedsubsection}[2]{
    \subsection{#1 \hfill #2}
}

\renewcommand{\section}[1]{
  {%
    {\LARGE\headingfont\color{gray} #1}%%
  }
  
}
\renewcommand{\subsection}[2]{
  % \par\vspace{.5\parskip}%
  {\large\bodyfont\color{gray} #1 \hfill #2}
  \par\vspace{.05\parskip}%
}

\pagestyle{empty}


% List environment %

\setlength{\tabcolsep}{0pt}
\newenvironment{entrylist}{%
  \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
}{%
  \end{tabular*}
}
\renewcommand{\bfseries}{\headingfont\color{headercolor}}

\newcommand{\entry}[4]{%
  \vspace{0.5\parsep}
  \parbox[t]{13.5cm}{%
    #1 \textbf{ #2}%
    \hfill%
    {\footnotesize\addfontfeature{Color=lightgray} #3}\\%
    #4\vspace{0.5\parsep}%
  }\\}


% Side block %

\RequirePackage[absolute,overlay]{textpos}
\setlength{\TPHorizModule}{1cm}
\setlength{\TPVertModule}{1cm}
\newenvironment{aside}{%
  \let\oldsection\section
  \renewcommand{\section}[1]{
    \par\vspace{\baselineskip}{\Large\headingfont\color{gray} ##1}
  }
  \begin{textblock}{4.5}(0.5, 3.15)
  \begin{flushright}
  \obeycr
}{%
  \restorecr
  \end{flushright}
  \end{textblock}
  \let\section\oldsection
}

% Bibliography %

\RequirePackage[style=verbose, maxnames=99, sorting=ydnt]{biblatex}

\DeclareFieldFormat[article]{title}{#1\par}

\DeclareBibliographyDriver{article}{%
  \printfield{title}%
  \newblock%
  \printnames{author}%
  \par%
  \newblock%
  {%
    \footnotesize\addfontfeature{Color=lightgray}\itshape%
    \usebibmacro{journal+issuetitle}%
    \setunit{\space}%
    \printfield{pages}%
    \newunit%
    \printlist{publisher}%
    \setunit*{\addcomma\space}%
    \printfield{year}%
    \newunit%
  }
  \par\vspace{0.3\baselineskip}
}
% Other tweaks %

\RequirePackage[left=6.1cm,top=2cm,right=1.5cm,bottom=2.5cm,nohead,nofoot]{geometry}
\RequirePackage{hyperref}

\hypersetup{
    colorlinks=false,       
    linkcolor=red,          
    citecolor=red,        
    filecolor=red,      
    urlcolor = red}
    
\makeatletter
\def\HyColor@@@@UseColor#1\@nil{\addfontfeatures{Color=#1}}
\makeatother
\RequirePackage{geometry}