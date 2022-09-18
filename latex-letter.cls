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


%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   FOLDING MEASUREMENTS   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\@foldFirst{105mm}
\def\@foldSecond{210mm}

\newcommand{\foldFirst}[1]{
	\def\@foldFirst{#1}
}

\newcommand{\foldSecond}[1]{
	\def\@foldSecond{#1}
}


%%%%%%%%%%%%%%%%%%%
%   TEXT OFFSET   %
%%%%%%%%%%%%%%%%%%%
\def\@textOffsetTop{65mm}

\newcommand{\textOffsetTop}[1]{
	\def\@textOffsetTop{#1}
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   DOCUMENT PADDING & INDENTS  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage[margin=\@windowOffsetSide]{geometry}
\setlength\parindent{0pt}
\setlength\parskip{\baselineskip}


%%%%%%%%%%%%%%%%%%%%%%%%%
%   DOCUMENT ENCODING   %
%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage[utf8]{inputenc}


%%%%%%%%%%%%%%%%%%%%%%
%   DOCUMENT FONTS   %
%%%%%%%%%%%%%%%%%%%%%%
\renewcommand{\familydefault}{\sfdefault}


%%%%%%%%%%%%
%   TikZ   %
%%%%%%%%%%%%
\RequirePackage{tikz}
\usetikzlibrary{calc}
\usetikzlibrary{positioning}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   MARKS FOR FOLDING AND HOLE PUNCHING   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{scrlayer-scrpage}
\newpairofpagestyles{default-pagestyle}{
	\clearpairofpagestyles
	\renewcommand*{\headfont}{\normalfont}
	\chead{
		\begin{tikzpicture}[remember picture, overlay]
			\node (foldAA) at ($(current page.north west) + (5mm, -105mm)$) {};
			\node (foldAB) at ($(current page.north west) + (10mm, -105mm)$) {};
			\node (foldBA) at ($(current page.north west) + (5mm, -210mm)$) {};
			\node (foldBB) at ($(current page.north west) + (10mm, -210mm)$) {};
			\node (centerA) at ($(current page.west) + (5mm, 0)$) {};
			\node (centerB) at ($(current page.west) + (10mm, 0)$) {};
			\draw[-] (foldAA) -- (foldAB);
			\draw[-] (foldBA) -- (foldBB);
			\draw[-] (centerA) -- (centerB);
		\end{tikzpicture}
	}
}
\AtBeginDocument{\pagestyle{default-pagestyle}}


%%%%%%%%%%%%%
%   TITLE   %
%%%%%%%%%%%%%
\renewcommand{\maketitle}{
	\begin{tikzpicture}[remember picture, overlay]
		\node (sender) [anchor=north west, inner sep=0, outer sep=0, text width=\@windowWidth, minimum height=\@windowHeight] at ($(current page.north west) + (\@windowOffsetSide, -\@windowOffsetTop)$) {\footnotesize\@senderAddressOneline~\\[\baselineskip]\normalsize\@receiverAddressMultiline};
	\end{tikzpicture}
	\vspace{\@textOffsetTop}
	\begin{flushright}
		\@senderPlace, am \@documentDate
	\end{flushright}
	~\\
	\textbf{\@documentTitle}
	\\[\baselineskip]
}