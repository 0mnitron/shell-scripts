#JPG quality (smaller files)

#!/bin/sh

cd ~/Desktop/img2pdf

#PNG to JPG
mogrify -quality 60% -format jpg *.png

ls -1 ./*jpg | xargs -L1 -I {} img2pdf {} -o {}.pdf
pdftk *.pdf cat output low.pdf

#delete unnecessary PDF files and JPG files
rm *jpg.pdf
rm *jpg
