;;; short cut.
;;F1  : help
;;F2  : useless
;;F3  : compte valu macro (useless)
;;F4  : past macro(useless)
;;F5  : compile
;;F6  : goto line
;;F7  : hide and show block
;;F8  : sort selection line
;;F9  : tree folder
;;F10 : change same name
;;F11 : full screan
;;F12 : activate or not minimap

;;;C-x == ctrl+x | M-x == meta+x (meta can be esc or alt)
;;C-x C-c -> exit
;;C-x C-s -> save

;;M-x -> Running Commands by Name (ex : M-x  linum-mode)
;;M-g -> exit Running Commands by Name


;; M-s -> launch shell
;; M-m -> launch man
;; M-g -> launch gdb

;; M-arrow -> move of window



;; ----------------------------------------------------------------------------------
;; ----------------------------------------------------------------------------------




;;si travaille avec proxy
;;(setq url-proxy-services
;;      '(("no_proxy" . "^\\(localhost\\|10.*\\)")
;;        ("http" . "proxy:3128")
;;                 ("https" . "proxy:3128")))




;;Start package.el
(require 'package)

;;add melpa to repository list
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade.ferrier.me.uk/packages/"))
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))

;;initialize package
(package-initialize)



;;;---------auto completion---------

;;auto-complete ->complete word
;;+
;;yasnippet ->complete with templete
;;+
;;my:ac-c-header-init -> conplet header


;;start auto complete with emacs
(require 'auto-complete)

;;do default config for auto complete
(require 'auto-complete-config)
(ac-config-default)

;;start yasnippet with emacs
(require 'yasnippet)
(yas-global-mode 1) ;;for always on

;;



(defun my:ac-c-header-init ()
  (require 'auto-complete-c-headers)
  (add-to-list 'ac-sources 'ac-source-c-headers)
  (add-to-list 'achead:include-directories
               '"/usr/lib/gcc/x86_64-linux-gnu/4.9/include"))



;;use gcc -xc++ -E -v - to find addr math */lib/gcc/*/include
;; '*' represente 0 or more caractere

;;

;;(add-hook 'c++-mode-hook 'my:ac-c-header-init)
(add-hook 'c-mode-hook 'my:ac-c-header-init)

;;turn on semantic
(semantic-mode 1)

(defun my:add-semantic-auto-complete()
  (add-to-list 'ac-sources 'ac-source-semantic)
  )
(add-hook 'c-mode-common-hook 'my:add-semantic-auto-complete)



;;;---------coding style---------



;; Indent with spaces instead of tabs
(setq-default indent-tabs-mode nil)

;; Sets the indent character to spaces instead of tabs
(setq c-default-style "linux"
            c-basic-offset 2)



;;highlight 80 and more column (with plugin)
;;(require 'column-enforce-mode)

;;always activate
;;(global-column-enforce-mode t)


;;change to 81 column
;;(setq column-enforce-column 80)

;;(global-whitespace-mode 1)
;;(setq whitespace-line-column 79)
;;(setq whitespace-display-mappings '((space-mark ?\ [? ]))) ;;use space not show


;;space~~~
;; remove space end of line
(autoload 'nuke-trailing-whitespace "whitespace" nil t)

;;show space in end line
(setq-default show-trailing-whitespace t)

;; Remove useless whitespace before saving a file

(add-hook 'before-save-hook 'whitespace-cleanup)
(add-hook 'before-save-hook (lambda() (delete-trailing-whitespace)))
;;space~~~










;;;---------usefull---------

;; move white M-arrow
(windmove-default-keybindings 'meta)


;; ;; have tabbar
;; (require 'tabbar)
;; (tabbar-mode t)

;;affiche ligne courante
(global-hl-line-mode t)
(set-face-background hl-line-face "black")

;;repere erreur <3
(require 'flycheck)

(global-flycheck-mode)



;; affichage indentation pb nouvre pas les ficher
(require 'highlight-indent-guides)
(add-hook 'prog-mode-hook 'highlight-indent-guides-mode)
(setq highlight-indent-guides-method 'character)
(setq highlight-indent-guides-auto-enabled nil)
(set-face-foreground 'highlight-indent-guides-character-face "green")


;; titre de la fenetre
(setq frame-title-format '("Emacs(Axel)"))

;; go to first error when compiling
(setq compilation-scroll-output 'first-error)


;; disable alarm bell
(setq ring-bell-function 'ignore)


;; shortcuts
(define-key global-map (kbd "C-c C-c") 'comment-region)
(define-key global-map (kbd "C-c c") 'uncomment-region)


;; use standard keys for undo cut copy paste
(cua-mode 1)

;; use C-f to searsh
(global-set-key (kbd "C-f") 'search-forward)
;; use C-f to save
(global-set-key (kbd "C-s") 'save-buffer)


;; tree of directory


(add-to-list 'load-path "/users/Etu0/3700260/plugin/neotree")
(require 'neotree)

(setq-default neo-show-hidden-files t)
(global-set-key [f9] 'neotree-toggle)
(setq neo-theme (if (display-graphic-p) 'icons 'arrow))

(add-hook 'window-setup-hook #'neotree-toggle)

;; color of tree
(custom-set-faces
 '(col-highlight ((t (:background "color-233"))))
 '(hl-line ((t (:background "color-233"))))
 '(lazy-highlight ((t (:background "black" :foreground "white" :underline t))))
 '(neo-dir-link-face ((t (:foreground "blue"))))
 '(neo-file-link-face ((t (:foreground "white")))))
(custom-set-variables)


;;sort line
(global-set-key [f8]  'sort-lines)


;; display line and culdum number
(line-number-mode t)
(column-number-mode t)

;;have number in left column
(global-linum-mode t)
(linum-on)
;; set color of linum
(set-face-foreground 'linum "yellow")


;;(setq linum-relative-current-symbole "")

;; show paren
(require 'paren)
(show-paren-mode)

;;hide and show block (with hs mode)
(global-set-key [f7]  'hs-minor-mode)
(global-set-key [C-left] 'hs-hide-all)
(global-set-key [C-right] 'hs-show-all)
(global-set-key [C-up] 'hs-hide-block)
(global-set-key [C-down] 'hs-show-block)

;; stop scroll page by page
(setq scroll-step 1)

;; start shell with emacs
(global-set-key (kbd "M-s") 'shell)

;;start gdb with emacs
(global-set-key (kbd "M-g") 'gdb)

;;start man with emacs
(global-set-key (kbd "M-m") 'man)

;; xterm mouse support
(require 'mouse)
(xterm-mouse-mode t)

;;compile
(global-set-key [f5]  'compile)

;;goto line
(global-set-key [f6]  'goto-line)

;; move in the windows
(global-set-key [M-left] 'windmove-left)
(global-set-key [M-right] 'windmove-right)
(global-set-key [M-up] 'windmove-up)
(global-set-key [M-down] 'windmove-down)

;;change similary name
;;(define-key global-map (kbd "C-f ;") 'iedit-mode)
(global-set-key [f10]  'iedit-mode)

;;highlight tab
(setq-default highlight-tabs t)

;;display time
(display-time-mode t)

;;24h
(setq display-time-24hr-format t)
(setq displat-time-day-and-date t)

;;auto-complet mini buff
(icomplete-mode 1)

;; Enlever le message au demarrage
(setq inhibit-startup-message nil)

;; Remplacer le texte selectionne si on tape
(delete-selection-mode t)

;;alias fo yes or no anser
(defalias 'yes-or-no-p 'y-or-n-p)

;;not truncate
(setq-default global-visual-line-mode t)



;;;---------MY theme----------

;; color of baground
(set-background-color "black")

;; color of baground
(set-foreground-color "white")

;;comment color
(set-face-foreground 'font-lock-comment-face "chocolate")

;;color if for while return...
(set-face-attribute 'font-lock-keyword-face nil :foreground "#FFD800")

;;highlight color
(set-face-attribute 'region nil :background "#050A57")
(set-face-attribute 'region nil :foreground "#ffffff")

;;color name of variable
(set-face-attribute 'font-lock-variable-name-face nil :foreground "#37EBB7")

;;color of fonction name
(set-face-attribute 'font-lock-function-name-face nil :foreground "#1CCCCC")

;;color of string
(set-face-attribute 'font-lock-string-face nil :foreground "#37EBB7")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (auto-complete-c-headers iedit auto-complete))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;; mini map (pour gui)

(setq x-alt-keysym 'meta)

;; (require 'minimap)

;; ;;(minimap-mode t)

;; (global-set-key [f12]  'minimap-mode)

;; ;; minimap take 1/10 of window
;; (setq-default minimap-width-fraction 0.1)

;; ;; width mini of minimap
;; (setq-default  minimap-minimum-width 25)

;; ;; move minimap to right

;; (setq-default minimap-window-location 'right)

;;test

(setq my/E-login (concat "E" (car (split-string user-login-name))))
(setq sql-user my/E-login)
(setq sql-password my/E-login)
(setq sql-database "ora11")
(setq sql-product "oracle")

(defun my/sql-oracle ()
  (interactive)
  (save-selected-window
    (sql-oracle))
  (sql-set-sqli-buffer))
