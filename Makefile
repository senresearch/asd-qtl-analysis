#!/bin/sh

secondAnalysis.html: secondAnalysis.txt
	echo 'library(ascii); library(cacheSweave); setCacheDir("rCache"); Asciidoc("secondAnalysis.txt", echo=TRUE,keep.source=T,width=6,height=6,results="verbatim",pdf=FALSE,prefix.string="graphics/asd",driver=cacheSweaveAsciidoc())' | R --vanilla --quiet
	asciidoc -a toc2 -a num -o secondAnalysis.html secondAnalysis.txt.txt

asdAnalysis.html: asdAnalysis.txt
	echo 'library(ascii); library(cacheSweave); setCacheDir("rCache"); Asciidoc("asdAnalysis.txt", echo=TRUE,keep.source=T,width=6,height=6,results="verbatim",pdf=FALSE,prefix.string="graphics/asd",driver=cacheSweaveAsciidoc())' | R --vanilla --quiet
	asciidoc -a toc -a num -o asdAnalysis.html asdAnalysis.txt.txt

index.html: index.txt
	asciidoc -a latexmath index.txt

website: index.html secondAnalysis.html secondAnalysis.txt
	lftp -c 'open -u sen -p 990 ftps://ftps.sfcc-cpmc.net/gould; ls; put index.html'
	lftp -c 'open -u sen -p 990 ftps://ftps.sfcc-cpmc.net/gould; ls; put secondAnalysis.html'
	lftp -c 'open -u sen -p 990 ftps://ftps.sfcc-cpmc.net/gould; ls; put secondAnalysis.txt'
