(defun ormfav/org-mode-setup ()
	(org-indent-mode)
	(visual-line-mode 1))
(use-package org
  :hook
	(org-mode . ormfav/org-mode-setup)
  :config
	(setq org-ellipsis " ▾"
		  org-hide-leading-stars 30)
	(global-set-key (kbd "C-c l s") 'org-store-link)
	(global-set-key (kbd "C-c l i ") 'org-insert-link)
	(global-set-key (kbd "C-c a") 'org-agenda)
	(global-set-key (kbd "C-c c") 'org-capture)
)

(org-babel-do-load-languages
 'org-babel-load-languages '((shell . t)
							 (python . t)
							 (ledger . t)))

(setq org-src-fontify-natively t) ;; Syntax highlight in #+BEGIN_SRC blocks

(setq org-todo-keywords '((sequence "TODO(t)" "NEXT(n)" "WAIT(w)" "PROJ(p)" "IMMD(i)" "|" "DONE(d)")
						  (sequence "|" "CANC(c)")))
(setq org-todo-keyword-faces
	  '(("TODO" :foreground "#f6c177" :weight bold)
		("NEXT" :foreground "#6e6a86" :weight bold)
		("WAIT" :foreground "#555169" :weight bold)
		("PROG" :foreground "#ebbcba" :background "#555169" :weight bold)
		("IMMD" :foreground "red" :weight bold)
		("DONE" :foreground "#9ccfd8" :weight bold)
		("CANC" :foreground "#26233a" :weight bold))
)
	  
(setq org-default-notes-file "~/Org/.notes.org")

;; Define the custum capture templates
(setq org-capture-templates
      '(("t" "todo" entry (file org-default-notes-file)
			"* TODO %?\n%u\n" :clock-resume t)
		("i" "Idea" entry (file org-default-notes-file)
			"* %? :IDEA: \n%t" :clock-resume t)
		("n" "Next Task" entry (file+headline org-default-notes-file "Tasks")
			"** NEXT %? \nDEADLINE: %t") ))

(setq org-refile-targets (quote ((nil :maxlevel . 9)
                                 (org-agenda-files :maxlevel . 9))))

(setq org-agenda-files
      '("~/Org/todolist.org"))
(setq org-agenda-prefix-format
	  '((agenda . " %i %-12:c%?-12t% s")
	   (todo . "\n %i %b ")
	   (tags . " %i %-12:c")
	   (search . " %i %-12:c"))
)
(setq org-agenda-breadcrumbs-separator "->")

;; Set default column view headings: Task Total-Time Time-Stamp
(setq org-columns-default-format "%50ITEM(Task) %10CLOCKSUM %16TIMESTAMP_IA")


(use-package org-bullets
  :after org
  :hook (org-mode . org-bullets-mode))

(use-package org-roam
  :ensure t
  :init (setq org-roam-v2-ack t)
  :custom (org-roam-directory "~/SecondBrain")
  :bind (("C-c n l" . org-roam-buffer-toggle)
		 ("C-c n f" . org-roam-node-find)
		 ("C-c n d" . org-roam-dailies-capture-today)
		 ("C-c n D" . org-roam-dailies-goto-date))
		 (:map org-mode-map
			(("C-c n i" . org-roam-node-insert)
			 ("C-c n o" . org-id-get-create)
			 ("C-c n t" . org-roam-tag-add)
			 ("C-c n a" . org-roam-alias-add)
			 ("C-c n l" . org-roam-buffer-toggle)
			 ("C-c n <" . org-roam-dailies-previous-note)
			 ("C-c n >" . org-roam-dailies-next-note)))
  :config (org-roam-setup))
(setq org-roam-dailies-directory "Dailies/")
(setq org-roam-dailies-capture-templates
      '(("d" "default" entry "* Sogni\n%?\n\n* Emozioni\n"
         :if-new (file+head "%<%Y-%m-%d>.org"
                            "#+title: %<%Y-%m-%d>\n"))))
