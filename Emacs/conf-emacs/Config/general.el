(scroll-bar-mode -1)    ;disable scrollbar
(tool-bar-mode -1)      ;disable toolbar
(tooltip-mode -1)       ;disable tool tips
(menu-bar-mode -1)      ;disable menu bar
(set-fringe-mode 10)    ;give some space
(setq visible-bell t)   ;visual bell
(setq-default
    fill-column 75 
    inhibit-startup-screen t
    tab-width 4
 )

;line numbers
(column-number-mode) ;display in modeline
(global-display-line-numbers-mode t)
(setq display-line-numbers-type 'relative)

;; Show line-number and column-number in the mode line
(line-number-mode 1)
(column-number-mode 1)

;; highlight current line
(global-hl-line-mode 1)
