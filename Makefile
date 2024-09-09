export DATE=$$(date +%Y-%m-%d-%H%M)

draft:
	TYPE=draft ./_scripts/tex2docx_pandoc.sh

final:
	./_scripts/tex2docx_pandoc.sh

timestamp-draft:
	TYPE=draft cp manuscript_draft.docx _drafts/manuscript_DRAFT_$(DATE).docx
	TYPE=draft cp manuscript_draft.pdf _drafts/manuscript_DRAFT_$(DATE).pdf

timestamp-final:
	cp manuscript.docx _final/manuscript_$(DATE).docx
	cp manuscript.pdf  _final/manuscript_$(DATE).pdf

cleantex:
	rm -f *.aux *.bbl *.synctex.gz *.log
