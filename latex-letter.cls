\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{latex-letter}[2022/06/28 Jens Ostertag - LaTeX Letter]


%%%%%%%%%%%%%%%%%%%%%%%%%%
%   LOAD DEFAULT CLASS   %
%%%%%%%%%%%%%%%%%%%%%%%%%%
\LoadClassWithOptions{article}


%%%%%%%%%%%%%%%%
%   COMMANDS   %
%%%%%%%%%%%%%%%%
\RequirePackage{ifthen}


%%%%%%%%%%%%%%%%%%%%%%%%%
%   DOCUMENT METADATA   %
%%%%%%%%%%%%%%%%%%%%%%%%%
\def\@title{}
\newcommand{\documentTitle}[1]{
	\def\@documentTitle{#1}
}

\def\@date{\today}
\newcommand{\documentDate}[1]{
	\def\@documentDate{#1}
}

\newif\ifprintmode

\title{\@documentTitle}
\author{}
\date{\@documentDate}


%%%%%%%%%%%%%%%%%%%%%%%%%%
%   SENDER INFORMATION   %
%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\@senderName{}
\def\@senderAddressMultiline{}
\def\@senderAddressOneline{}

\newcommand{\senderName}[1]{
	\def\@senderName{#1}
	\def\@senderAddressMultiline{#1}
	\def\@senderAddressOneline{#1}
}

\newcommand{\senderAddress}[1]{
	\edef\@senderAddressMultiline{\unexpanded\expandafter{\@senderAddressMultiline}\\#1}
	\edef\@senderAddressOneline{\unexpanded\expandafter{\@senderAddressOneline}, #1}
}

\def\@senderPlace{}
\newcommand{\senderPlace}[1]{
	\def\@senderPlace{#1}
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   RECEIVER INFORMATION   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\@receiverName{}
\def\@receiverAddressMultiline{}
\def\@receiverAddressOneline{}
\newcommand{\receiverName}[1]{
	\def\@receiverName{#1}
	\def\@receiverAddressMultiline{#1}
	\def\@receiverAddressOneline{#1}
}

\newcommand{\receiverAddress}[1]{
	\edef\@receiverAddressMultiline{\unexpanded\expandafter{\@receiverAddressMultiline}\\#1}
	\edef\@receiverAddressOneline{\unexpanded\expandafter{\@receiverAddressOneline}, #1}
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   ADDRESS WINDOW MEASUREMENTS   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\@windowHeight{45mm}
\def\@windowWidth{90mm}
\def\@windowOffsetTop{45mm}
\def\@windowOffsetSide{20mm}
\def\@windowOffsetDirection{left}

\newcommand{\windowHeight}[1]{
	\def\@windowHeight{#1}
}
\newcommand{\windowWidth}[1]{
	\def\@windowWidth{#1}
}
\newcommand{\windowOffsetTop}[1]{
	\def\@windowOffsetTop{#1}
}
\newcommand{\windowOffsetSide}[1]{
	\def\@windowOffsetSide{#1}
}
\newcommand{\windowOffsetDirection}[1]{
	\def\@windowOffsetDirection{#1}
}


%%%%%%%%%%%%%%%%%%%%%%%%
%   DOCUMENT PADDING   %
%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage[margin=1in]{geometry}


%%%%%%%%%%%%%%%%%%%%%%%%%
%   DOCUMENT ENCODING   %
%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage[utf8]{inputenc}


%%%%%%%%%%%%%%%%%%%%%%
%   DOCUMENT FONTS   %
%%%%%%%%%%%%%%%%%%%%%%
\renewcommand{\familydefault}{\sfdefault}


%%%%%%%%%%%%%%%%%%
%   HYPERLINKS   %
%%%%%%%%%%%%%%%%%%
\RequirePackage{hyperref}
\hypersetup{
	colorlinks,
	citecolor=black,
	filecolor=black,
	linkcolor=black,
	urlcolor=facultyColor
}


%%%%%%%%%%%%
%   TikZ   %
%%%%%%%%%%%%
\RequirePackage{tikz}
\usetikzlibrary{calc}
\usetikzlibrary{positioning}
\usetikzlibrary{fit}


%%%%%%%%%%%%%
%   TITLE   %
%%%%%%%%%%%%%
\def\@headerSpacing{1.5in}
\def\@titlePageStyle{default}

\newcommand{\headerspacing}[1]{
	\def\@headerSpacing{#1}
}

\newcommand{\titlepagestyle}[1]{
	\def\@titlePageStyle{#1}
	
	\ifthenelse{\equal{\@titlePageStyle}{clear}}{
		{\AtBeginDocument{\addtocontents{toc}{\protect\thispagestyle{default-pagestyle}}}}
		{}
	}
}

\renewcommand{\maketitle}{
	\begin{tikzpicture}[remember picture, overlay]
		\node (sender) [anchor=north west, inner sep=0, outer sep=0, text width=\@windowWidth, rectangle, draw=black, minimum height=\@windowHeight] at ($(current page.north west) + (\@windowOffsetSide, -\@windowOffsetTop)$) {\footnotesize\@senderAddressOneline~\\[\baselineskip]\normalsize\@receiverAddressMultiline};
	\end{tikzpicture}
}