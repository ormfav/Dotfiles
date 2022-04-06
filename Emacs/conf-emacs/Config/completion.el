(use-package company
  :diminish company-mode
  :init
  (global-company-mode)
  :config
  ;; set default 'company-backends'
  (setq company-backends '((company-files          ; files & directory
							company-keywords       ; keywords
							company-capf)          ; completion-at-point-functions
						   (company-abbrev company-dabbrev))))

(use-package company-statistics
    :init
    (company-statistics-mode))

(use-package company-try-hard
    :bind
    (("C-<tab>" . company-try-hard)
     :map company-active-map
     ("C-<tab>" . company-try-hard)))

(use-package company-quickhelp
    :config
    (company-quickhelp-mode))
