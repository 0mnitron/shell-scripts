#!/bin/sh
# PNG quality (larger files)

# Go to current directory where the script is located
SCRIPT_DIR=$(dirname "$(readlink -f "$0")")
cd $SCRIPT_DIR

# Convert each PNG file to a *_converted.png by removing the alpha channel 
# and setting a white background (removing transparency)
for img in *.png; do
    convert "$img" -background white -alpha remove -alpha off "${img%.*}_converted.png"
done

# For each *_converted.png file, convert it to a PDF using the `img2pdf` command, with the PDF 
# being saved as <filename>.pdf
ls -1 *_converted.png | xargs -L1 -I {} img2pdf {} -o {}.pdf

# Merge all generated PDFs (from previous command) into a single PDF file named "output.pdf"
pdftk *_converted*.pdf cat output output.pdf

# Delete unnecessary .png and .pdf files
rm *_converted*

# Print "Converted!" to indicate the script has finished
echo "Converted!"
# Pause for 1 second before exiting
sleep 1
