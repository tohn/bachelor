#!/bin/bash

root=$(dirname $0)
#compiler="pdflatex"
# http://www.stefant.org/web/projects/software/pplatex.html
compiler="ppdflatex"

# http://www.nongnu.org/chktex/
chktex="$HOME/repos/TMP/chktex/chktex"

if [[ $# < 1 ]] ; then
	echo "  Usage: $0 <latex file w/o .tex> [full (y/n)]"
	echo "Example: $0 thesis y"
	exit 1
fi

name="$1"
full="$2"
pres="presentation"

if [[ $name == "notes" ]] ; then
	# use presentation.tex with the notes option
	# sed command to enable notes option
	sed -i '2s/^\%//;3s/^/\%/;4s/^\%//' $root/$pres.tex
	# compile!
	$compiler -output-directory $root -jobname $pres-notes \
			$root/$pres.tex
	# sed command to disable notes option again
	sed -i '2s/^/\%/;3s/^\%//;4s/^/\%/' $root/$pres.tex
	# exit successfully
	exit 0
fi

if [[ ! -e $root/$name.tex ]] ; then
	echo "No such file"
	exit 1
fi

if [[ $full == "c" ]] ; then
	# only check tex (chktex)
	$chktex $root/$name.tex
	exit 0
elif [[ $full == "a" ]] ; then
	# aspell
	# http://dbader.org/blog/spell-checking-latex-documents-with-aspell
	aspell -l de_DE --mode=tex -c $root/$name.tex
	aspell -l de_DE --mode=tex -c $root/acronyms.tex
	find $root/tex -name "*.tex" -exec aspell -l de_DE --mode=tex -c "{}" \;
	exit 0
else
	$compiler -output-directory $root $root/$name.tex
fi

if [[ $full == "y" ]] ; then
	# generate index
#	makeindex $root/$name.idx
	# generate bib
	bibtex $root/$name.aux
	bibtex $root/web.aux
	# generate glossary
	#makeglossaries $root/$name
	# http://tex.stackexchange.com/questions/111192/problems-with-xindy-and-glossaries
	# xindy -M lang/german/duden-utf8 -I xindy -M thesis -t thesis.glg
	# -o thesis.gls thesis.glo
	# compile pdf twice
	$compiler -output-directory $root $root/$name.tex
	$compiler -output-directory $root $root/$name.tex
fi

exit 0
