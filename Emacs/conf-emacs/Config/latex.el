(use-package auctex
  :defer t
  :ensure t)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
;; spellcheck in LaTex mode
(add-hook `latex-mode-hook `flyspell-mode)
(add-hook `tex-mode-hook `flyspell-mode)
(add-hook `bibtex-mode-hook `flyspell-mode)
(use-package cdlatex)
(add-hook 'LaTeX-mode-hook 'turn-on-cdlatex)
(add-hook 'org-mode-hook #'turn-on-org-cdlatex)
