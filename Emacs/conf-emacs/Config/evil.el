(use-package evil
  :init
  (setq evil-want-integration t) 
  (setq evil-want-keybinding nil); loads vim bindings in other modes 
  (setq evil-want-C-u-scroll t)  ;C-u used to scroll up and not for universal argument
  (setq evil-want-C-i-jump nil)  ;turnung off juming functionality in vim
  :config
  (evil-mode 1)
  (define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state) ;C-g takes me back to normal-mode
  (define-key evil-insert-state-map (kbd "C-h") 'evil-delete-backward-char-and-join) ;preserve C-h as cancel bacward as in emacs
  (evil-set-initial-state 'messages-buffer-mode 'normal)
  (evil-set-initial-state 'dashboard-mode 'normal)
)

(use-package evil-collection
  :after evil
  :ensure t
  :config
  (evil-collection-init))
