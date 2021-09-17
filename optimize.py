from svgpathtools import svg2paths, wsvg, Path, Line

paths, attribs = svg2paths('scan.svg')

out = []
out.append('<?xml version="1.0" standalone="yes"?>')
out.append('<svg width="480" height="300">')
out.append('<g transform="scale(0.125)">')

for path in paths:
    new_path = Path()
    for seg in path:
        if not isinstance(seg, Line) or seg.length() > 4:
            new_path.append(seg)
    out.append('<path style="stroke:#000000; fill:none;" d="' + new_path.d() + '"/>')

out.append('</g>')
out.append('</svg>')

with open('plot.svg', 'w') as file:
    file.writelines(out)
