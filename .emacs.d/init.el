(require 'package)

;; package repos
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("elpa" . "http://elpa.gnu.org/packages/"))
;; (add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))

(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(git-gutter:deleted-sign "_")
 '(package-selected-packages
   (quote
    (evil-magit magit yaml-mode dockerfile-mode use-package dired-rainbow evil-mc git-gutter rainbow-delimiters evil-vimish-fold multi-line async evil-nerd-commenter better-defaults flycheck paradox which-key smartparens web-mode emmet-mode evil-indent-textobject markdown-mode company evil-surround swiper avy ivy evil-org org-bullets org fish-mode evil-terminal-cursor-changer darkokai-theme spaceline evil)))
 '(paradox-automatically-star t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; (require 'better-defaults)
(load "~/.emacs.secrets" t)

;; Tell emacs where is your personal elisp lib dir
(add-to-list 'load-path "~/.emacs.d/lisp/")

(setq inhibit-startup-message t)
(tool-bar-mode 0)
(menu-bar-mode 0)

(setq-default tab-width 4)
(setq fill-column 80)
(fset 'yes-or-no-p 'y-or-n-p)

(add-hook 'prog-mode-hook 'whitespace-mode)
(setq whitespace-style '(face tabs trailing linse-tail space-before-tab empty space-after-tab tab-mark))

(setq undo-tree-history-directory-alist '(("." . "~/.emacs.d/undo")))
(save-place-mode 1)

(add-hook 'prog-mode-hook 'smartparens-mode)

(global-git-gutter-mode t)
(set-face-foreground 'git-gutter:modified "blue")
(set-face-foreground 'git-gutter:added "green")
(set-face-foreground 'git-gutter:deleted "red")
(set-face-background 'git-gutter:modified "darkblack")
(set-face-background 'git-gutter:added "darkblack")
(set-face-background 'git-gutter:deleted "darkblack")

;; evil
(setq evil-want-C-u-scroll t)
(setq evil-emacs-state-modes nil
      evil-insert-state-modes nil
      evil-motion-state-modes nil)

(require 'evil-leader)
(evil-leader/set-leader ",")
(global-evil-leader-mode)
(require 'evil-org)
(require 'evil-surround)
(global-evil-surround-mode t)
(require 'evil-mc)
(global-evil-mc-mode  1)
(require 'evil)
(evil-mode 1)
(evil-vimish-fold-mode 1)
(evilnc-default-hotkeys)

(setq evil-mode-line-format nil
      evil-insert-state-cursor '(bar "White")
      evil-visual-state-cursor '(box "#f86155")
      evil-motion-state-cursor 'box
      evil-normal-state-cursor 'box
      evil-emacs-state-cursor  'hbar)

(unless (display-graphic-p)
    (require 'evil-terminal-cursor-changer)
    (evil-terminal-cursor-changer-activate))

; Overload shifts so that they don't lose the selection
(define-key evil-visual-state-map (kbd ">") 'djoyner/evil-shift-right-visual)
(define-key evil-visual-state-map (kbd "<") 'djoyner/evil-shift-left-visual)
(define-key evil-visual-state-map [tab] 'djoyner/evil-shift-right-visual)
(define-key evil-visual-state-map [S-tab] 'djoyner/evil-shift-left-visual)

(defun djoyner/evil-shift-left-visual ()
  (interactive)
  (evil-shift-left (region-beginning) (region-end))
  (evil-normal-state)
  (evil-visual-restore))

(defun djoyner/evil-shift-right-visual ()
  (interactive)
  (evil-shift-right (region-beginning) (region-end))
  (evil-normal-state)
  (evil-visual-restore))

;; Ivy
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)

;; TODO -- Figure out good shortcut
(require 'avy)
(define-key evil-normal-state-map "s" 'avy-goto-char)

;; Company
(add-hook 'after-init-hook 'global-company-mode)

;; Enable mouse support

(unless window-system
  (require 'mouse)
  (xterm-mouse-mode t)
  (global-set-key [mouse-4] (lambda ()
                              (interactive)
                              (scroll-down 1)))
  (global-set-key [mouse-5] (lambda ()
                              (interactive)
                              (scroll-up 1)))
  (defun track-mouse (e))
  (setq mouse-sel-mode t)
)

(require 'spaceline-config)
(setq -highlight-face-func 'spaceline-highlight-face-evil-state)
(spaceline-emacs-theme)
(spaceline-toggle-minor-modes-off)
(spaceline-toggle-buffer-encoding-abbrev-off)
(spaceline-toggle-buffer-size-off)

(setq darkokai-mode-line-padding 1)
(load-theme 'darkokai t)

(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

;; web mode
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

;; emmet
(add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'css-mode-hook  'emmet-mode) ;; enable Emmet's css abbreviation.
(setq emmet-expand-jsx-className? t)

(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
(add-hook 'prog-mode-hook 'linum-mode)

(global-set-key (kbd "C-k") 'multi-line)

;; copy to clipboard
;; TODO -- make so you can copy with motion too
(defun pbcopy ()
  (interactive)
  (call-process-region (point) (mark) "pbcopy")
  (setq deactivate-mark t))

(defun pbpaste ()
  (interactive)
  (call-process-region (point) (if mark-active (mark) (point)) "pbpaste" t t))

(defun pbcut ()
  (interactive)
  (pbcopy)
  (delete-region (region-beginning) (region-end)))

(evil-leader/set-key
  "y" 'pbcopy
  "p" 'pbpaste
  "x" 'pbcut)

;; vim vinegar emulation
(require 'dired-x)
(define-key evil-normal-state-map (kbd "-") 'dired-jump)
(eval-after-load 'dired
  '(define-key dired-mode-map (kbd "-") 'dired-up-directory))

;; add line numbers to yaml files
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))
(add-hook 'yaml-mode-hook 'linum-mode)

;; follow splits
(defun follow-evil-window-split ()
  (interactive)
  (evil-window-split)
  (other-window 1))

(defun follow-evil-window-vsplit ()
  (interactive)
  (evil-window-vsplit)
  (other-window 1))

(define-key evil-normal-state-map (kbd "C-w s") 'follow-evil-window-split)
(define-key evil-normal-state-map (kbd "C-w C-s") 'follow-evil-window-split)
(define-key evil-normal-state-map (kbd "C-w v") 'follow-evil-window-vsplit)
(define-key evil-normal-state-map (kbd "C-w C-v") 'follow-evil-window-vsplit)
