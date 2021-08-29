The following is my plotter art workflow with Unity.

1. On Unity, render a monochrome line-art image using the Recolor (contour
   line) effect. The resolution of the image should be high enough. I usually
   use 2400x3840.

1. Rotate it if needed.
   `convert temp.png -rotate 90 render.png`

1. Convert it into SVG using autotrace.
   `autotrace --centerline --output-format=svg render.png > plot.svg`

1. Edit the SVG file to change the resolution to 480x300.

1. Edit the SVG file to add a scaling group.
   `<g transform="scale(0.125)">...</g>`.

1. Plot the SVG file.
   `axicli plot.svg -G 3`

The official version of `autotrace` doesn't work for me (it emits segfaults
with png files).
I used [hanmertens' fork](https://github.com/hanmertens/autotrace.git) instead.

Memo: To toggle the pen position, use `axicli -m toggle`
