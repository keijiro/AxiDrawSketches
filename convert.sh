#!/bin/bash

echo 'Processing image'
convert render.png -rotate 90 -threshold 90% temp.png

echo 'Scanning paths'
./autotrace/autotrace --centerline --output-format=svg temp.png > scan.svg

echo '<?xml version="1.0" standalone="yes"?>'    > plot.svg
echo '<svg width="480" height="300">'           >> plot.svg
echo '<g transform="scale(0.125)">'             >> plot.svg
cat scan.svg | tail -n +3 | head -n 1           >> plot.svg
echo '</g>'                                     >> plot.svg
echo '</svg>'                                   >> plot.svg

echo 'Done'
