(setq package-enable-at-startup nil)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package-ensure)
(setq use-package-always-ensure t)

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
(setq-default explicit-shell-file-name "/bin/bash")

(setq org-blank-before-new-entry t)

(setq scroll-conservatively 100)
(setq make-backup-files nil)
(setq auto-save-default nil)
(global-display-line-numbers-mode)
(global-hl-line-mode t)
(global-subword-mode 1)
(setq-default c-basic-offset 4)
(setq org-image-actual-width nil)

;; Transparency
 ;;(set-frame-parameter (selected-frame) 'alpha '(<active> . <inactive>))
 ;;(set-frame-parameter (selected-frame) 'alpha <both>)
(set-frame-parameter (selected-frame) 'alpha 86)
(add-to-list 'default-frame-alist '(alpha 86))

;; Diminish
(use-package diminish)

;; Beacon
(use-package beacon
  :init
  (beacon-mode 1))

;; Hungry delete
(use-package hungry-delete
  :config
    (global-hungry-delete-mode))

;; simple modeline
(use-package simple-modeline
  :init
  (simple-modeline-mode 1))

;; Treemacs
;; (use-package treemacs
;;   :bind
;;   (:map global-map
;; 	("C-c t" . treemacs))
;;   :config
;;   (setq treemacs-project-follow-mode t))

;; (use-package treemacs-projectile
;;   :after (treemacs projectile))

;; Rust
(use-package rust-mode
  :init
  (setq rust-format-on-save t))

;; Crystal
(use-package crystal-mode)

;; Fish shell
(use-package fish-mode)
;; Org
(setq org-src-preserve-indentation t)

;; lsp
(use-package lsp-mode)

;; Org Roam
(use-package org-roam
  :init
  (setq org-roam-v2-ack t)
  :custom
  (org-roam-directory "~/.emacs.d/notes")
  :bind (("C-c n l" . org-roam-buffer-toggle)
         ("C-c n f" . org-roam-node-find)
         ("C-c n i" . org-roam-node-insert))
  :config
  (org-roam-setup))

;; Rainbow
;; rainbow-mode
(use-package rainbow-mode
  :init (rainbow-mode 1))

(use-package rainbow-delimiters
  :init (rainbow-delimiters-mode 1)
  :hook (prog-mode . rainbow-delimiters-mode)
  )

;; Dashboard
(use-package dashboard
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-startup-banner 'logo)
  ;; (setq dashboard-startup-banner "/home/krishna/.emacs.d/black_hole.png")
  (setq dashboard-center-content t)
  (setq dashboard-items '((recents . 6)
			  (projects . 8)))
  )
(setq initial-buffer-choice (lambda () (get-buffer "*dashboard*")))

;; Avy
(use-package avy)

;; Ace jump
;; (use-package ace-jump-mode)

;; Swiper
(use-package swiper
  :bind("M-s" . swiper))

;; Projectile
(use-package projectile
  :init
  (setq projectile-sort-order 'acces-time)
  ;; (setq projectile-indexing-method 'alien)
  :config
  (define-key projectile-mode-map (kbd "C-x p") 'projectile-command-map)
  (projectile-mode 1)
  :bind
  ("M-p" . 'projectile-find-file))

;; Which-key
(use-package which-key
  :init
  (which-key-mode))

;; Helm
(use-package helm
  :bind
  ("C-x C-b" . 'helm-buffers-list)
  ("C-c f" . 'helm-find-files)  
  :config
  (add-to-list 'display-buffer-alist
             '("*Help*" display-buffer-same-window))
  (helm-mode 1))

;; Company
;; (use-package company
;;   :after lsp-mode
;;   :hook (lsp-mode . company-mode)
;;   :bind (:map company-active-map
;;          ("<tab>" . company-complete-selection))
;;         (:map lsp-mode-map
;;          ("<tab>" . company-indent-or-complete-common))
;;   :custom
;;   (company-minimum-prefix-length 1)
;;   (company-idle-delay 0.0))

(use-package company
  :init
  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 1)
  (setq company-selection-wrap-around t)
  (add-hook 'after-init-hook 'global-company-mode)
  (diminish 'company-mode)
  (diminish 'company-major-mode)
  :bind
  ("C-<tab>" . dabbrev-expand))

;; Multiple-cursors
(use-package multiple-cursors
  :bind ("C-;" . 'mc/mark-next-like-this))

;; Web dev
;; Svelte
(use-package svelte-mode)
;; rjsx
(use-package rjsx-mode
  :init
  (setq create-lockfiles nil)
  (diminish 'rjsx-mode)
  :mode "\\.js\\'")

;; prettier-js
(use-package prettier-js
  :after (:any rjsx-mode svelte-mode)
  :hook ((rjsx-mode . prettier-js-mode)
	 (svelte-mode . prettier-js-mode))
  :init
  (diminish 'prettier-js-mode)
  (diminish 'prettier-js-minor-mode))

;; emmet
(use-package emmet-mode
  :init
  (emmet-mode 1)
  (setq emmet-expand-jsx-className? t)
  :bind ("C-j" . emmet-expand-line))

;; Auto-start on any markup modes
(add-hook 'sgml-mode-hook 'emmet-mode)

;; enable Emmet's css abbreviation.
(add-hook 'css-mode-hook  'emmet-mode)

;; ;; python
(use-package py-autopep8
  :hook (python-mode . py-autopep8-enable-on-save))

;; Custom functions
(defun capitalize-first-char (&optional string)
  "Capitalize only the first character of the input STRING."
  (when (and string (> (length string) 0))
    (let ((first-char (substring string nil 1))
          (rest-str   (substring string 1)))
      (concat (capitalize first-char) rest-str))))

(defun kill-current-buffer ()
  (interactive)
  (kill-buffer (current-buffer)))
(global-set-key (kbd "C-c C-k") 'kill-current-buffer)

;; goto-char-right
(defun goto-char-right ()
  (interactive)
  (call-interactively 'avy-goto-char)
  (right-char))
(global-set-key (kbd "C-c q") 'goto-char-right)
;; (global-set-key (kbd "C-c q") 'ace-jump-char-mode)

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

;; yasnippets
(use-package yasnippet
  :config
  (setq yas-snippet-dirs '("~/.emacs.d/snippets"))
  (yas-global-mode 1))

;; Custom shortcuts

;; avy copy line
(global-set-key (kbd "C-c l") 'avy-copy-line)

;; avy copy region
(global-set-key (kbd "C-c r") 'avy-copy-region)

;; avy move line
(global-set-key (kbd "C-c a") 'avy-move-line)

;; avy move region
(global-set-key (kbd "C-c w") 'avy-move-region)

;; exit insert mode
(global-set-key (kbd "C-z") (kbd "<escape>"))

(global-set-key (kbd "C-c b") 'beginning-of-buffer)
(global-set-key (kbd "C-c e") 'end-of-buffer)
(global-set-key (kbd "C-c /") 'comment-line)
(global-set-key (kbd "C-c p") 'point-to-register)
(global-set-key (kbd "C-c v") 'jump-to-register)

;; delete-line
;; (global-set-key (kbd "C-'") (kbd "abc C-a C-k C-k"))

;; kill region (cut)
(global-set-key (kbd "M-k") 'kill-region)

;; terminal
;; (global-set-key (kbd "C-c [") 'ansi-term)
;; (global-set-key (kbd "C-c t") (kbd "C-c w b C-c [ C-m"))

(global-set-key (kbd "C-c ,") 'split-window-below)
(global-set-key (kbd "C-c .") 'split-window-right)
(global-set-key (kbd "C-c o") 'other-window)

;; save-buffer
(global-set-key (kbd "C-c s") 'save-buffer)
(global-set-key (kbd "C-c y") 'query-replace)
;; org-mode-src
;; (global-set-key (kbd "C-c s r") (kbd "C-c C-, s"))

;; copy region
;; (global-set-key (kbd "C-w") 'copy-region-as-kill)

;; yas-expand
(global-set-key (kbd "C-o") 'yas-expand)


;; Meow setup
(defun meow-setup ()
  ;; (setq meow-cheatsheet-layout meow-cheatsheet-layout-qwerty)
  
  (meow-motion-overwrite-define-key
   '("j" . meow-next)
   '("k" . meow-prev))
  (meow-leader-define-key
   ;; SPC j/k will run the original command in MOTION state.
   '("j" . "H-j")
   '("k" . "H-k")
   ;; Use SPC (0-9) for digit arguments.
   '("1" . meow-digit-argument)
   '("2" . meow-digit-argument)
   '("3" . meow-digit-argument)
   '("4" . meow-digit-argument)
   '("5" . meow-digit-argument)
   '("6" . meow-digit-argument)
   '("7" . meow-digit-argument)
   '("8" . meow-digit-argument)
   '("9" . meow-digit-argument)
   '("0" . meow-digit-argument)
   '("?" . meow-cheatsheet))
  (meow-normal-define-key
   '("0" . meow-expand-0)
   '("9" . meow-expand-9)
   '("8" . meow-expand-8)
   '("7" . meow-expand-7)
   '("6" . meow-expand-6)
   '("5" . meow-expand-5)
   '("4" . meow-expand-4)
   '("3" . meow-expand-3)
   '("2" . meow-expand-2)
   '("1" . meow-expand-1)
   '("-" . negative-argument)
   '(";" . meow-reverse)
   '("," . meow-inner-of-thing)
   '("." . meow-bounds-of-thing)
   '("[" . meow-beginning-of-thing)
   '("]" . meow-end-of-thing)
   '("a" . meow-append)
   '("A" . meow-open-below)
   '("b" . meow-back-word)
   '("B" . meow-back-symbol)
   '("c" . meow-change)
   '("d" . meow-delete)
   '("D" . meow-backward-delete)
   '("e" . meow-next-word)
   '("E" . meow-next-symbol)
   '("f" . meow-find)
   '("g" . meow-cancel-selection)
   '("G" . meow-grab)
   '("h" . meow-left)
   '("H" . meow-left-expand)
   '("i" . meow-insert)
   '("I" . meow-open-above)
   '("j" . meow-next)
   '("J" . meow-next-expand)
   '("k" . meow-prev)
   '("K" . meow-prev-expand)
   '("l" . meow-right)
   '("L" . meow-right-expand)
   '("m" . meow-join)
   '("n" . meow-search)
   '("o" . meow-block)
   '("O" . meow-to-block)
   '("p" . meow-yank)
   '("q" . save-buffer)
   '("Q" . meow-goto-line)
   '("r" . meow-replace)
   '("R" . meow-swap-grab)
   '("s" . meow-kill)
   '("t" . meow-till)
   '("u" . meow-undo)
   '("U" . meow-undo-in-selection)
   '("v" . meow-visit)
   '("w" . meow-mark-word)
   '("W" . meow-mark-symbol)
   '("x" . meow-line)
   '("X" . meow-goto-line)
   '("y" . meow-save)
   '("Y" . meow-sync-grab)
   '("z" . meow-pop-selection)
   '("'" . repeat)
   '("`" . treemacs)
   ;; my shortcuts
   '("\\" . comment-line)
   '("/" . "M-s")
   ;; my shortcuts ends
   '("<escape>" . mode-line-other-buffer))
  )

  (require 'meow)
  (meow-setup)
  (meow-global-mode 1)

(diminish 'which-key-mode)
(diminish 'projectile-mode)
(diminish 'eldoc-mode)
(diminish 'subword-mode)
(diminish 'rjsx-mode)
(diminish 'helm-mode)
(diminish 'yas-minor-mode)
(diminish 'hungry-delete-mode)
(diminish 'prettier-js-mode)
(diminish 'company-mode)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   ["#21252B" "#E06C75" "#98C379" "#E5C07B" "#61AFEF" "#C678DD" "#56B6C2" "#ABB2BF"])
 '(company-quickhelp-color-background "#3E4452")
 '(company-quickhelp-color-foreground "#ABB2BF")
 '(custom-enabled-themes '(doom-moonlight))
 '(custom-safe-themes
   '("e683bc51b9fcf9ea55da6267aaeb1916681cb26a8439169e5bea39f177b9fb96" "0958ae118b83731e5662e175e47334dae38309761cd89a988bed57bff9df1bcb" "5195595c3f472ccef77f511d21fdbf69f9139c914a4a36f9104ff55e9d3a6759" "45f6c80bbe81157cf45e5b4b31700a56a6182a72a5345bc49109a08b6e0e4b29" "9b54ba84f245a59af31f90bc78ed1240fca2f5a93f667ed54bbf6c6d71f664ac" "c5ded9320a346146bbc2ead692f0c63be512747963257f18cc8518c5254b7bf5" "1d44ec8ec6ec6e6be32f2f73edf398620bb721afeed50f75df6b12ccff0fbb15" "613aedadd3b9e2554f39afe760708fc3285bf594f6447822dd29f947f0775d6c" "e6f3a4a582ffb5de0471c9b640a5f0212ccf258a987ba421ae2659f1eaa39b09" "c2aeb1bd4aa80f1e4f95746bda040aafb78b1808de07d340007ba898efa484f5" "4b6b6b0a44a40f3586f0f641c25340718c7c626cbf163a78b5a399fbe0226659" "84b14a0a41bb2728568d40c545280dbe7d6891221e7fbe7c2b1c54a3f5959289" "76ed126dd3c3b653601ec8447f28d8e71a59be07d010cd96c55794c3008df4d7" "b5803dfb0e4b6b71f309606587dd88651efe0972a5be16ece6a958b197caeed8" "d47f868fd34613bd1fc11721fe055f26fd163426a299d45ce69bef1f109e1e71" "266ecb1511fa3513ed7992e6cd461756a895dcc5fef2d378f165fed1c894a78c" "23c806e34594a583ea5bbf5adf9a964afe4f28b4467d28777bcba0d35aa0872e" "8d7b028e7b7843ae00498f68fad28f3c6258eda0650fe7e17bfb017d51d0e2a2" "6c531d6c3dbc344045af7829a3a20a09929e6c41d7a7278963f7d3215139f6a7" "1f1b545575c81b967879a5dddc878783e6ebcca764e4916a270f9474215289e5" "a82ab9f1308b4e10684815b08c9cac6b07d5ccb12491f44a942d845b406b0296" "cbdf8c2e1b2b5c15b34ddb5063f1b21514c7169ff20e081d39cf57ffee89bc1e" "6c98bc9f39e8f8fd6da5b9c74a624cbb3782b4be8abae8fd84cbc43053d7c175" "028c226411a386abc7f7a0fba1a2ebfae5fe69e2a816f54898df41a6a3412bb5" "da186cce19b5aed3f6a2316845583dbee76aea9255ea0da857d1c058ff003546" "a9a67b318b7417adbedaab02f05fa679973e9718d9d26075c6235b1f0db703c8" "7a7b1d475b42c1a0b61f3b1d1225dd249ffa1abb1b7f726aec59ac7ca3bf4dae" "fe2539ccf78f28c519541e37dc77115c6c7c2efcec18b970b16e4a4d2cd9891d" "846b3dc12d774794861d81d7d2dcdb9645f82423565bfb4dad01204fa322dbd5" "a7b20039f50e839626f8d6aa96df62afebb56a5bbd1192f557cb2efb5fcfb662" "97db542a8a1731ef44b60bc97406c1eb7ed4528b0d7296997cbb53969df852d6" "f64fab0202c1eb345fd0e33dd3e1dc4ed487f6073ed506db1e395bab345e334c" "32a748806405f49e2baf82c19517f21874a75ee2cd84de26685d634dd19a1e9c" "246a9596178bb806c5f41e5b571546bb6e0f4bd41a9da0df5dfbca7ec6e2250c" "3d47380bf5aa650e7b8e049e7ae54cdada54d0637e7bac39e4cc6afb44e8463b" "d268b67e0935b9ebc427cad88ded41e875abfcc27abd409726a92e55459e0d01" "b186688fbec5e00ee8683b9f2588523abdf2db40562839b2c5458fcfb322c8a4" "f91395598d4cb3e2ae6a2db8527ceb83fed79dbaf007f435de3e91e5bda485fb" "745d03d647c4b118f671c49214420639cb3af7152e81f132478ed1c649d4597d" "1bddd01e6851f5c4336f7d16c56934513d41cc3d0233863760d1798e74809b4b" "0466adb5554ea3055d0353d363832446cd8be7b799c39839f387abb631ea0995" "e19ac4ef0f028f503b1ccafa7c337021834ce0d1a2bca03fcebc1ef635776bea" "234dbb732ef054b109a9e5ee5b499632c63cc24f7c2383a849815dacc1727cb6" "1d5e33500bc9548f800f9e248b57d1b2a9ecde79cb40c0b1398dec51ee820daf" "1704976a1797342a1b4ea7a75bdbb3be1569f4619134341bd5a4c1cfb16abad4" "4b0e826f58b39e2ce2829fab8ca999bcdc076dec35187bf4e9a4b938cb5771dc" "353ffc8e6b53a91ac87b7e86bebc6796877a0b76ddfc15793e4d7880976132ae" "835868dcd17131ba8b9619d14c67c127aa18b90a82438c8613586331129dda63" "0dd2666921bd4c651c7f8a724b3416e95228a13fca1aa27dc0022f4e023bf197" "f7c28681862769ff1d1852880ba9cd6be8a3858f26099f2c109de73f5a361dc2" "b73a23e836b3122637563ad37ae8c7533121c2ac2c8f7c87b381dd7322714cd0" "5b7c31eb904d50c470ce264318f41b3bbc85545e4359e6b7d48ee88a892b1915" "4eb6fa2ee436e943b168a0cd8eab11afc0752aebb5d974bba2b2ddc8910fca8f" "6bdcff29f32f85a2d99f48377d6bfa362768e86189656f63adbf715ac5c1340b" "78c4238956c3000f977300c8a079a3a8a8d4d9fee2e68bad91123b58a4aa8588" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "94b1de9f370cfc19eaefe4d9ff18eb44cab7c8fdefcf943c9bce9532eaebbf45" "135339a60929ad7f78ef9ec0bc4f3dfa53ac2ae2debca66ac43f16f9990777bf" "51de9c24073b69fa69bcd2c28ca29a397b6b0297ea6ec4f6c7aba448b37eee8e" "f28f8fb36b17a5222b08591d7f0352bfc8239c8d5d2e9a58478e3e165f7b6175" "438cdb9d3ba97e6a9208f5661007bc35810623858d533f9ba34c7de264acd4d0" "3b24e22c345bef7c5138410dd4f4010fb7cc12ff7660258049d0b2a17127606f" "4187db172c75e60b192332aed47b56289b581e3929b935e0ade813c7e42126ab" "2d6ee08ebfd152363e397ddde059dedbb5caf96dca1e8caea03980ce403c14f6" "e946d48cbff28362d26b99b350218149fcda9157a46f57642b396155b6e583cf" "1976c5691f26271d07dd5d56537254b4b4adb10cd9f1f74fc28eafeb9f451f7c" "f60ca963aeaf18cc058785e540679d192bb10ebf7a6e677de55c3fe96300e7ed" "e9c44f2bf102d7d04c9ef9aa088bf78849f5dfe4127d6fa4f332048e7ce6799c" "71c384ae4decce2c746df382154e5a6d660c7ba762148df7c46a93f223be68bb" "6b5c518d1c250a8ce17463b7e435e9e20faa84f3f7defba8b579d4f5925f60c1" "83e0376b5df8d6a3fbdfffb9fb0e8cf41a11799d9471293a810deb7586c131e6" "7661b762556018a44a29477b84757994d8386d6edee909409fabe0631952dad9" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "82d2cac368ccdec2fcc7573f24c3f79654b78bf133096f9b40c20d97ec1d8016" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "657d78a21e2f60615178d4f8f198371e0867a544554be15488bda716902e2a28" "f8e44524db6d0904b7e60b3abdd88bce0e8eae3064b803c4e099aa201837dfbc" "39cf01991ecf2d7793e2d4b13166b9b21b23229fdef6df25e341d97df3bb17d5" "d6d8c576780b878286d3b1cff6051d51f9115c2f466b857329d18739953d02f8" "b849dcd4fb2b31138b9425ef770122685aebf3e6ec52d5f8bf23e2d789ecee21" "98d38d05e930417ec59496f79cd78483351f66e0a692748bb6d706862882db71" "ec032f065a0375dfe88a3550a3f011a91953a396fa0c73e179738ba4d457e4be" "a2b87906151ab1e5afbbd4da315c2bf893d21b3122434b3b3a653b6f17fa9388" "ca54a00862a7f15809da458e0783834ece3264ea729af2b09dd61259fc6871ba" "3bd18d60380d8fb9378e822800836d6c67d6d3e4076088355f519930a6d29543" "8b7dfd39a16376088eefd19daf2e47a65370361726d50ee2dcfb398fca9c2bad" "824d07981667fd7d63488756b6d6a4036bae972d26337babf7b56df6e42f2bcd" "171d1ae90e46978eb9c342be6658d937a83aaa45997b1d7af7657546cae5985b" default))
 '(exwm-floating-border-color "#413f42")
 '(fci-rule-color "#3E4451")
 '(highlight-tail-colors ((("#393b35") . 0) (("#343b40") . 20)))
 '(jdee-db-active-breakpoint-face-colors (cons "#19181A" "#FCFCFA"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#19181A" "#A9DC76"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#19181A" "#727072"))
 '(objed-cursor-color "#CC6666")
 '(org-capture-templates
   '(("s" "structure" table-line
      (file "~/org/structure.org")
      "")
     ("n" "notes" entry
      (file "~/org/notes.org")
      "* Notes %?")
     ("t" "todo" entry
      (file+headline "/home/krishna/.emacs.d/todo.org" "Tasks")
      "* TODO [#A] %?")))
 '(package-selected-packages
   '(svelte-mode atom-one-dark-theme crystal-mode reformatter dart-server flutter lsp-dart dart-mode fish-mode ace-jump-mode beacon doom-themes lua-mode org-roam emacsql-sqlite3 treemacs-projectile treemacs key-chord simple-modeline nano-modeline one-themes hungry-delete pandoc-mode highlight-indentation gruvbox-theme helm rust-mode color-theme-sanityinc-tomorrow yasnippet py-autopep8 multiple-cursors diminish mark-multiple projectile swiper company dashboard rainbow-delimiters which-key use-package rjsx-mode rainbow-mode prettier-js emmet-mode avy))
 '(pdf-view-midnight-colors '("#fdf4c1" . "#282828"))
 '(rustic-ansi-faces
   ["#2D2A2E" "#CC6666" "#A9DC76" "#FFD866" "#78DCE8" "#FF6188" "#78DCE8" "#FCFCFA"])
 '(tetris-x-colors
   [[229 192 123]
    [97 175 239]
    [209 154 102]
    [224 108 117]
    [152 195 121]
    [198 120 221]
    [86 182 194]])
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   '((20 . "#cc6666")
     (40 . "#de935f")
     (60 . "#f0c674")
     (80 . "#b5bd68")
     (100 . "#8abeb7")
     (120 . "#81a2be")
     (140 . "#b294bb")
     (160 . "#cc6666")
     (180 . "#de935f")
     (200 . "#f0c674")
     (220 . "#b5bd68")
     (240 . "#8abeb7")
     (260 . "#81a2be")
     (280 . "#b294bb")
     (300 . "#cc6666")
     (320 . "#de935f")
     (340 . "#f0c674")
     (360 . "#b5bd68")))
 '(vc-annotate-very-old-color nil))
;; (custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 ;; '(default ((t (:inherit nil :extend nil :stipple nil :background "#20202a" :foreground "#ABB2BF" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 113 :width normal :foundry "CTDB" :family "JetBrains Mono")))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
