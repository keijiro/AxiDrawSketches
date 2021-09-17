#!/bin/bash

echo 'Processing image'
convert render.png -rotate 90 -threshold 90% temp.png
#convert render.png -threshold 90% temp.png

echo 'Scanning paths'
./autotrace/autotrace --centerline --output-format=svg temp.png > scan.svg

echo 'Optimize paths'
python3 optimize.py

echo 'Done'
