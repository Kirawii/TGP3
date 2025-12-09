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

\usepackage{fancyhdr}
\usepackage{amsmath, amsfonts, amssymb}    % 数学宏包
\usepackage{graphicx}                      % 插图支持
\usepackage{caption}
\usepackage{subcaption}                    % 支持 \begin{subfigure}
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
\usepackage{tabu}
\usepackage{longtable}
\usepackage{makecell}
\usepackage{algorithm}
\usepackage{tabularx}
\usepackage{lettrine}
\usepackage{geometry}
\usepackage{setspace}
\usepackage{pdfpages}  % 用来插 PDF

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  英文主字体：Times New Roman；中文由 ctexart 默认宋体负责
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\setmainfont{Times New Roman}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  字号命令定义
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\erhao}{\fontsize{22pt}{\baselineskip}\selectfont}
\newcommand{\sihao}{\fontsize{14pt}{\baselineskip}\selectfont}
\newcommand{\xiaosihao}{\fontsize{12pt}{20pt}\selectfont}
\newcommand{\wuhao}{\fontsize{10.5pt}{\baselineskip}\selectfont}
\newcommand{\xiaowuhao}{\fontsize{9pt}{\baselineskip}\selectfont}
\newcommand{\liuhao}{\fontsize{7.875pt}{\baselineskip}\selectfont}
\newcommand{\myxiaoliuhao}{\fontsize{6.5pt}{\baselineskip}\selectfont}
\newcommand{\qihao}{\fontsize{5.25pt}{\baselineskip}\selectfont}
\newcommand{\sanhao}{\fontsize{16pt}{\baselineskip}\selectfont}
\newcommand{\shibahao}{\fontsize{18pt}{\baselineskip}\selectfont}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  正文字号 + 行距固定 20 磅（小四 12pt）
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\makeatletter
\renewcommand\normalsize{%
  \@setfontsize\normalsize{12pt}{20pt}% 12pt 字号，20pt 行距（约 1.6 倍）
  \abovedisplayskip 6pt plus 2pt minus 2pt
  \abovedisplayshortskip 0pt plus 2pt
  \belowdisplayskip 6pt plus 2pt minus 2pt
  \belowdisplayshortskip 4pt plus 2pt minus 2pt
}
\makeatother

% 正文要求：小四宋体，首行缩进 2 字符，两端对齐
\setlength{\parindent}{2em}
\setlength{\parskip}{0pt}   % 段前段后不额外加空白
\setlength{\voffset}{-4mm}

\AtBeginDocument{%
  \normalsize
  \songti
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  图表题注
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand{\tablename}{表}
\renewcommand{\figurename}{图}
\captiondelim{~~}
\setlength{\abovecaptionskip}{2pt}
\setlength{\belowcaptionskip}{2pt}

\DeclareRobustCommand{\ttfamily}{\fontencoding{T1}\fontfamily{lmtt}\selectfont}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  页边距：2.5cm
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newgeometry{
  top=25mm, bottom=25mm, left=25mm, right=25mm,
  headsep=5mm, headheight=10mm, footskip=10mm,
}
\savegeometry{mastergeometry}
\loadgeometry{mastergeometry}

\setlength{\columnsep}{10mm}
\setcounter{page}{1}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  页面叠加文本工具
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\positiontextbox}[4][]{
  \begin{tikzpicture}[remember picture,overlay]
    \node[inner sep=0pt,right,align=left, #1] at ($(current page.north west) + (#2,-#3)$) {#4};
  \end{tikzpicture}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  摘要环境：正文小四（收紧底部空白）
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\NewEnviron{empAbstract}{
\vspace{-2em}
\begin{center}
\parbox{\textwidth}{
\xiaosihao\setlength{\parindent}{2em}
\newlength{\somelength}

{\heiti\xiaosihao \makebox[\widthof{【关键词】}][s]{【摘 要】}}
{\xiaosihao 
\BODY
}

{\heiti\xiaosihao \makebox[\widthof{【关键词】}][s]{【关键词】}} \heiti \xiaosihao \empKeyword

\vspace*{0.6cm}}% 原来 1.3cm，避免首页大空白
\end{center}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  英文摘要：正文 12pt
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\NewEnviron{empAbstractEn}{
\begin{center}
\parbox{\textwidth}{
\xiaosihao\setlength{\parindent}{2em}

\textbf{\xiaosihao Abstract:}
{\xiaosihao 
\BODY
}

\textbf{\xiaosihao Key Words:} \textbf{ \xiaosihao \empKeywordEn}

\vspace*{0.6cm}}
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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  题目、作者信息
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% 中文题目：三号字加粗（略微收紧上下空白）
\newcommand\emptitle[1]{
\title{
\vspace{0.3cm} {\bfseries\sanhao #1 \vspace{-0.1cm}} 
}
}

%% 作者（中文）
\newcommand\empauthor[3]{
\author{
  \sihao\kaishu #1\makebox{$^{\text{*}}$} \quad 
  #2\makebox{$^{\text{*}}$} \quad 
  #3\makebox{$^{\text{*}}$} \\[0.1cm]
  \liuhao \kaishu 西南财经大学~~计算机科学与技术，成都~~610000
}
}

%% 英文题目：18 号字加粗
\newcommand\emptitleEn[1]{
\begin{center}
{
\vspace{0.3cm} \textbf{\shibahao #1} \vspace{-0.1cm}
}
\end{center}
}

%% 英文作者
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

%% 首页脚注（保持不变）
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
%  标题编号 & 格式
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\makeatletter

\renewcommand\thesection{\chinese{section}}            % 一、二、三……
\renewcommand\thesubsection{（\chinese{subsection}）}  % （一）、（二）……
\renewcommand\thesubsubsection{\arabic{subsubsection}} % 1, 2, 3……

% 一级标题：小四黑体，上下略少于一整行，避免大块空白
\renewcommand\section{\@startsection{section}{1}{\z@}%
  {0.8\baselineskip}% 标题前
  {0.6\baselineskip}% 标题后
  {\heiti\bfseries\xiaosihao}%
}

% 二级标题：略微再紧一点
\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
  {0.7\baselineskip}% 标题前
  {0.5\baselineskip}% 标题后
  {\heiti\bfseries\xiaosihao}%
}

% 三级标题：小上距，后不空行
\renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
  {0.4\baselineskip}%
  {0pt}%
  {\heiti\bfseries\xiaosihao}%
}

\makeatother

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 首页页眉页脚定义
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\fancypagestyle{plain}{ \fancyhf{}\vspace{6pt}
\lhead{}
\chead{\vspace{0.4cm}\centering{{\heiti\xiaowuhao 西\ 南\ 财\ 经\ 大\ 学\ 数 \ 据 \ 挖 \ 掘}\\[-0.5ex]
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
\fancyhead[CE]{{\footnotesize 西南财经大学数据挖掘}}
\fancyhead[LE,RO]{~~~\footnotesize\thepage ~~~}
\lfoot{}
\cfoot{}
\rfoot{}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 数学公式间距
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\DeclareMathSizes{10.5}{10}{6.8}{4.2}
\setlength{\abovedisplayskip}{2.5mm}
\setlength{\belowdisplayskip}{2.5mm}
