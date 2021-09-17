from svgpathtools import svg2paths, wsvg, Path, Line

paths, attribs = svg2paths('scan.svg')

out = []
out.append('<?xml version="1.0" standalone="yes"?>')
out.append('<svg width="480" height="300">')
out.append('<style>path { stroke:black; fill:none; }</style>')
out.append('<g transform="scale(0.125)">')

for path in paths:
    for seg in path:
        if not isinstance(seg, Line) or seg.length() > 8:
            out.append('<path d="' + Path(seg).d() + '"/>')

out.append('</g>')
out.append('</svg>')

with open('cull.svg', 'w') as file:
    file.writelines(out)
