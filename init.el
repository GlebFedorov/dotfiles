(defun system-is-windows()
  (string-equal system-type "windows-nt"))

(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))


(require 'dired)
(setq dired-recursive-delete 'top) ;; Delete non-empty directories

;; Imenu function navigation
(require 'imenu)
(setq imenu-auto-rescan t)
(setq imenu-use-popup-menu nil)
(global-set-key (kbd "<f6>") 'imenu)

(setq frame-title-format "Emacs: %b")

;; Org mode
(require 'org)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(global-set-key "\C-cl" 'org-store-link)
(add-to-list 'auto-mode-alist '("\\.org$" . Org-mode))

(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)

(show-paren-mode t)

(electric-pair-mode 1) ;; symmetric parens and quots
(electric-indent-mode -1) ;; electric indent works horribly

(delete-selection-mode t)
;
; Disable GUI components
(tooltip-mode      -1)
(menu-bar-mode     -1) 
(tool-bar-mode     -1) 
(scroll-bar-mode   -1) 
(blink-cursor-mode -1) 
(setq use-dialog-box     nil) 
(setq redisplay-dont-pause t)  
(setq ring-bell-function 'ignore)

;; Disable backup/autosave files
(setq make-backup-files        nil)
(setq auto-save-default        nil)
(setq auto-save-list-file-name nil)

;; Linum plugin
(require 'linum)  
(line-number-mode   t)
(global-linum-mode  t)
(column-number-mode t)
(setq linum-format " %d")


;; Fringe settings
(fringe-mode '(8 . 0)) 

;; Display file size/time in mode-line
(setq display-time-24hr-format t)
(display-time-mode             t)
(size-indication-mode          t)

;; IDO plugin
(require 'ido)
(ido-mode                      t)
(icomplete-mode                t)
(ido-everywhere                t)
(setq ido-vitrual-buffers      t)
(setq ido-enable-flex-matching t)

;; Buffer Selection and ibuffer settings
(require 'bs)
(require 'ibuffer)
(defalias 'list-buffers 'ibuffer)
(global-set-key (kbd "<f2>") 'bs-show) 

(require 'font-lock)
(global-font-lock-mode t)
(setq font-lock-maximum-decoration t)

(setq scroll-step               1)
(setq scroll-margin            10)
(setq scroll-conservatively 10000)

(defalias 'yes-or-no-p 'y-or-n-p)
(setq x-select-enable-clipboard t)

;; Highlight search resaults
(setq search-highlight        t)
(setq query-replace-highlight t)

(use-package which-key
  :ensure t
  :config (which-key-mode t))

;; Magit
(use-package magit
  :ensure t
  :config
 (global-set-key (kbd "C-x M-g") 'magit-dispatch)
 (global-set-key (kbd "C-x g") 'magit-status))

;; Autocompletion
(use-package company
  :ensure t
  :init
  (add-hook 'after-init-hook 'global-company-mode))

(use-package ivy
  :ensure t
  :config (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq ivy-count-format "(%d/%d) ")
  (global-set-key (kbd "C-x b") 'ivy-switch-buffer)
  (global-set-key (kbd "C-c v") 'ivy-push-view)
  (global-set-key (kbd "C-c V") 'ivy-pop-view))

(use-package swiper
  :ensure t
  :config (global-set-key "\C-s" 'swiper))

(use-package counsel
  :ensure t
  :config 
  (global-set-key (kbd "M-x") 'counsel-M-x)
  (global-set-key (kbd "C-x C-f") 'counsel-find-file))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(custom-enabled-themes (quote (nord)))
 '(custom-safe-themes
   (quote
    ("2642a1b7f53b9bb34c7f1e032d2098c852811ec2881eec2dc8cc07be004e45a0" "7f6d4aebcc44c264a64e714c3d9d1e903284305fd7e319e7cb73345a9994f5ef" default)))
 '(package-selected-packages
   (quote
    (atom-dark-theme nord-theme counsel swiper ivy company magit which-key use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 98 :width normal :foundry "outline" :family "Consolas")))))

;; '(default ((t (:inherit nil :stipple nil :background "#fafafa" :foreground "#383a42" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 98 :width normal :foundry "outline" :family "Consolas")))))
