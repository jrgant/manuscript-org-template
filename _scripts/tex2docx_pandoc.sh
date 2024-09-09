#!/usr/bin/sh

if TYPE=draft
then
    REF_DOC=custom-reference-draft
else
    REF_DOC=custom-reference
fi

# convert org to tex
./_scripts/export-to-latex.el

# convert tex to docx
pandoc -o manuscript.docx \
    --reference-doc=_styles/${REF_DOC}.docx \
    --bibliography=references.bib \
    --csl=_styles/vancouver-brackets.csl \
    --lua-filter=_pandoc-filters/pagebreak.lua \
    --lua-filter=_pandoc-filters/docx-landscape.lua \
    -f latex+raw_tex \
    manuscript.tex

# convert docx to pdf
libreoffice --headless --convert-to pdf manuscript.docx
