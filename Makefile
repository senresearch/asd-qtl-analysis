#!/bin/sh

secondAnalysis.html: secondAnalysis.txt
	echo 'library(ascii); library(cacheSweave); setCacheDir("rCache"); Asciidoc("secondAnalysis.txt", echo=TRUE,keep.source=T,width=6,height=6,results="verbatim",pdf=FALSE,prefix.string="graphics/asd",driver=cacheSweaveAsciidoc())' | R --vanilla --quiet
	asciidoc -a toc2 -a num -o secondAnalysis.html secondAnalysis.txt.txt

asdAnalysis.html: asdAnalysis.txt
	echo 'library(ascii); library(cacheSweave); setCacheDir("rCache"); Asciidoc("asdAnalysis.txt", echo=TRUE,keep.source=T,width=6,height=6,results="verbatim",pdf=FALSE,prefix.string="graphics/asd",driver=cacheSweaveAsciidoc())' | R --vanilla --quiet
	asciidoc -a toc -a num -o asdAnalysis.html asdAnalysis.txt.txt

