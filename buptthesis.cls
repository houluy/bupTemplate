%% -----------------------------------------------------------------
%% 
%% Copyright (C) 2016 -- 201X by 
%%
%% Haojun Yang, Lu Hou and Jie Mei
%%
%% -----------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{buptthesis}
  [2016/01/09 v0.1 Beijing University of Posts and Telecommunications (BUPT) thesis document class]
\typeout{-- See the "How_to_use_buptthesis" manual for usage information.}

%% -----------------------------------------------------------------

%% Document class options

%% Class option conditionals
\newif\ifBUPT@option@phd             \BUPT@option@phdtrue
\newif\ifBUPT@option@master          \BUPT@option@masterfalse
\newif\ifBUPT@option@electronic      \BUPT@option@electronictrue
\newif\ifBUPT@option@print           \BUPT@option@printfalse
\newif\ifBUPT@option@draftcls        \BUPT@option@draftclsfalse
\newif\ifBUPT@option@cenhdr          \BUPT@option@cenhdrfalse
\newif\ifBUPT@option@normaltoc       \BUPT@option@normaltocfalse
\newif\ifBUPT@option@txmath          \BUPT@option@txmathfalse
\newif\ifBUPT@option@macos           \BUPT@option@macosfalse

%%blankdblpage

%% Declare class options
\DeclareOption{phd}{%
  \BUPT@option@phdtrue%
  \BUPT@option@masterfalse}
\DeclareOption{master}{%
  \BUPT@option@phdfalse%
  \BUPT@option@mastertrue}

\DeclareOption{electronic}{%
  \BUPT@option@electronictrue%
  \BUPT@option@printfalse%
  \BUPT@option@draftclsfalse}
\DeclareOption{print}{%
  \BUPT@option@electronicfalse%
  \BUPT@option@printtrue%
  \BUPT@option@draftclsfalse}
\DeclareOption{draftcls}{%
  \BUPT@option@electronicfalse%
  \BUPT@option@printfalse%
  \BUPT@option@draftclstrue}

\DeclareOption{cenhdr}{%
  \BUPT@option@cenhdrtrue}

\DeclareOption{normaltoc}{%
  \BUPT@option@normaltoctrue%
  \PassOptionsToPackage{nottoc,notlof,notlot}{tocbibind}}

\DeclareOption{txmath}{%
  \BUPT@option@txmathtrue}

\DeclareOption{macos}{%
  \BUPT@option@macostrue%
  \typeout{-- Operating system is Mac OS.}}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ExecuteOptions{phd,electronic}
\ProcessOptions\relax
%% 注意：如果载入文档类的时候，使用phd选项，则phd选项被载入了2次！

\PassOptionsToPackage{no-math}{fontspec}

%% -----------------------------------------------------------------

%% Load ctexbook.cls document class
%% book.cls default:
%% \ExecuteOptions{letterpaper,10pt,twoside,onecolumn,final,openright}

\ifBUPT@option@macos
  \LoadClass[
  	UTF8,
  	a4paper,
  	twoside,
  	sub3section,
  	zihao = -4,
  	fontset = fandol
  ]{ctexbook}[2015/05/03]
\else
  \LoadClass[
  	UTF8,
  	a4paper,
  	zihao = -4,
  	fontset = fandol
  ]{ctexbook}[2015/05/03]
\fi

%% -----------------------------------------------------------------

%% Fonts setup

%% Chinese text fonts setup
\ifBUPT@option@macos
  \typeout{-- See the "ctex-fontset-macwin.def" for more information about chinese text font.}
\else
  \typeout{-- See the "ctex-fontset-windowsnew.def" for more information about chinese text font.}
\fi

% English text fonts setup
\RequirePackage[T1]{fontenc}
\renewcommand\sfdefault{phv}
\renewcommand\rmdefault{ptm}
\renewcommand\ttdefault{pcr}


%% Math fonts setup
\ifBUPT@option@txmath
  \RequirePackage{newtxmath}
\fi

%% -----------------------------------------------------------------

%% Load packages

\RequirePackage{keyval}
%% In fact, the graphicx package has loaded the keyval package.

%% Math Packages
\RequirePackage{amsmath}
%\interdisplaylinepenalty=2500
\RequirePackage{amssymb}
%\RequirePackage{eucal}
\RequirePackage{bm}
\RequirePackage{mdwmath}
\RequirePackage{xfrac}
\RequirePackage{enumitem} 

%% Graphic Related Packages
\ifBUPT@option@draftcls
  \setkeys{Gin}{draft = true}
\else
  \RequirePackage{graphicx}
  %% In fact, the xunicode package has loaded the graphicx package.
\fi
\RequirePackage[table,usenames,svgnames,dvipsnames]{xcolor}
\RequirePackage[font=footnotesize,subrefformat=parens]{subfig}
\RequirePackage{caption}
\DeclareCaptionFont{kaishu}{\kaishu}
\captionsetup{format=plain,labelformat=simple,labelsep=space,justification=centering,font={small,kaishu}}
\renewcommand{\theequation}{\thechapter--\arabic{equation}}
\renewcommand{\thefigure}{\thechapter--\arabic{figure}}
\renewcommand{\thetable}{\thechapter--\arabic{table}}
%\renewcommand{\thealgorithm}{\thechapter--\arabic{algorithm}}

%% Table and Array Packages
\RequirePackage{makecell}
%% The makecell package already loads the array package.
\RequirePackage{multirow}

%% Specialzed List Packages
%\RequirePackage{algorithm2e}
%\RequirePackage{algorithmic}
%\RequirePackage[compatible]{algpseudocode}
\RequirePackage{acronym}
\RequirePackage{IEEEtrantools}

\RequirePackage[
	linesnumbered,
	lined,
	boxruled,
	commentsnumbered,
	algochapter
]{algorithm2e}
\RequirePackage{mathtools}
\DeclarePairedDelimiter{\ceil}{\lceil}{\rceil}
\DeclarePairedDelimiter{\floor}{\lfloor}{\rfloor}

%% Citation Packages
%% natbib!!!
%\RequirePackage[noadjust]{cite}
\RequirePackage[super]{gbt7714}
\RequirePackage{longtable}

%% PDF, URL and Hyperlink Packages
\RequirePackage{url}
\ifBUPT@option@electronic
  \RequirePackage{hyperref}
\fi

%% Geometry Package
\RequirePackage{geometry}

%% Fancyhdr Package
\RequirePackage{fancyhdr}

%% Units Package
\RequirePackage[binary-units]{siunitx}

%% Caption Package
%% caption!!!

%% Tocbibind Package
\RequirePackage{tocbibind}
\newcolumntype{g}{>{\columncolor{LightSteelBlue}}c}
\AtEndOfClass{%
  \InputIfFileExists{config/buptthesis.cfg}{}{}}
\setcounter{secnumdepth}{5}

%% Cover Related Package
\RequirePackage{xstring}
\RequirePackage{forloop}
\RequirePackage[comparenum]{arraysort}

%% -----------------------------------------------------------------

%% Styles setup

%% For EPS and PDF figures:
%\graphicspath{{Figure/PDF/}{Figure/EPS/}}
%% For only PDF figures:
\graphicspath{{Figure/EPS/}{Figure/EPS/Chapter1/}}
%% Page layout
%% twoside:
%\geometry{left=2.5cm, right=3cm, top=3cm, bottom=3cm}
%% oneside:
\geometry{left=2.75cm, right=2.75cm, top=3cm, bottom=3cm}

%% Degree
\ifBUPT@option@phd
  \def\BUPT@value@degree{\BUPT@label@phddegree}
  \def\BUPT@value@englishdegree{\BUPT@label@englishphddegree}
\else
  \def\BUPT@value@degree{\BUPT@label@masterdegree}
  \def\BUPT@value@englishdegree{\BUPT@label@englishmasterdegree}
\fi

%% Page style
\ifBUPT@option@draftcls
  \ctexset{today = old}
  \let\oldtoday\today
  \ctexset{today = small}
  \fancypagestyle{BUPThdrstyle}{%
    \fancyhf{}%
    \fancyhead[OR]{\zihao{-5} \leftmark}%
    \fancyhead[OL,ER]{\zihao{-5} DRAFT}%
    \fancyhead[EL]{\zihao{-5} \BUPT@label@university\BUPT@value@degreetype\BUPT@value@degree\BUPT@label@thesis}%
    \fancyhead[EC]{\zihao{-5} \oldtoday}%
    \fancyfoot[C]{\zihao{5} \thepage}%
    \renewcommand\headrulewidth{0.4\p@}%
    \renewcommand\footrulewidth{0\p@}}
\else
  \ifBUPT@option@cenhdr
    \fancypagestyle{BUPThdrstyle}{%
      \fancyhf{}%
      \fancyhead[OC]{\zihao{-5} \leftmark}%
      \fancyhead[EC]{\zihao{-5} \BUPT@label@university\BUPT@value@degreetype\BUPT@value@degree\BUPT@label@thesis}%
      \fancyfoot[C]{\zihao{5} \thepage}%
      \renewcommand\headrulewidth{0.4\p@}%
      \renewcommand\footrulewidth{0\p@}}
  \else
    \fancypagestyle{BUPThdrstyle}{%
      \fancyhf{}%
      \fancyhead[OR]{\zihao{-5} \leftmark}%
      \fancyhead[EL]{\zihao{-5} \BUPT@label@university\BUPT@value@degreetype\BUPT@value@degree\BUPT@label@thesis}%
      \fancyfoot[C]{\zihao{5} \thepage}%
      \renewcommand\headrulewidth{0.4\p@}%
      \renewcommand\footrulewidth{0\p@}}
  \fi
\fi
\let\BUPT@frontmatter\frontmatter
\def\frontmatter{\BUPT@frontmatter\pagestyle{BUPThdrstyle}}
%% Page style before \frontmatter
\AtBeginDocument{%
  \pagenumbering{alpha}%
  \pagestyle{empty}}

%% Headings
\ctexset{
  chapter = {
    format = \heiti\zihao{3}\bfseries\centering,
    beforeskip = -\p@,
    afterskip = 2 em,
    pagestyle = BUPThdrstyle
  },
  section = {
    format = \heiti\zihao{4}\bfseries\raggedright,
    beforeskip = 2 em,
     afterskip = 1 em,
  },
  subsection = {
    format = \heiti\zihao{-4}\bfseries\raggedright,
    beforeskip = 1 em,
    afterskip = 1 em,
  },
  subsubsection = {
  	format = \heiti\zihao{-4}\bfseries\raggedright,
  	beforeskip = 1 em,
  	afterskip = 1 em,
  },
}

%% Names
\ctexset{
  contentsname = {目\quad 录},
  listfigurename = {图目录},
  listtablename = {表目录}
}

%% linespread行间距
\setlength\parskip{\p@}%0\p@ \@plus 0.1\p@}
\linespread{1.3} % 1.5倍行距，要求为20磅，小四号字体情况下差2磅

%% Set ToC depth
\setcounter{tocdepth}{2}

%% Titlepage options
\def\BUPTthesiscntitlepage#1{\setkeys{cntitle}{#1}}
\define@key{cntitle}{confidential}{\def\BUPT@value@confidential{#1}}
\define@key{cntitle}{confidentialtime}{\def\BUPT@value@confidentialtime{#1}}
\define@key{cntitle}{title}{\long\def\BUPT@value@title{#1}}
\define@key{cntitle}{studentid}{\def\BUPT@value@studentid{#1}}
\define@key{cntitle}{name}{\def\BUPT@value@name{#1}}
\define@key{cntitle}{major}{\def\BUPT@value@major{#1}}
\define@key{cntitle}{supervisor}{\def\BUPT@value@supervisor{#1}}
\define@key{cntitle}{institute}{\def\BUPT@value@institute{#1}}
\define@key{cntitle}{degreetype}{\def\BUPT@value@degreetype{#1}}

\def\BUPTthesisentitlepage#1{\setkeys{entitle}{#1}}
\define@key{entitle}{title}{\long\def\BUPT@value@englishtitle{#1}}
\define@key{entitle}{name}{\def\BUPT@value@englishname{#1}}
\define@key{entitle}{desc}{\def\BUPT@value@englishdescription{#1}}
\define@key{entitle}{supervisor}{\def\BUPT@value@englishsupervisor{#1}}
\define@key{entitle}{major}{\def\BUPT@value@englishmajor{#1}}
\define@key{entitle}{degree}{\def\BUPT@value@englishdegree{#1}}
\define@key{entitle}{institute}{\def\BUPT@value@englishinstitute{#1}}

%% Titlepage
%% The \hss glue is equivalent to \hskip 0pt plus 1fil minus 1fil.
\def\BUPTunderline#1#2{\underline{\hbox to #1{\hss #2\hss}}}
\def\IsPositive#1{%
	TT\fi
	\ifcat_\ifnum0<0#1 _\else A\fi}
\newsavebox\mybox
\newcommand{\cmpLen}[2]{%
	\sbox\mybox{#1}\edef\cmpA{\number\wd\mybox}
	\sbox\mybox{#2}\edef\cmpB{\number\wd\mybox}
	\if\IsPositive{\cmpA}
		\if\IsPositive{\cmpB}
			\arraysortcomparenum{\cmpA}{\cmpB}
		\else
			\togglefalse {arraysortresequal}
			\toggletrue  {arraysortresult}
		\fi
	\else
		\if\IsPositive{\cmpB}
			\togglefalse {arraysortresequal}
			\togglefalse {arraysortresult}
		\else
			\arraysortcomparenum{\cmpA}{\cmpB}
		\fi
	\fi}

\long\def\BUPTtitletemp{\&\BUPT@value@title\&}
\StrCount{\BUPTtitletemp}{\&}[\tempnum]
\newcounter{NumofAnd}
\setcounter{NumofAnd}{\tempnum}
\newcounter{NumofRow}
\setcounter{NumofRow}{\the\numexpr\value{NumofAnd}-1\relax}
\newcounter{BUPTLoop}
\newcounter{BUPTLoopp}
\def\BUPTctrset{\setcounter{BUPTLoopp}{\theBUPTLoop}\stepcounter{BUPTLoopp}}
\newarray{BUPTtitle}
\expandarrayelementtrue
\forloop{BUPTLoop}{1}{\value{BUPTLoop} < \value{NumofAnd}}{\BUPTctrset
	\StrBetween[\value{BUPTLoop},\value{BUPTLoopp}]{\BUPTtitletemp}{\&}{\&}[\tempstr]
	\BUPTtitle(\value{BUPTLoop})={\tempstr}}
\sortArray[cmpLen]{\theNumofRow}{BUPTtitle}

\newlength{\BUPTtitlelen}
\settowidth{\BUPTtitlelen}{\BUPTtitle(\theNumofRow)}
\addtolength{\BUPTtitlelen}{5pt}

\newcommand\makechinesetitle{%
  \begin{flushright}
    \zihao{4}\bfseries \BUPT@label@confidential\BUPT@value@confidential~~~~\BUPT@label@confidentialtime\BUPT@value@confidentialtime~~~~
  \end{flushright}
  \vskip \stretch{1}
  \begin{center}
    \includegraphics[width=12.67cm]{\BUPT@value@schoolname}
    \vskip \stretch{0}
    {\CJKfamily{zhhei}\fontsize{32}{\p@} \bfseries \BUPT@value@degree\BUPT@label@thesis}
    \vskip \stretch{1}
    \includegraphics[width=3.43cm]{\BUPT@value@schoollogo}
    \vskip \stretch{2}
    {\zihao{-2}
	\renewcommand\arraystretch{1.2}
	\setlength\extrarowheight{1\p@}\bfseries
	\begin{tabular}{rc}
		\BUPT@label@title & \BUPTunderline{\BUPTtitlelen}{\StrBetween[1,2]{\BUPTtitletemp}{\&}{\&}} \\
		\forloop{BUPTLoop}{2}{\value{BUPTLoop} < \value{NumofAnd}}{ & \BUPTctrset\BUPTunderline{\BUPTtitlelen}{\StrBetween[\value{BUPTLoop},\value{BUPTLoopp}]{\BUPTtitletemp}{\&}{\&}} \\}
	\end{tabular}}
    \vskip \stretch{1}
    {\zihao{4}
    \renewcommand\arraystretch{1.2}
    \setlength\extrarowheight{1\p@}\bfseries
    \begin{tabular}{lc}
      \BUPT@label@studentid & \BUPTunderline{200\p@}{\BUPT@value@studentid} \\
      \BUPT@label@name & \BUPTunderline{200\p@}{\BUPT@value@name} \\
      \BUPT@label@major & \BUPTunderline{200\p@}{\BUPT@value@major} \\
      \BUPT@label@supervisor & \BUPTunderline{200\p@}{\BUPT@value@supervisor} \\
      \BUPT@label@institute & \BUPTunderline{200\p@}{\BUPT@value@institute}
    \end{tabular}}
    \vskip \stretch{1}
    {\CJKfamily{zhsong}\zihao{4}\bfseries \BUPT@value@chinesedate}
  \end{center}
  \cleardoublepage}

\newcommand\makeenglishtitle{%
  \begin{center}
    {\zihao{-2}\bfseries \BUPT@value@englishtitle}
    \vskip \stretch{2}
    {\zihao{-3}\bfseries \BUPT@value@englishdescription}
    \vskip \stretch{2}
    {\zihao{3}\bfseries \BUPT@value@englishname}
    \vskip \stretch{2}
    {\zihao{-3}\bfseries \BUPT@value@englishdegree}
    \vskip \stretch{2}
    {\zihao{-3} \BUPT@value@englishsupervisor}\\
    {\zihao{-3} BEIJING, CHINA}\\
    {\zihao{-3} \BUPT@value@englishdate}
  \end{center}
  \cleardoublepage}

%% Statement
\ifx\BUPT@value@confidential\@empty
  \def\BUPT@label@authorizationcomment{本学位论文不属于保密范围，适用本授权书。}
\else
  \def\BUPT@label@authorizationcomment{~}
\fi
%\BUPTunderline{40\p@}{\BUPT@value@confidentialtime}
\newcommand\makestatement{%
  \begin{center}
    \bfseries \BUPT@label@innovationtitle
  \end{center}\par
  \vskip 5\p@
  \BUPT@label@innovationparagraph
  \vskip 15\p@
  \BUPT@label@authorsignature\BUPTunderline{100\p@}{}\hfil\BUPT@label@issuedate\BUPTunderline{100\p@}{}
  \vskip 55\p@
  \begin{center}
    \bfseries \BUPT@label@authorizationtitle
  \end{center}\par
  \vskip 5\p@
  \BUPT@label@authorizationparagraph\par
  \BUPT@label@authorizationcomment
  \vskip 15\p@
  \BUPT@label@authorsignature\BUPTunderline{100\p@}{}\hfil\BUPT@label@issuedate\BUPTunderline{100\p@}{}
  \vskip 15\p@
  \BUPT@label@supervisorsignature\BUPTunderline{100\p@}{}\hfil\BUPT@label@issuedate\BUPTunderline{100\p@}{}
  \cleardoublepage}

%% Abstract
\newenvironment{cnabstract}{%
  \chapter[\BUPT@label@abstract]{\BUPT@value@title}
  \begin{center}
    {\zihao{-3}\heiti\bfseries\centering\BUPT@label@abstract}
  \end{center}\par
  \vskip 25\p@}%
  {}
\newcommand\cnkeywords[1]{%
  \vspace{2ex}\noindent{\bfseries\BUPT@label@keywords}#1}

\newenvironment{enabstract}{%
  \chapter[\BUPT@label@englishabstract]{\zihao{3}\BUPT@value@englishtitle}
  
  \begin{center}
    {\zihao{-3}\bfseries\centering\BUPT@label@englishabstract}
  \end{center}\par
  \vskip 25\p@}%
  {}
\newcommand\enkeywords[1]{%
  \vspace{2ex}\noindent{\bfseries\BUPT@label@englishkeywords}~~#1}

%% Nomenclature
\def\BUPT@value@longestnomenclature{$BUPTBUPTBUPT$}
\def\BUPTlongestlength#1{\setkeys{longestlength}{#1}}
\define@key{longestlength}{nomenclature}{\def\BUPT@value@longestnomenclature{#1}}

\newenvironment{nomenclature}[1][\BUPT@label@nomenclature]{%
  \chapter{#1}
  \begin{IEEEdescription}[\IEEEsetlabelwidth{\BUPT@value@longestnomenclature}\IEEEusemathlabelsep]}%
  {\end{IEEEdescription}}
\newlength\defaultlongestnomenclaturelen
\settowidth\defaultlongestnomenclaturelen{$BUPTBUPTBUPT$}
\typeout{-- Default longest nomenclature length is \defaultlongestnomenclaturelen.}

%% Abbreviation
\def\BUPT@value@longestabbreviation{BUPTBUPTBUPT}
\define@key{longestlength}{abbreviation}{\def\BUPT@value@longestabbreviation{#1}}
\newenvironment{abbreviation}[1][\BUPT@label@abbreviation]{%
  \chapter{#1}
  \begin{IEEEdescription}[\IEEEsetlabelwidth{\BUPT@value@longestabbreviation}]}%
  {\end{IEEEdescription}}
\newlength\defaultlongestabbreviationlen
\settowidth\defaultlongestabbreviationlen{BUPTBUPTBUPT}
\typeout{-- Default longest abbreviation length is \defaultlongestabbreviationlen.}

%% Appendix
%\newenvironment{appendix}[1][\BUPT@label@appendix]{\chapter{#1}}{}

%% Acknowledgement
\newenvironment{acknowledgement}[1][\BUPT@label@acknowledgement]{\chapter{#1}}{}

%% Publication
\newenvironment{publication}[1][\BUPT@label@publications]{\chapter{#1}}{}

%% Hyperref package setup
\ifBUPT@option@electronic
  \hypersetup{%
    bookmarksopen=true,%
    bookmarksnumbered=true,%
    pdfpagemode={UseOutlines},%default
    pdfstartview={FitH},%
    colorlinks=true,%
    citecolor={cyan},%
    pdftitle={English Title of Thesis},%
    pdfsubject={Beijing University of Posts and Telecommunications (BUPT) Thesis},%
    pdfauthor={Author Name},%
    pdfkeywords={BUPT, Thesis, LaTeX, Template}}
\fi

%% Extra definitions
\newcommand{\cemph}[1]{\textcolor{RubineRed}{#1}}  % Emphasize with color RubineRed
\DeclareSIUnit{\mdecibel}{\decibel\metre}  % dBm

%% -----------------------------------------------------------------

%% Define uesr commands
\def\upperroman#1{\uppercase\expandafter{\romannumeral#1}}
\def\lowerroman#1{\romannumeral#1}
\def\myvec#1{\bm{\mathrm{#1}}}

%% -----------------------------------------------------------------

\endinput
%% End of file `buptthesis.cls'.
