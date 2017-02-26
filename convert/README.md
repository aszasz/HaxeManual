TeX to MarkDown Converter
========================

Esse programa em haxe processa os conteúdo de *HaxeManual.tex* e gera os arquivos MarkDown (*.md*) para as diferentes seções. Os arquivos *.md* vivem em

`../md/manual`

Os arquivos *.md* são divididos e nomeados por seção e título
The *.md* files are broken out and named by subsection and title 

Geração do MarkDown
-------------------

verifique que as bibliotecas hxparse e hxargs estejam instaladas. If not:

`haxelib install hxparse hxargs`

E então execute o arquivo .hxml 

`haxe convert.hxml`

Exception... No Match:
---------

A maioria dos comandos de LaTex está corretamente processada, mas a lista não é exaustiva. Para adicionar um novo comando de LaTeX:

se for um comando personalizado de LaTeX (i.e criado pelo usuário):
1. Adicione como um `CustomCommand` nem LatexParser.hx -- Há vários exemplos no arquivo.

Se for um comando padrão do LaTeX:
1. Adicione o comando ao enum em *LatexCommand.hx*
2. Adiciona a funcionalidade ao switch apropriado em *LatexParser.hx*


