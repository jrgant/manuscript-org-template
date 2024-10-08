export DATE=$$(date +%Y-%m-%d-%H%M-%Z --utc)

draft:
	TYPE=draft ./_scripts/org2output.sh

final:
	./_scripts/org2output.sh

timestamp-draft:
	ls _drafts | grep '(pdf|docx)' | xargs -r mv -t _drafts/.graveyard/
	cp manuscript.docx _drafts/manuscript_DRAFT_$(DATE).docx
	cp manuscript.pdf _drafts/manuscript_DRAFT_$(DATE).pdf

timestamp-final:
	ls _drafts | grep '(pdf|docx)' | xargs -r mv -t _final/.graveyard
	cp manuscript.docx _final/manuscript_$(DATE).docx
	cp manuscript.pdf  _final/manuscript_$(DATE).pdf

cleantex:
	rm -f *.aux *.bbl *.synctex.gz *.log
