# [Manual do Haxe]

O branch master aqui é o esforço de tradução (master here is the translation)

O branch `hxfmaster` é o master da Haxe Foundation

Contributions / Information for authors
-------------

**Para contribuir por favor edite os arquivos _.tex_ em [HaxeManual/](HaxeManual/).  Os arquivos _.md_ (e o _.pdf_) são gerados a partir deles.**

(O Capítulo 1 está ok, o capítulo 2 está em andamento.
Existe uma versão dos Capítulos 6 ao 12 parcialmente formatada formatada [aqui] (https://github.com/aszasz/manual-do-haxe-bruto/) que corresponde ao estado do manual original em janeiro de 2015. Fique a vontade para comparar e formatar )
(

O manual é estruturado usando esses comandos:

`\chapter{nome}`, `\section{nome}`, `\subsection{nome}`, `\paragraph{nome}`
>  Esses comandos geram respectivamente o início de capítulo, secção, subseção e parágrafo. Para os três primeiros a utilização do comando `\label{id}` na sequência é mandatória para que a URL do markdown possa ser criada. Não deve conter espaços. 

Formatação:  
* Text em negrito: `\emph{Emphasized text}`
* Código: `\expr{haxe code}`, `\type{MyClass}`, `\ic{other code}`
* Desde: `\since{3.1.0}`
* Caixa com definição: `\define{Expressão}{define-definition}{Texto que define a expressão}`
* Caixa com curiosidades: `\trivia{Assunto da Curiosidade}{Texto contando a curiosidade}`
* Links internos: `\tref{Nome para o link}{chapter-section-id}` ou `\Fullref{chapter-section-id}`
* Links externos: `\href{https://haxe.org}{Website do Haxe}`

Optamos por manter `id` em `\labels{id}` e `{define-definition}` em blocos `\defines` com os nomes originais, por tanto não traduza essa parte nem as referências a eles (sempre em inglês e com hífens). Optamos por deixar os nomes dos arquivos como no original

Block of [external code](HaxeManual/assets) (preferred since those are tested):  
```tex
\haxe{assets/Color.hx}
```
Block of code:  
```tex
\begin{lstlisting}
trace("Haxe is great!");
\begin{lstlisting}
```
Unordered list:
```tex
\begin{itemize}
	\item What is your name?
	\item How old are you?
\end{itemize}
```
Definition list:
```tex
\begin{description}
	\item[Coffee] Black hot drink
	\item[Milk] White cold drink
\end{description}
```

---

Geração de .md
-----------------

Execute [convert/convert.hxml](convert/convert.hxml) para gerar o  markdown que será exportado para o [diretório de saída](output/). Para testar mais rapidamente, desabilite a geração para .mobi.

Você pode usar as seguintes definições quando quiser usar `convert` com funcionalidades adicionais.

- `-D compileEnv`
Gera imagens exlusivas para o LaTeX que são muito complexas para o Markdow (especificamente o `fluxograma` à epoca em que isso foi escrito). Pula imagens que já existem.
- `-D recompileEnv`
Gera imagens, mesmo que elas já existam no local de destion (mais útil para o desenvolvimento de `convert`).
- `-D keepEnvPDF`
Mantem os arquivos PDF gerados pelo LaTeX generated PDF files. Eles são posicionados proximos às imagens geradas com o mesmo nome.
- `-D keepEnvTemp`
Mantem o diretório temporário gerado para a compilação do LaTeX. Útil para debug / desevolvimento.


PDF generation
--------------

Para rebuildar o .pdf da lina de comando, execute `latexmk -xelatex HaxeManual/HaxeManual.tex` ou `make`.
Uma versão recente do [TeX Live] deve fornecer latexmk bem como todos os pacotes necessários e suas dependênciaa

 - xelatex
 - cleveref
 - courier
 - framed
 - fullpage
 - geometry
 - graphicx
 - hyperref
 - listings
 - palatino
 - tikz, tkz-euclide, tkz-qtree
 - todonotes
 - underscore
 - xcolor
 - fontenc
 - babel
 


Requerimentos para `compileEnv`
-----------------------------

A época em que isso foi escrito, `compileEnv` dependia dos seguintes:

- `xelatex` estar no path. [TeX Live] versão 2013 deve ser suficiente. É usado para compilar snipets personalizados de LaTeX para PDF.
- `mudraw` estar no path. Isso é uma parte do [MuPDF]. Usado para reinderizar uma imagem de PDF em PNG.
- `pandoc` estar no path. Usado para a geração de arquivos  *.epub*.
- `ebook-convert` estar no path. Isso é parte do [calibre]. Usado para converter *.epub* para *.mobi*.
-  Fonts [Source Sans Pro] e [Source Code Pro] estarem instaladas.


[TeX Live]:http://www.tug.org/texlive/
[MuPDF]:http://www.mupdf.com/
[calibre]:http://calibre-ebook.com/
[Source Sans Pro]:http://sourceforge.net/projects/sourcesans.adobe/
[Source Code Pro]:http://sourceforge.net/projects/sourcecodepro.adobe/

