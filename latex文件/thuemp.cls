\NeedsTeXFormat{LaTeX2e}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexart}}
\ProcessOptions\relax

\LoadClass[oneside,a4paper, UTF8]{ctexart}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  packages
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\usepackage[backref]{hyperref} 
\hypersetup{
hidelinks
}
% 删除过时宏包 subfigure，改为使用 subcaption
% 删除重复宏包

\usepackage{fancyhdr}
\usepackage{amsmath, amsfonts, amssymb}    % 数学宏包
\usepackage{graphicx}                      % 插图支持
\usepackage{caption}
\usepackage{subcaption}                   % 支持 \begin{subfigure}
\usepackage{indentfirst}
\usepackage{bm}
\usepackage{abstract}
\usepackage{amsthm}
\usepackage{booktabs}
\usepackage{siunitx}
\usepackage{tikz}
\usetikzlibrary{calc}
\usepackage{titlesec}
\usepackage{times}
\usepackage{wasysym}
\usepackage{pifont}
\usepackage{ccaption}
\usepackage{float}
\usepackage{calc}
\usepackage{environ}
\usepackage{lmodern}
\usepackage{unicode-math}
\usepackage[sort&compress]{gbt7714}
\usepackage{anyfontsize}
\usepackage{hyperref}
\usepackage{tabu}
\usepackage{longtable}
\usepackage{makecell}
\usepackage{algorithm}
\usepackage{tabularx}


\setmainfont{Times New Roman}

\newcommand{\erhao}{\fontsize{22pt}{\baselineskip}\selectfont}      % 字号设置
\newcommand{\sihao}{\fontsize{14pt}{\baselineskip}\selectfont}      % 字号设置
\newcommand{\xiaosihao}{\fontsize{12pt}{\baselineskip}\selectfont}  % 字号设置
\newcommand{\wuhao}{\fontsize{10.5pt}{\baselineskip}\selectfont}    % 字号设置
\newcommand{\xiaowuhao}{\fontsize{9pt}{\baselineskip}\selectfont}   % 字号设置
\newcommand{\liuhao}{\fontsize{7.875pt}{\baselineskip}\selectfont}  % 字号设置
\newcommand{\myxiaoliuhao}{\fontsize{6.5pt}{\baselineskip}\selectfont}  % 字号设置
\newcommand{\qihao}{\fontsize{5.25pt}{\baselineskip}\selectfont}    % 字号设置
\newcommand{\sanhao}{\fontsize{16pt}{\baselineskip}\selectfont} 
\newcommand{\shibahao}{\fontsize{18pt}{\baselineskip}\selectfont} 


\renewcommand{\tablename}{表}
\renewcommand{\figurename}{图}
\captiondelim{~~}
\setlength{\abovecaptionskip}{2pt}
\setlength{\belowcaptionskip}{2pt}

\DeclareRobustCommand{\ttfamily}{\fontencoding{T1}\fontfamily{lmtt}\selectfont}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%    重定义页面边距，使其符合中文刊物习惯。
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\usepackage{lettrine}
\setlength{\parindent}{2em}
\setlength{\voffset}{-4mm}
\setlength{\parskip}{1pt}
\renewcommand{\baselinestretch}{1.25} %定义行间距1.15
\setcounter{page}{1} \makeatletter
\renewcommand\section{\@startsection {section}{1}{\z@}%
                                   {1.5ex }%
                                   {1.5ex}%
                                   {\normalfont\bfseries\xiaosihao}}
\renewcommand\subsection{\@startsection {subsection}{1}{\z@}%
                                   {-1pt }%
                                   {1pt}%
                                   {\normalfont\bfseries\heiti\wuhao}}
\renewcommand\subsubsection{\@startsection {subsubsection}{1}{\z@}%
                                   {-1pt }%
                                   {1pt}%
                                   {\normalfont\wuhao}}

\usepackage{geometry}
\newgeometry{
  top=25mm, bottom=25mm, left=25mm, right=25mm,
  headsep=5mm, headheight=10mm, footskip=10mm,
}
\savegeometry{mastergeometry}
\loadgeometry{mastergeometry}

\setlength{\columnsep}{10mm}


\newcommand{\positiontextbox}[4][]{
  \begin{tikzpicture}[remember picture,overlay]
    \node[inner sep=0pt,right,align=left, #1] at ($(current page.north west) + (#2,-#3)$) {#4};
  \end{tikzpicture}
}


\NewEnviron{empAbstract}{
\vspace{-3em}
\begin{center}
\parbox{\textwidth}{
\wuhao\setlength{\parindent}{2em}
\newlength{\somelength}

{\heiti\wuhao \makebox[\widthof{【关键词】}][s]{【摘 要】}}
{\xiaowuhao 
\BODY
}

{\heiti\wuhao \makebox[\widthof{【关键词】}][s]{【关键词】}} \heiti \wuhao \empKeyword

\vspace*{1.3cm}}
\end{center}
}

\NewEnviron{empAbstractEn}{
\begin{center}
\parbox{\textwidth}{
\wuhao\setlength{\parindent}{2em}

\textbf{\wuhao Abstract:}
{\xiaowuhao 
\BODY
}

\textbf{\wuhao Key Words:} \textbf{ \wuhao \empKeywordEn}

\vspace*{1.3cm}}
\end{center}
}

\def\empKeyword{}
\newcommand{\Keyword}[1]{
    \def\empKeyword{#1}
}

\def\empKeywordEn{}
\newcommand{\KeywordEn}[1]{
    \def\empKeywordEn{#1}
}


%%题目
\newcommand\emptitle[1]{
\title{
\vspace{0.5cm} {\shibahao #1 \vspace{-0.2cm}} 
}
}

%%作者
\newcommand\empauthor[3]{
\author{
  \sihao\kaishu #1\makebox{$^{\text{*}}$} \quad 
  #2\makebox{$^{\text{*}}$} \quad 
  #3\makebox{$^{\text{*}}$} \\[0.1cm]
  \liuhao \kaishu 西南财经大学~~计算机科学与技术，成都~~610000
}
}


%%英文题目
\newcommand\emptitleEn[1]{
\begin{center}
{
\vspace{0.5cm} \sihao #1 \vspace{-0.2cm}
}
\end{center}
}

%%英文作者
\newcommand\empauthorEn[3]{
\begin{center}
{
\centering
\textbf{\wuhao #1 \quad #2 \quad #3} \\[0.2cm]
\liuhao Computer Science, SWUFE, Chengdu 610000, China
}
\end{center}
}


\date{}

%%首页脚注
\newcommand\empfirstfoot[2]{
\positiontextbox{2.0cm}{27cm}{
\noindent\rule{4cm}{.5pt}\\[0.5ex]%
\hspace*{1em} \liuhao \linespread{0.8}\selectfont
\parbox{\textwidth}{
\heiti\makebox[\widthof{\makebox{*}实}][r]{\makebox{*}学}号：#1 \\
\heiti\makebox[\widthof{\makebox{*}实}][r]{\makebox{*}E-}mail：#2 \\
}}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 首页页眉页脚定义
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\fancypagestyle{plain}{ \fancyhf{}\vspace{10pt}
\lhead{}
\chead{\vspace{0.6cm}\centering{{\heiti\xiaowuhao 西\ 南\ 财\ 经\ 大\ 学\ 金\ 融\ 科\ 技\ 基\ 础}\\[-0.5ex]
{{\xiaowuhao Foundations of FinTech, SWUFE}}}}
\rhead{}
\lfoot{}
\cfoot{}
\rfoot{}
\renewcommand{\headrule}{%
\hrule height0.4pt width \headwidth \vskip1.0pt%
\hrule height0.4pt width \headwidth \vskip-2pt}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\pagestyle{fancy} 
\fancyhf{}
\fancyhead[CE]{{\footnotesize 西南财经大学金融科技基础}}
\fancyhead[LE,RO]{~~~\footnotesize\thepage ~~~}
\lfoot{}
\cfoot{}
\rfoot{}


\DeclareMathSizes{10.5}{10}{6.8}{4.2}
\setlength{\abovedisplayskip}{2.5mm}
\setlength{\belowdisplayskip}{2.5mm}
