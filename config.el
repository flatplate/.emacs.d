;(setq evil-want-C-u-scroll t)  ; use C-u to scroll up half a page
;(evil-mode 1)
;(evil-ex-define-cmd "q" 'kill-this-buffer) ; prevent accidentally killing the frame

;(defun ian/save-and-kill-this-buffer ()
;  (interactive)
;  (save-buffer)
;  (kill-this-buffer))
;(evil-ex-define-cmd "wq" 'ian/save-and-kill-this-buffer)

(add-hook 'prog-mode-hook 'company-mode)
(setq company-minimum-prefix-length 1)
(setq company-idle-delay 0)
(with-eval-after-load 'company
  (define-key company-active-map (kbd "C-n") 'company-select-next)
  (define-key company-active-map (kbd "C-p") 'company-select-previous))

(yas-global-mode 1)

(advice-add 'company-complete-common
            :before
            (lambda ()
              (setq my-company-point (point))))

(advice-add 'company-complete-common
            :after
            (lambda ()
              (when (equal my-company-point (point))
                (yas-expand))))

(add-hook 'after-init-hook 'global-flycheck-mode)
(setq ispell-program-name "/usr/local/bin/aspell")

;; Core Ido
(ido-mode 1)
(setq ido-everywhere t)
(setq ido-enable-flex-matching t)
(setq ido-vertical-define-keys 'C-n-C-p-up-and-down)

;; Vertical (for better visibility)
(ido-vertical-mode 1)

(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)
(setq js-indent-level 4)
(setq c-default-style
      '((java-mode . "java")
        (awk-mode . "awk")
        (other . "k&r")))
(setq-default c-basic-offset 4)

(defun ian/newline-and-push-brace ()
  "`newline-and-indent', but bracket aware."
  (interactive)
  (insert "\n")
  (when (looking-at "}")
    (insert "\n")
    (indent-according-to-mode)
    (forward-line -1))
  (indent-according-to-mode))
(global-set-key (kbd "RET") 'ian/newline-and-push-brace)

(defun ian/load-init()
  "Reload .emacs.d/init.el"
  (interactive)
  (load-file "~/.emacs.d/init.el"))

(global-set-key (kbd "C-x g") 'magit-status)

(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
(add-hook 'org-mode-hook 'visual-line-mode)
(add-hook 'org-mode-hook 'org-indent-mode)

(setq scroll-margin 0
      scroll-conservatively 10000
      scroll-preserve-screen-position t
      auto-window-vscroll nil)

(setq initial-frame-alist (quote ((fullscreen . maximized))))

(dashboard-setup-startup-hook)
(setq dashboard-startup-banner 'logo)
(setq dashboard-banner-logo-title "Happy Hacking!")
(setq dashboard-items nil)
(setq dashboard-set-footer nil)

(set-frame-font "Menlo-11" nil t)

(add-hook 'prog-mode-hook 'electric-pair-mode)

(setq inhibit-splash-screen t)
(setq ring-bell-function 'ignore)
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(blink-cursor-mode t)
(setq blink-cursor-blinks 0) ;; blink forever
(setq-default indicate-empty-lines t)
(setq-default line-spacing 3)
(setq frame-title-format '("Emacs"))
(add-hook 'prog-mode-hook 'highlight-numbers-mode)
(add-hook 'prog-mode-hook 'highlight-operators-mode)
(add-hook 'prog-mode-hook 'hes-mode)    ;; highlight escape sequences

(set-face-attribute 'mode-line nil :font "Roboto-12")

(require 'powerline)

      (powerline-center-theme)

(require 'treemacs)

(set-face-attribute 'treemacs-directory-face nil :font "Roboto-12")
(set-face-attribute 'treemacs-directory-collapsed-face nil :font "Roboto-12")
(set-face-attribute 'treemacs-file-face nil :font "Roboto-12")
(set-face-attribute 'treemacs-directory-face nil :font "Roboto-12")
(set-face-attribute 'treemacs-directory-collapsed-face nil :font "Roboto-12")
(set-face-attribute 'treemacs-file-face nil :font "Roboto-12")
(set-face-attribute 'treemacs-root-face nil :font "Roboto-12")
(set-face-attribute 'treemacs-root-unreadable-face nil :font "Roboto-12")
(set-face-attribute 'treemacs-root-remote-face nil :font "Roboto-12")
(set-face-attribute 'treemacs-root-remote-unreadable-face nil :font "Roboto-12")
(set-face-attribute 'treemacs-root-remote-disconnected-face nil :font "Roboto-12")
(set-face-attribute 'treemacs-tags-face nil :font "Roboto-12")
(set-face-attribute 'treemacs-help-title-face nil :font "Roboto-12")
(set-face-attribute 'treemacs-help-column-face nil :font "Roboto-12")
(set-face-attribute 'treemacs-term-node-face nil :font "Roboto-12")
(set-face-attribute 'treemacs-on-success-pulse-face nil :font "Roboto-12")
(set-face-attribute 'treemacs-on-failure-pulse-face nil :font "Roboto-12")

(setq make-backup-files nil)

(setq show-paren-delay 0)
(show-paren-mode 1)

(setq initial-scratch-message nil)
(setq initial-major-mode 'org-mode)

(defun ian/split-and-follow-horizontally ()
  "Split window below"
  (interactive)
  (split-window-below)

  (other-window 1))
  (defun ian/split-and-follow-vertically ()
  "Split window right"
  (interactive)
  (split-window-right)
  (other-window 1))

(global-set-key (kbd "C-x 2") 'ian/split-and-follow-horizontally)
(global-set-key (kbd "C-x 3") 'ian/split-and-follow-vertically)

(which-key-mode t)
(setq which-key-idle-delay 0.4)
(setq which-key-idle-secondary-delay 0.4)

(add-hook 'before-save-hook 'whitespace-cleanup)

(require 'centaur-tabs)

(global-set-key [C-tab] 'centaur-tabs-forward)
(global-set-key [C-S-tab] 'centaur-tabs-backward)

(global-linum-mode 1)

(set-frame-parameter nil 'undecorated t)

(setq auto-save-file-name-transforms
  `((".*" "~/.emacs-saves/" t)))
