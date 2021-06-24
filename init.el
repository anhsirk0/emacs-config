
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Basic
  (menu-bar-mode -1)
  (tool-bar-mode -1)
  (scroll-bar-mode -1)
  (line-number-mode 1)
  (column-number-mode 1)
  (electric-pair-mode 1)
  (setq byte-compile-warnings '(cl-functions))
  ;; enable clipboard in emacs
  (setq x-select-enable-clipboard t)

  (setq-default shell-file-name "/bin/bash")

  (setq scroll-conservatively 100)
  (setq make-backup-files nil)
  (setq auto-save-default nil)
  (global-display-line-numbers-mode)
  (global-hl-line-mode t)
  (global-subword-mode 1)

;; Rainbow
;; rainbow-mode
  (use-package rainbow-mode
    :ensure t
    :init (rainbow-mode 1))

  (use-package rainbow-delimiters
    :ensure t
    :init (rainbow-delimiters-mode 1))
  (add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

;; Dashboard
  (use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-startup-banner 'logo)
  (setq dashboard-items '((recents . 10)
            (projects . 5)))
  )

;; Avy
  (use-package avy
    :ensure t)

;; Swiper
  (use-package swiper
  :ensure t
  :bind("M-s" . swiper))

;; Projectile
  (use-package projectile
  :ensure t
  :config
  (define-key projectile-mode-map (kbd "C-x p") 'projectile-command-map)
  (projectile-mode 1))

;; Which-key
  (use-package which-key
  :ensure t
  :init
  (which-key-mode))

;; Ido
  (setq ido-enable-flex-matching nil)
  (setq ido-create-new-buffer 'always)
  (setq ido-everywhere t)
  (setq ibuffer-expert t)
  (ido-mode 1)

  (global-set-key (kbd "C-x C-b") 'ido-switch-buffer)
  (global-set-key (kbd "C-x b") 'ibuffer)

;; Company
  (use-package company
    :ensure t
    :init
    (add-hook 'after-init-hook 'global-company-mode))
  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 1)
  (setq company-selection-wrap-around t)
  (global-set-key (kbd "C-<tab>") 'dabbrev-expand)

;; Multiple-cursors
  (use-package multiple-cursors
    :ensure t
    :bind ("C-;" . 'mc/mark-next-like-this))

;; Web dev
;; rjsx
  (use-package rjsx-mode
    :ensure t
    :mode "\\.js\\'")
  (setq create-lockfiles nil)

;; prettier-js
  (use-package prettier-js
    :ensure t
    :after (rjsx-mode)
    :hook (rjsx-mode . prettier-js-mode))

;; emmet
  (use-package emmet-mode
    :ensure t
    :init (emmet-mode 1)
    :bind ("C-j" . emmet-expand-line))

  ;; Auto-start on any markup modes
  (add-hook 'sgml-mode-hook 'emmet-mode)

  ;; enable Emmet's css abbreviation.
  (add-hook 'css-mode-hook  'emmet-mode)

  (setq emmet-expand-jsx-className? t)

;; python
(use-package py-autopep8
  :ensure t)
(add-hook 'python-mode-hook 'py-autopep8-enable-on-save)

;; Custom functions

;; goto-char-right
  (defun goto-char-right ()
    (interactive)
    (call-interactively 'avy-goto-char)
    (right-char))
  (global-set-key "\C-s" 'goto-char-right)

;; duplicate-line
      (defun duplicate-line (arg)
        "Duplicate current line, leaving point in lower line."
        (interactive "*p")

        ;; save the point for undo
        (setq buffer-undo-list (cons (point) buffer-undo-list))

        ;; local variables for start and end of line
        (let ((bol (save-excursion (beginning-of-line) (point)))
              eol)
          (save-excursion

            ;; don't use forward-line for this, because you would have
            ;; to check whether you are at the end of the buffer
            (end-of-line)
            (setq eol (point))

            ;; store the line and disable the recording of undo information
            (let ((line (buffer-substring bol eol))
                  (buffer-undo-list t)
                  (count arg))
              ;; insert the line arg times
              (while (> count 0)
                (newline)         ;; because there is no newline in 'line'
                (insert line)
              (setq count (1- count)))
              )

            ;; create the undo information
            (setq buffer-undo-list (cons (cons eol (point)) buffer-undo-list)))
          ) ; end-of-let

        ;; put the point in the lowest line and return
        (next-line arg))
      (global-set-key "\C-z" 'duplicate-line)

;; move-region-up-down
     (defun move-text-internal (arg)
         (cond
          ((and mark-active transient-mark-mode)
           (if (> (point) (mark))
              (exchange-point-and-mark))
           (let ((column (current-column))
            (text (delete-and-extract-region (point) (mark))))
         (forward-line arg)
         (move-to-column column t)
         (set-mark (point))
         (insert text)
         (exchange-point-and-mark)
         (setq deactivate-mark nil)))
          (t
           (beginning-of-line)
           (when (or (> arg 0) (not (bobp)))
         (forward-line)
         (when (or (< arg 0) (not (eobp)))
              (transpose-lines arg))
         (forward-line -1)))))

      (defun move-text-down (arg)
         "Move region (transient-mark-mode active) or current line
        arg lines down."
         (interactive "*p")
         (move-text-internal arg))

      (defun move-text-up (arg)
         "Move region (transient-mark-mode active) or current line
        arg lines up."
         (interactive "*p")
         (move-text-internal (- arg)))

      (global-set-key (kbd "C-,") 'move-text-up)
      (global-set-key (kbd "C-.") 'move-text-down)

;; Custom shortcuts

;; save-buffer
  (global-set-key (kbd "C-r") (kbd "C-x C-s"))

;; duplicate-selection
  (global-set-key (kbd "C-c d") (kbd "C-w C-y C-y"))

;; delete-line
  (global-set-key (kbd "C-c k") (kbd "C-a C-k C-k"))

;; split-window-right-move
  (global-set-key (kbd "C-c r") (kbd "C-x 3 C-x o"))

;; org-mode-src
  (global-set-key (kbd "C-c s") (kbd "C-c C-, s"))

;; comment-line
  (global-set-key (kbd "C-/") 'comment-line)

;; comment-region
  (global-set-key (kbd "C-c c") 'comment-region)

;; return
  (global-set-key (kbd "C-\\") (kbd "C-m C-p C-e C-m"))

;; goto top of buffer
  (global-set-key (kbd "C-c t") (kbd "M-<"))

;; goto bottom of buffer
  (global-set-key (kbd "C-c t") (kbd "M->"))

;; Diminish
  (use-package diminish
    :ensure t
    :init
    (diminish 'which-key-mode)
    (diminish 'company-mode)
    (diminish 'projectile-mode)
    (diminish 'eldoc-mode)
    (diminish 'subword-mode)
  )

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#21252B" "#E06C75" "#98C379" "#E5C07B" "#61AFEF" "#C678DD" "#56B6C2" "#ABB2BF"])
 '(custom-enabled-themes '(pastel))
 '(custom-safe-themes
   '("b849dcd4fb2b31138b9425ef770122685aebf3e6ec52d5f8bf23e2d789ecee21" "98d38d05e930417ec59496f79cd78483351f66e0a692748bb6d706862882db71" "ec032f065a0375dfe88a3550a3f011a91953a396fa0c73e179738ba4d457e4be" "a2b87906151ab1e5afbbd4da315c2bf893d21b3122434b3b3a653b6f17fa9388" "ca54a00862a7f15809da458e0783834ece3264ea729af2b09dd61259fc6871ba" "3bd18d60380d8fb9378e822800836d6c67d6d3e4076088355f519930a6d29543" "8b7dfd39a16376088eefd19daf2e47a65370361726d50ee2dcfb398fca9c2bad" "824d07981667fd7d63488756b6d6a4036bae972d26337babf7b56df6e42f2bcd" "171d1ae90e46978eb9c342be6658d937a83aaa45997b1d7af7657546cae5985b" default))
 '(fci-rule-color "#3E4451")
 '(package-selected-packages
   '(py-autopep8 dracula-theme multiple-cursors diminish mark-multiple projectile swiper company dashboard rainbow-delimiters which-key use-package rjsx-mode rainbow-mode prettier-js emmet-mode avy atom-one-dark-theme))
 '(tetris-x-colors
   [[229 192 123]
    [97 175 239]
    [209 154 102]
    [224 108 117]
    [152 195 121]
    [198 120 221]
    [86 182 194]]))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :extend nil :stipple nil :background "#282C34" :foreground "#ABB2BF" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 115 :width normal :foundry "JB" :family "JetBrains Mono")))))
