;;;;;;;;;;;;;;;;;;;;  org export setting  ;;;;;;;;;;;;;;;;;;;;
;; (setq org-odt-data-dir  (concat emax-maindir "/org/odt/"))
;; (setq org-export-odt-schema-dir (concat emax-maindir "/org/odt/schema"))
;; (setq org-odt-styles-dir (concat emax-maindir "/org/odt/styles"))
(setq org-export-with-timestamps nil)
(setq org-export-html-style-include-default nil)
(setq org-export-htmlize-output-type 'inline-css)
(setq org-export-html-link-home "/")
(setq org-export-with-LaTeX-fragments t)
(setq org-latex-remove-logfiles nil)
(setq org-export-latex-tables-column-borders t)
(setq org-export-latex-default-packages-alist '(("" "graphicx" t) ("" "longtable" t) ("" "float" t) ("" "wrapfig" t) ("" "soul" t) ("" "textcomp" t) ("" "amsmath" t)("" "amsfonts" t)("" "latexsym" t)("" "ifthen" t) ("" "ezfontcfg" t) ("" "mypgf" t) ("" "marvosym" t)))
(setq org-latex-default-packages-alist org-export-latex-default-packages-alist)
(cond ((equal system-configuration "arm-androideabi-linux-gnu")
       (setq org-latex-to-pdf-process (quote ("pdflatex -interaction nonstopmode -output-directory %o %f"))))
      ((eq system-type 'windows-nt)
       (setq org-latex-to-pdf-process (quote ("xelatex -shell-escape -interaction nonstopmode -output-directory %o %f"))))
      ;; (t (setq org-latex-to-pdf-process (quote ("xelatex -shell-escape -interaction nonstopmode -output-directory %o %f")))))
      (t (setq org-latex-to-pdf-process (quote ("pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f")))))
      
(setq org-latex-pdf-process org-latex-to-pdf-process)


(setq org-latex-title-command "\\dimilarmaketitle{\\withoutlegal}")
(setq org-latex-toc-command "\\dimilartoc\n")
(setq org-latex-classes '(("article" "\\documentclass[11pt,a4paper]{article}
\\usepackage[T1]{fontenc}
\\usepackage{indentfirst}
\\usepackage{lmodern}
\\usepackage{times}
\\usepackage{amsmath}
\\usepackage{amsfonts}
\\usepackage{marvosym}
\\usepackage{ifpdf}
\\usepackage{hyphenat}
\\usepackage[x11names]{xcolor}
\\usepackage{ezfontcfg,booktabs, multirow, enumerate,tabularx,colortbl,longtable}
\\usepackage{ifthen}
% \\usepackage{mypgf}
\\usepackage{graphicx}
\\usepackage{colortbl}
\\usepackage{minted}
\\renewcommand{\\theFancyVerbLine}{\\sffamily \\textcolor{red}{\\scriptsize \\oldstylenums{\\arabic{FancyVerbLine}}}}
\\newcounter{note}
\\newcommand\\dimilartoc{
\\tableofcontents
\\vspace*{2em}
}
\\usepackage{hyperref}
\\hypersetup{colorlinks=true,
bookmarksnumbered=true,
linkcolor=blue,
pdfstartview=FitH}
\\newcommand{\\note}[1]{
   \\refstepcounter{note}\\mbox{\\textsuperscript{\\tiny[\\thenote]}}
\\marginpar[\\raggedleft\\mbox{\\tiny\\textsuperscript{\\thenote}}\\parbox{\\marginparwidth}{\\rmfamily\\scriptsize\\color{red}#1}]
{\\raggedright\\mbox{\\tiny\\textsuperscript{\\thenote}}\\parbox{\\marginparwidth}{\\rmfamily\\scriptsize\\color{red}#1}}}
\\newcommand{\\nnote}[1]{
\\marginpar[\\raggedleft\\parbox{\\marginparwidth}{\\rmfamily\\scriptsize\\color{red}#1}]
{\\raggedright\\parbox{\\marginparwidth}{\\rmfamily\\scriptsize\\color{red}#1}}}
\\newsavebox{\\whitebgbox}
\\newenvironment{mybox}[2]
  {\\begin{lrbox}{\\whitebgbox}\\begin{minipage}[t]{\\textwidth}\\begin{minipage}{0.25\\textwidth}\\raggedright\\includegraphics[angle=0,height=1.2cm,width=1.2cm]{#1}\\raisebox{10pt}{\\parbox{2.8cm}{\\textcolor{\\mycolor}{\\Large \\bfseries #2}}}\\end{minipage}\\begin{minipage}{0.7\\textwidth}\\ttfamily  }
  {\\end{minipage}\\end{minipage}\\end{lrbox}\\begin{center}\\usebox{\\whitebgbox}\\end{center}}
\\newcommand\\dimilarmaketitle[1]{\\maketitle}
" ("\\section{%s}" . "\\section*{%s}") ("\\subsection{%s}" . "\\subsection*{%s}") ("\\subsubsection{%s}" . "\\subsubsection*{%s}") ("\\paragraph{%s}" . "\\paragraph*{%s}") ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))
                          ("book" "\\documentclass[11pt]{book}
%\\usepackage[utf8]{inputenc}
\\usepackage[T1]{fontenc}
\\usepackage{ezfontcfg}
\\usepackage{hyperref}
\\usepackage[version=3]{mhchem}
\\usepackage[x11names]{xcolor}
\\usepackage{minted}
\\renewcommand{\\theFancyVerbLine}{\\sffamily \\textcolor{red}{\\scriptsize \\oldstylenums{\\arabic{FancyVerbLine}}}}
\\hypersetup{colorlinks=true,
bookmarksnumbered=true,
linkcolor=blue,
pdfstartview=FitH}
\\newcounter{note}
\\newcommand{\\note}[1]{
   \\refstepcounter{note}\\mbox{\\textsuperscript{\\tiny[\\thenote]}}
\\marginpar[\\raggedleft\\mbox{\\tiny\\textsuperscript{\\thenote}}\\parbox{\\marginparwidth}{\\rmfamily\\scriptsize\\color{red}#1}]
{\\raggedright\\mbox{\\tiny\\textsuperscript{\\thenote}}\\parbox{\\marginparwidth}{\\rmfamily\\scriptsize\\color{red}#1}}}
\\newcommand{\\nnote}[1]{
\\marginpar[\\raggedleft\\parbox{\\marginparwidth}{\\rmfamily\\scriptsize\\color{red}#1}]
{\\raggedright\\parbox{\\marginparwidth}{\\rmfamily\\scriptsize\\color{red}#1}}}
\\newsavebox{\\whitebgbox}
\\newenvironment{mybox}[2]
  {\\begin{lrbox}{\\whitebgbox}\\begin{minipage}[t]{\\textwidth}\\begin{minipage}{0.25\\textwidth}\\raggedright\\includegraphics[angle=0,height=1.2cm,width=1.2cm]{#1}\\raisebox{10pt}{\\parbox{2.8cm}{\\textcolor{\\mycolor}{\\Large \\bfseries #2}}}\\end{minipage}\\begin{minipage}{0.7\\textwidth}\\ttfamily  }
  {\\end{minipage}\\end{minipage}\\end{lrbox}\\begin{center}\\usebox{\\whitebgbox}\\end{center}}
\\newcommand\\dimilarmaketitle[1]{\\maketitle}"
                           ("\\part{%s}" . "\\part*{%s}") ("\\chapter{%s}" . "\\chapter*{%s}") ("\\section{%s}" . "\\section*{%s}") ("\\subsection{%s}" . "\\subsection*{%s}") ("\\subsubsection{%s}" . "\\subsubsection*{%s}"))

                          ("manual" "\\documentclass[11pt,a4paper]{report}
\\usepackage[T1]{fontenc}
\\usepackage{indentfirst}
\\usepackage{lmodern}
\\usepackage{times}
\\usepackage{amsmath}
\\usepackage{amsfonts}
\\usepackage{marvosym}
\\usepackage{ifpdf}
\\usepackage{hyphenat}
\\usepackage[x11names]{xcolor}
\\usepackage{ezfontcfg,booktabs, multirow, enumerate,tabularx,colortbl,longtable}
\\usepackage{ifthen}
% \\usepackage{mypgf}
\\usepackage{graphicx}
\\usepackage{colortbl}
\\usepackage{minted}
\\renewcommand{\\theFancyVerbLine}{\\sffamily \\textcolor{red}{\\scriptsize \\oldstylenums{\\arabic{FancyVerbLine}}}}
\\renewcommand{\\raggedright}{\\leftskip=0pt \\rightskip=0pt plus 0cm}
\\usepackage[scale=0.775]{geometry}
\\setlength{\\parindent}{2em}
\\addtolength{\\parskip}{6pt}
\\providecommand{\\alert}[1]{\\textbf{#1}}
\\usepackage{fancyhdr}
\\fancypagestyle{myheadings}{%
\\fancyhead{}
\\fancyhead[L]{\\raisebox{15pt}{\\rightmark}}
\\fancyhead[R]{\\mylogo}
\\fancyfoot{}
\\fancyfoot[L]{\\FileSubTitle}
\\fancyfoot[R]{\\thepage}
\\renewcommand{\\headrulewidth}{0pt}
\\renewcommand{\\footrulewidth}{0pt}
\\addtolength{\\headheight}{44pt}
}
\\renewcommand\\chaptermark [1]{\\markboth {\\chaptername \\thechapter: #1}{}}
\\renewcommand\\sectionmark [1]{\\markright {\\thesection: #1}}

\\fancypagestyle{myfistpage}{%
\\fancyhead{}
\\fancyfoot{}
\\fancyfoot[L]{\\FileTitle}
\\fancyfoot[R]{\\thepage}
\\renewcommand{\\headrulewidth}{0pt}
\\renewcommand{\\footrulewidth}{0pt}
}

\\pagestyle{myheadings}

\\usepackage{url}
\\urlstyle{tt}
\\usepackage[noindentafter,calcwidth]{titlesec}
\\titleformat{\\chapter}[display]
{\\filright \\Huge \\normalfont\\bfseries\\ttfamily}
{\\titleline[r]{\\textcolor{\\mycolor}{\\Large \\fontsize{50pt}{\\baselineskip}\\selectfont \\thechapter \\Large}}}{-3.5ex}
{\\thispagestyle{myfistpage}\\textcolor{\\mycolor}}
[\\vspace{-10pt}{\\textcolor{\\mycolor}{\\titlerule[4pt]}}\\vspace{0pt}]
\\titlespacing{\\chapter}{0pc}{*3}{*20}

\\titleformat{\\section}{\\normalfont\\Large\\bfseries}{\\color{\\mycolor}\\thesection}{5pt}{\\color{\\mycolor}}
\\titleformat{\\subsection}{\\normalfont\\large\\bfseries}{\\color{\\mycolor}\\thesubsection}{5pt}{\\color{\\mycolor}}

\\pagenumbering{Roman}

\\newcommand\\dimilarmaketitle[1]{
\\thispagestyle{empty}
\\newlength{\\ttwidth}
\\newlength{\\sttskip}
\\newsavebox{\\ttsavebox}
% Create the reference text for measures
\\savebox{\\ttsavebox}{\\Huge \\textcolor{\\mycolor}{\\bfseries \\FileTitle}}
\\settowidth{\\ttwidth}{\\usebox{\\ttsavebox}}
\\settowidth{\\sttskip}{0.5*(\\textwidth-\\ttwidth)}
\\vspace*{10em}
\\begin{center}
\\begin{flushright}
\\mylogo
\\end{flushright}
\\begin{minipage}[c]{\\ttwidth}
\\Huge \\textcolor{\\mycolor}{\\bfseries \\FileTitle}\\\\
\\hspace{\\sttskip} \\large \\textcolor{\\mycolor}{\\textit{\\FileSubTitle}}\\\\
% \\hspace{\\sttskip} \\textcolor{\\mycolor}{\\rule{\\ttwidth}{1pt}}
\\end{minipage}
%\\textcolor{\\mycolor}{\\rule{\\textwidth}{2pt}}
\\vskip 30em
\\begin{flushright}
\\begin{minipage}[t]{0.3\\textwidth}
\\raggedright%
{\\docidtext：\\textit{\\FileNo}}\\\\[.35ex]
{\\docdate：\\textit{\\FileDate}}\\\\[.35ex]
{\\docauthor：\\textit{\\FileAuthor}}
\\end{minipage}
\\end{flushright}
\\end{center}
\\newpage
\\ifx#1\\undefined
\\section*{\\legaltitle}
\\LegalType
\\newpage
\\fi
}
\\newcounter{note}
\\newcommand{\\note}[1]{
\\refstepcounter{note}\\mbox{\\textsuperscript{\\tiny[\\thenote]}}
\\marginpar[\\raggedleft\\mbox{\\tiny\\textsuperscript{\\thenote}}\\parbox{\\marginparwidth}{\\rmfamily\\scriptsize\\color{red}#1}]
{\\raggedright\\mbox{\\tiny\\textsuperscript{\\thenote}}\\parbox{\\marginparwidth}{\\rmfamily\\scriptsize\\color{red}#1}}}
\\newcommand{\\nnote}[1]{
\\marginpar[\\raggedleft\\parbox{\\marginparwidth}{\\rmfamily\\scriptsize\\color{red}#1}]
{\\raggedright\\parbox{\\marginparwidth}{\\rmfamily\\scriptsize\\color{red}#1}}}
\\providecommand{\\alert}[1]{\\textbf{#1}}
\\newcommand\\dimilartoc{
\\tableofcontents
\\clearpage
\\pagenumbering{arabic}
\\setcounter{page}{1}
}
\\newsavebox{\\whitebgbox}
\\newenvironment{mybox}[2]
{\\begin{lrbox}{\\whitebgbox}\\begin{minipage}[t]{\\textwidth}\\begin{minipage}{0.25\\textwidth}\\raggedright\\includegraphics[angle=0,height=1.2cm,width=1.2cm]{#1}\\raisebox{10pt}{\\parbox{2.8cm}{\\textcolor{\\mycolor}{\\Large \\bfseries #2}}}\\end{minipage}\\begin{minipage}{0.7\\textwidth}\\ttfamily  }
{\\end{minipage}\\end{minipage}\\end{lrbox}\\begin{center}\\usebox{\\whitebgbox}\\end{center}}"
("\\chapter{%s}" . "\\chapter*{%s}") ("\\section{%s}" . "\\section*{%s}") ("\\subsection{%s}" . "\\subsection*{%s}") ("\\subsubsection{%s}" . "\\subsubsection*{%s}"))

("dhdoc" "\\documentclass[11pt,a4paper]{report}
\\usepackage[T1]{fontenc}
\\usepackage{indentfirst}
\\usepackage{lmodern}
\\usepackage{times}
\\usepackage{amsmath}
\\usepackage{amsfonts}
\\usepackage{marvosym}
\\usepackage{ifpdf}
\\usepackage{hyphenat}
\\usepackage[x11names]{xcolor}
\\usepackage{ezfontcfg,booktabs, multirow, enumerate,tabularx,colortbl,longtable}
\\usepackage{ifthen}
% \\usepackage{mypgf}
\\usepackage{graphicx}
\\usepackage{colortbl}
\\usepackage{minted}
\\renewcommand{\\theFancyVerbLine}{\\sffamily \\textcolor{red}{\\scriptsize \\oldstylenums{\\arabic{FancyVerbLine}}}}
\\usepackage{titletoc}
\\usepackage{pifont}
\\renewcommand\\chaptername{\\ding{110}}
\\renewcommand\\thesection{\\ding{110}}
\\renewcommand\\thesubsection{\\ding{110}}

\\renewcommand{\\raggedright}{\\leftskip=0pt \\rightskip=0pt plus 0cm}
\\usepackage[scale=0.775]{geometry}
\\setlength{\\parindent}{2em}
\\addtolength{\\parskip}{6pt}
\\providecommand{\\alert}[1]{\\textbf{#1}}
\\usepackage{fancyhdr}
\\fancypagestyle{myheadings}{%
\\fancyhead{}
% \\fancyhead[L]{\\raisebox{15pt}{\\rightmark}}
% \\fancyhead[R]{\\mylogo}
\\fancyfoot{}
% \\fancyfoot[L]{\\FileSubTitle}
\\fancyfoot[R]{\\thepage}
\\renewcommand{\\headrulewidth}{0pt}
\\renewcommand{\\footrulewidth}{0pt}
\\addtolength{\\headheight}{44pt}
}
\\renewcommand\\chaptermark [1]{\\markboth {\\chaptername #1}{}}
\\renewcommand\\sectionmark [1]{\\markright {#1}}

\\fancypagestyle{myfistpage}{%
\\fancyhead{}
\\fancyfoot{}
\\fancyfoot[L]{\\FileTitle}
\\fancyfoot[R]{\\thepage}
\\renewcommand{\\headrulewidth}{0pt}
\\renewcommand{\\footrulewidth}{0pt}
}

\\pagestyle{myheadings}

\\usepackage{url}
\\urlstyle{tt}
\\usepackage[noindentafter,calcwidth]{titlesec}
\\titlespacing{\\chapter}{0pc}{*0}{*0}
\\titleformat{\\chapter}[hang]{\\huge \\normalfont\\bfseries}{\\chaptername}{5pt}{}
\\titleformat{\\section}{\\normalfont\\Large\\bfseries}{\\color{\\mycolor}\\thesection}{5pt}{\\color{\\mycolor}}
\\titleformat{\\subsection}{\\normalfont\\large\\bfseries}{\\color{\\mycolor}\\thesubsection}{5pt}{\\color{\\mycolor}}

\\pagenumbering{Roman}
\\def\\numberline#1{}
\\newcommand\\dimilarmaketitle[1]{
\\thispagestyle{empty}
\\newlength{\\ttwidth}
\\newlength{\\sttskip}
\\newsavebox{\\ttsavebox}
% Create the reference text for measures
\\savebox{\\ttsavebox}{\\Huge \\textcolor{\\mycolor}{\\bfseries \\FileTitle}}
\\settowidth{\\ttwidth}{\\usebox{\\ttsavebox}}
\\settowidth{\\sttskip}{0.5*(\\textwidth-\\ttwidth)}
\\vspace*{6cm}
\\begin{center}
\\begin{minipage}[c]{\\ttwidth}
\\Huge \\textcolor{\\mycolor}{\\bfseries \\FileTitle}\\\\
\\end{minipage}
\\begin{minipage}[t]{\\textwidth}
\\begin{center}
{作者：\\FileAuthor}\\\\[.35ex]
{\\FileDate}\\\\[.35ex]
{\\FileVersion}
\\end{center}
\\end{minipage}
\\end{center}
\\newpage
}
\\newcommand\\dimilartoc{
\\tableofcontents
\\clearpage
\\pagenumbering{arabic}
\\setcounter{page}{1}
}
\\newcounter{note}
\\newcommand{\\note}[1]{
   \\refstepcounter{note}\\mbox{\\textsuperscript{\\tiny[\\thenote]}}
\\marginpar[\\raggedleft\\mbox{\\tiny\\textsuperscript{\\thenote}}\\parbox{\\marginparwidth}{\\rmfamily\\scriptsize\\color{red}#1}]
{\\raggedright\\mbox{\\tiny\\textsuperscript{\\thenote}}\\parbox{\\marginparwidth}{\\rmfamily\\scriptsize\\color{red}#1}}}
\\newcommand{\\nnote}[1]{
\\marginpar[\\raggedleft\\parbox{\\marginparwidth}{\\rmfamily\\scriptsize\\color{red}#1}]
{\\raggedright\\parbox{\\marginparwidth}{\\rmfamily\\scriptsize\\color{red}#1}}}
\\newsavebox{\\whitebgbox}
\\newenvironment{mybox}[2]
  {\\begin{lrbox}{\\whitebgbox}\\begin{minipage}[t]{\\textwidth}\\begin{minipage}{0.25\\textwidth}\\raggedright\\includegraphics[angle=0,height=1.2cm,width=1.2cm]{#1}\\raisebox{10pt}{\\parbox{2.8cm}{\\textcolor{\\mycolor}{\\Large \\bfseries #2}}}\\end{minipage}\\begin{minipage}{0.7\\textwidth}\\ttfamily  }
  {\\end{minipage}\\end{minipage}\\end{lrbox}\\begin{center}\\usebox{\\whitebgbox}\\end{center}}"
 ("\\chapter{%s}" . "\\chapter*{%s}") ("\\section{%s}" . "\\section*{%s}") ("\\subsection{%s}" . "\\subsection*{%s}") ("\\subsubsection{%s}" . "\\subsubsection*{%s}"))

("letterzh" "\\documentclass[11pt]{letter}
\\usepackage[T1]{fontenc}
\\usepackage{lmodern}
\\usepackage{ezfontcfg}
\\usepackage{indentfirst}
\\usepackage{marvosym}
\\usepackage{ngerman}
\\usepackage{ifpdf}
\\usepackage{graphicx}
\\pagestyle{empty}
\\usepackage[scale=0.775]{geometry}
\\setlength{\\parindent}{2em}
\\addtolength{\\parskip}{0pt}
\\renewcommand{\\ttdefault}{pcr}
\\newcommand{\\ltitle}[1]{\\noindent{#1:}}
\\newcommand{\\lgreet}[1]{\\indent{#1}}
\\newcommand{\\lend}{\\vspace{0em}\\indent{此致}\\newline\\noindent{敬礼!}\\\\
\\rightline{XXX}\\\\\\rightline{\\number\\year 年 \\number\\month 月 \\number\\day 日}}
\\usepackage{url}
\\urlstyle{tt}
\\usepackage{geometry}
\\geometry{a4paper,left=3cm,right=30mm, top=3cm, bottom=0cm} 
\\def\\firstname{Name}
\\def\\familyname{Nachname}
\\def\\FileAuthor{\\firstname \\familyname}
\\def\\FileTitle{\\firstname \\familyname's letter}
\\def\\FileSubject{letter}
\\def\\FileKeyWords{\\firstname \\familyname, letter}
\\usepackage{hyperref}
\\hypersetup{
pdfborder=0,
breaklinks,
baseurl=http://,
pdfpagemode=None,
pdfstartview=XYZ,
pdfstartpage=1
pdfauthor = \\FileAuthor,%
pdftitle = \\FileTitle,%
pdfsubject = \\FileSubject,%
pdfkeywords = \\FileKeyWords,%
pdfcreator = \\LaTeX,%
pdfproducer = \\LaTeX}
\\renewcommand\\maketitle{}"
 ("\\section{%s}" . "\\section*{%s}") ("\\subsection{%s}" . "\\subsection*{%s}") ("\\subsubsection{%s}" . "\\subsubsection*{%s}") ("\\paragraph{%s}" . "\\paragraph*{%s}") ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))
("letteren" "\\documentclass[11pt]{letter}
\\usepackage[utf8]{inputenc}
\\usepackage[T1]{fontenc}
\\usepackage{lmodern}
\\usepackage{marvosym}
\\usepackage{ngerman}
\\usepackage{ifpdf}
\\usepackage{graphicx}
\\pagestyle{empty}
\\usepackage[scale=0.775]{geometry}
\\setlength{\\parindent}{0pt}
\\addtolength{\\parskip}{6pt}
\\renewcommand{\\ttdefault}{pcr}
\\usepackage{url}
\\urlstyle{tt}
\\usepackage{geometry}
\\geometry{a4paper,left=3cm,right=30mm, top=3cm, bottom=3cm} 
\\def\\firstname{Name}
\\def\\familyname{Nachname}
\\def\\FileAuthor{\\firstname \\familyname}
\\def\\FileTitle{\\firstname \\familyname's letter}
\\def\\FileSubject{letter}
\\def\\FileKeyWords{\\firstname \\familyname, letter}
\\usepackage{hyperref}
\\hypersetup{
pdfborder=0,
breaklinks,
baseurl=http://,
pdfpagemode=None,
pdfstartview=XYZ,
pdfstartpage=1
pdfauthor = \\FileAuthor,%
pdftitle = \\FileTitle,%
pdfsubject = \\FileSubject,%
pdfkeywords = \\FileKeyWords,%
pdfcreator = \\LaTeX,%
pdfproducer = \\LaTeX}
\\newcommand\\dimilarmaketitle[1]{}"
 ("\\section{%s}" . "\\section*{%s}") ("\\subsection{%s}" . "\\subsection*{%s}") ("\\subsubsection{%s}" . "\\subsubsection*{%s}") ("\\paragraph{%s}" . "\\paragraph*{%s}") ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))
("beamer" "
\\documentclass[english,11pt,presentation,mathserif]{beamer}
%\\usepackage[chinese]{babel}
%\\usepackage[utf8]{inputenc}
\\usepackage[T1]{fontenc}
\\newcommand{\\annotation}[1]{%
  \\marginpar{\\ttfamily\\color{cyan}#1}}
\\mode<article>
{
  \\usepackage{times}
  \\usepackage{mathptmx}
  \\usepackage[left=1.5cm,right=6cm,top=1.5cm,bottom=3cm]{geometry}
}
\\AtBeginSection[]
{
  \\begin{frame}<beamer>
    \\frametitle{\\contentsname}
    \\tableofcontents[currentsection]
  \\end{frame}
}
\\usepackage{fancybox}
\\usepackage{multimedia}
\\usepackage{colortbl}
\\usepackage{yfonts}
\\usepackage{colortbl}
\\usepackage{translator}
\\usepackage{times}
\\usepackage{graphicx}
\\usepackage{longtable}
\\usepackage{float}
\\usepackage{wrapfig}
\\usepackage{soul}
\\usepackage{textcomp}
\\usepackage{amsmath}
\\usepackage{amsfonts}
\\usepackage{marvosym}
\\usepackage{wasysym}
\\usepackage{latexsym}
%\\usepackage{amssymb}
\\usepackage{ifthen}
\\usepackage{mypgf}
\\usepackage{minted}
\\renewcommand{\\theFancyVerbLine}{\\sffamily \\textcolor{red}{\\scriptsize \\oldstylenums{\\arabic{FancyVerbLine}}}}
\\usepackage{ezfontcfg}
\\usepackage{hyperref}
\\setbeamerfont{section number projected}{%
  family=\\rmfamily,series=\\bfseries,size=\\normalsize}
\\setbeamercolor{section number projected}{bg=intelcolor,fg=white}
\\setbeamertemplate{sections/subsections in toc}[ball]
\\newcommand\\dimilarmaketitle[1]{
\\maketitle
\\begin{frame}{\\legaltitle}
\\setbeamercolor{uppercol}{fg=white,bg=blue!40!gray}
\\setbeamercolor{lowercol}{fg=white,bg=intelcolor}
\\begin{beamerboxesrounded}[upper=uppercol,lower=lowercol,shadow=true]{}
\\small \\legalstift
\\end{beamerboxesrounded}
\\end{frame}
}
\\newlength{\\ttwidth}
\\newlength{\\sttskip}
\\newsavebox{\\ttsavebox}
\\newcommand\\dimilartoc{
\\tableofcontents
\\clearpage
\\setcounter{framenumber}{0}
}
%%\\logo{\\includegraphics[width=1.95cm]{dhlogo}}
" ("\\section{%s}" . "\\section*{%s}")
("\\subsection{%s}" . "\\subsection*{%s}")
("\\subsubsection{%s}" . "\\subsubsection*{%s}"))))
(setq org-latex-with-hyperref nil)
(setq org-beamer-outline-frame-title "\\tocframetitle")

(require 'ox-latex)
(setq org-src-fontify-natively t)
(setq org-src-preserve-indentation t)
;;(add-to-list 'org-export-latex-packages-alist '("" "minted"))
(add-to-list 'org-latex-minted-langs '(R "r"))
(add-to-list 'org-latex-minted-langs '(C "c"))
(add-to-list 'org-latex-minted-langs '(C++ "c++"))
(setq org-latex-listings t)
(setq org-latex-listings 'minted)
(setq org-latex-create-formula-image-program 'imagemagick)
(setq org-latex-table-caption-above nil)
(setq org-format-latex-options
   '(:foreground "royal blue" :background "Transparent" :scale 1.5 :html-foreground "black" :html-background "white" :html-scale 1.0 :matchers
                 ("begin" "$1" "$" "$$" "\\(" "\\[")))
(defmacro by-backend (&rest body)
  `(case (if (boundp 'backend) (org-export-backend-name backend) nil) ,@body))
(setq org-latex-minted-options
      '(("frame" "single")
        ("framesep" "10pt")
        ("fontfamily" "tt")
        ("fontsize" "\\scriptsize")
        ("xleftmargin" "2em")
        ("xrightmargin" "2em")
        ("mathescape " "true")
        ("linenos" "true")))
