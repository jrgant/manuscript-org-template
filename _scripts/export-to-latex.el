#!/usr/bin/env doomscript

(defcli! export-org-to-latex (&args)
        "Export the org file to tex."
        (require 'doom-start)
        (find-file "manuscript.org")
        (org-latex-export-to-latex))

(run! "export-org-to-latex")
