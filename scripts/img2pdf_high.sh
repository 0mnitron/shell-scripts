#PNG quality (large files)

#!/bin/sh

cd ~/Desktop/img2pdf

convert *.png -background white -alpha remove -alpha off converted_png.png

ls -1 ./converted_png*png | xargs -L1 -I {} img2pdf {} -o {}.pdf
pdftk *.pdf cat output img.pdf

#delete unnecessary files
rm converted_png-*.png
rm converted_png-*.pdf
