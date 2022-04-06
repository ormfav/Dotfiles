(setq initial-buffer-choice "~/Org/todolist.org")

(require 'package)      
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
						 ("org" . "https://orgmode.org/elpa/")
						 ("elpa" . "https://elpa.gnu.org/packages/"))) 
(package-initialize)    
;; refresh the packages unless the archive exists 
(unless package-archive-contents(package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package)) 
(require 'use-package) 

;; ensures packages are downloaded before used
(setq use-package-always-ensure t) 

;; cleaner files and folders
(use-package no-littering
  :init(setq auto-save-file-name-transforms
				`((".*" ,(no-littering-expand-var-file-name "auto-save/") t)
			 custom-file (expand-file-name "custom.el" user-emacs-directory)))
 )

;; == editor setup ==
(load-file "~/.emacs.d/Config/general.el")
(load-file "~/.emacs.d/Config/helpers.el")
(load-file "~/.emacs.d/Config/evil.el")

(define-key emacs-lisp-mode-map (kbd "C-x x") 'eval-buffer) ;define-key sets a keybinding only for a specific mode
(global-set-key (kbd "<escape>") 'keyboard-escape-quit) ;delete partially insterted command with ESC as in vim (no more C-g)
(global-set-key (kbd "C-M-w") 'counsel-switch-buffer)

;; == theme and aesthetics ==
(load-file "~/.emacs.d/Config/theme.el")

;; == org mode config == 
(load-file "~/.emacs.d/Config/org.el")

;; == coding and file editing ==
(load-file "~/.emacs.d/Config/misc.el")
(load-file "~/.emacs.d/Config/completion.el")
(load-file "~/.emacs.d/Config/latex.el")
(load-file "~/.emacs.d/Config/python.el")

(kill-buffer "*scratch*")

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)
