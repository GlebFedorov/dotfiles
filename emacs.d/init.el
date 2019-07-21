(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(unless (package-installed-p 'atom-one-dark-theme)
  (package-refresh-contents)
  (package-install 'atom-one-dark-theme))

(defvar my-term-shell "/bin/bash")
(defadvice ansi-term (before force-bash)
  (interactive (list my-term-shell)))
(ad-activate 'ansi-term)

(defalias 'yes-or-no-p 'y-or-n-p )

;;(global-set-key (kbd "<s-return>") 'ansi-term)

(use-package rainbow-delimiters
  :ensure t
  :init
  (rainbow-delimiters-mode 1))

;; Swiper search
;;(use-package swiper
;;  :ensure t
;;  :bind ("C-s" . swiper))

;; Basic Dashboard setup
;;(use-package dashboard
;;  :ensure t
;;  :config
;;  (dashboard-setup-startup-hook)
;;  (setq dashboard-items '((recents . 10)))
;;  (setq dashboards-benner-logo-title "Something cool"))

;; Basic convinience settings
(setq scroll-conservatively 100)
(setq ring-bell-function 'ignore)
(when window-system (global-hl-line-mode t))
(when window-system (global-prettify-symbols-mode t))
(setq make-backup-file nil)
(setq auto-save-default nil)
(global-subword-mode 1)
(global-display-line-numbers-mode 1)
(setq electric-pair-pairs '(
			    (?\( . ?\))
			    (?\[ . ?\])
			    (?\{ . ?\})
			    (?\' . ?\')
			    (?\" . ?\")
			    ))
(electric-pair-mode t)

;; Kill inner word
(defun kill-inner-word ()
  (interactive)
  (backward-word)
  (kill-word 1))
(global-set-key (kbd "C-c C-w") 'kill-inner-word)

;; Popup kill ring
(use-package popup-kill-ring
  :ensure t
  :bind ("M-y" . popup-kill-ring))

;; Copy a whole line
(defun copy-whole-line ()
  (interactive)
  (save-excursion
    (kill-new
     (buffer-substring
      (point-at-bol)
      (point-at-eol)))))
(global-set-key (kbd "C-c C-l") 'copy-whole-line)

;; Decent appearence
(scroll-bar-mode 0)
(menu-bar-mode 0)
(tool-bar-mode 0)
;; Ido-mode Config
(setq ido-enable-flex-matching nil)
(setq ido-create-new-buffer 'always)
(setq ido-everywhere t)
(ido-mode 1)
(use-package ido-vertical-mode
  :ensure t
  :init
  (ido-vertical-mode 1)
)
(setq ido-vertical-define-keys 'C-n-and-C-p-only)

;; Smex Configuration
(use-package smex
  :ensure t
  :init (smex-initialize)
  :bind ("M-x" . smex)
)

;; Buffers
(global-set-key (kbd "C-x b") 'ibuffer)
(global-set-key (kbd "C-x C-b") 'ido-switch-buffer)

;; Avy
(use-package avy
  :ensure t
  :bind
  ("M-s" . avy-goto-char)
)

;; Open Config
(defun config-visit ()
  (interactive)
  (find-file "~/.emacs.d/init.el"))
(global-set-key (kbd "C-c e") 'config-visit)

(use-package beacon
  :ensure t
  :init (beacon-mode 1))

;; Switch-Window

(use-package switch-window
  :ensure t
  :config
  (setq switch-window-input-style 'minibuffer)
  (setq switch-window-increase 4)
  (setq switch-window-threshold 2)
  (setq switch-window-shortcut-style 'qwerty)
  (setq switch-window-qwerty-shortcuts
	'("a" "s" "d" "f" "j" "k" "l"))
  :bind
  ([remap other-window] . switch-window))

(defun split-and-follow-horizontally ()
  (interactive)
  (split-window-below)
  (balance-windows)
  (other-window 1))
(global-set-key (kbd "C-x 2") 'split-and-follow-horizontally)

(defun split-and-follow-vertically ()
  (interactive)
  (split-window-right)
  (balance-windows)
  (other-window 1))
(global-set-key (kbd "C-x 3") 'split-and-follow-vertically)


;; Space Line
(use-package spaceline
  :ensure t
  :config
  (require 'spaceline-config)
  (setq powerline-default-separator (quote arrow))
  (spaceline-spacemacs-theme))

;; Autocompletion
(use-package company
  :ensure t
  :init
  (add-hook 'after-init-hook 'global-company-mode))




(setq inhibit-startup-message t)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(custom-enabled-themes (quote (atom-one-dark)))
 '(custom-safe-themes
   (quote
    ("669e02142a56f63861288cc585bee81643ded48a19e36bfdf02b66d745bcc626" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "2642a1b7f53b9bb34c7f1e032d2098c852811ec2881eec2dc8cc07be004e45a0" default)))
 '(hl-todo-keyword-faces
   (quote
    (("TODO" . "#dc752f")
     ("NEXT" . "#dc752f")
     ("THEM" . "#2d9574")
     ("PROG" . "#4f97d7")
     ("OKAY" . "#4f97d7")
     ("DONT" . "#f2241f")
     ("FAIL" . "#f2241f")
     ("DONE" . "#86dc2f")
     ("NOTE" . "#b1951d")
     ("KLUDGE" . "#b1951d")
     ("HACK" . "#b1951d")
     ("TEMP" . "#b1951d")
     ("FIXME" . "#dc752f")
     ("XXX+" . "#dc752f")
     ("\\?\\?\\?+" . "#dc752f"))))
 '(org-agenda-files (quote ("c:/Users/gleb/Documents/trash/test.org")))
 '(package-selected-packages
   (quote
    (swiper popup-kill-ring spaceline avy smex ido-vertical-mode beacon atom-one-dark atom-one-dark-theme spacemacs-theme atom-dark-theme which-key use-package)))
 '(pdf-view-midnight-colors (quote ("#b2b2b2" . "#292b2e"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 98 :width normal :foundry "outline" :family "Iosevka SS06")))))
