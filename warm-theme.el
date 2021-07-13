;;; warm-theme.el --- Warm Theme

;; Copyright 2015-present, All rights reserved
;;
;; Code licensed under the MIT license

;; Author: film42
;; Version: 1.7.0
;; Package-Requires: ((emacs "24.3"))
;; URL: https://github.com/warm/emacs

;;; Commentary:

;; A dark color theme available for a number of editors.

;;; Code:
(deftheme warm)


;;;; Configuration options:

(defgroup warm nil
  "Warm theme options.

The theme has to be reloaded after changing anything in this group."
  :group 'faces)

(defcustom warm-enlarge-headings t
  "Use different font sizes for some headings and titles."
  :type 'boolean
  :group 'warm)

(defcustom warm-height-title-1 1.3
  "Font size 100%."
  :type 'number
  :group 'warm)

(defcustom warm-height-title-2 1.1
  "Font size 110%."
  :type 'number
  :group 'warm)

(defcustom warm-height-title-3 1.0
  "Font size 130%."
  :type 'number
  :group 'warm)

(defcustom warm-height-doc-title 1.44
  "Font size 144%."
  :type 'number
  :group 'warm)

(defcustom warm-alternate-mode-line-and-minibuffer nil
  "Use less bold and pink in the minibuffer."
  :type 'boolean
  :group 'warm)

(defvar warm-use-24-bit-colors-on-256-colors-terms nil
  "Use true colors even on terminals announcing less capabilities.

Beware the use of this variable.  Using it may lead to unwanted
behavior, the most common one being an ugly blue background on
terminals, which don't understand 24 bit colors.  To avoid this
blue background, when using this variable, one can try to add the
following lines in their config file after having load the
Warm theme:

    (unless (display-graphic-p)
      (set-face-background 'default \"black\" nil))

There is a lot of discussion behind the 256 colors theme (see URL
`https://github.com/warm/emacs/pull/57').  Please take time to
read it before opening a new issue about your will.")


;;;; Theme definition:

;; Assigment form: VARIABLE COLOR [256-COLOR [TTY-COLOR]]
(let ((colors '(;; Upstream theme color
                (warm-bg      "#1c1f22" "#1c1f22" "#1c1f22") ; official background
                (warm-fg      "#bebebe" "#ffffff" "brightwhite") ; official foreground
                (warm-current "#44475a" "#303030" "brightblack") ; official current-line/selection
                (warm-comment "#343434" "#5f5faf" "blue")        ; official comment
                (warm-cyan    "#88c0d0" "#87d7ff" "brightcyan")  ; official cyan
                (warm-green   "#a3be8c" "#5fff87" "green")       ; official green
                (warm-orange  "#ba8163" "#ffaf5f" "brightred")   ; official orange
                (warm-pink    "#aa6a6a" "#ff87d7" "magenta")     ; official pink
                (warm-purple  "#b48ead" "#af87ff" "brightmagenta") ; official purple
                (warm-red     "#bf616a" "#ff8787" "red")         ; official red
                (warm-yellow  "#b7aa5e" "#ffff87" "yellow")      ; official yellow
                ;; Other colors
                (bg2             "#373844" "#121212" "brightblack")
                (bg3             "#464752" "#262626" "brightblack")
                (bg4             "#565761" "#444444" "brightblack")
                (fg2             "#e2e2dc" "#e4e4e4" "brightwhite")
                (fg3             "#ccccc7" "#c6c6c6" "white")
                (fg4             "#b6b6b2" "#b2b2b2" "white")
                (fg5             "#b2b2b211" "#b2b2b211" "transparent")
                (other-blue      "#6bbac1" "#0087ff" "brightblue")))
      (faces '(;; default
               (cursor :background ,fg3)
               (default :background ,warm-bg :foreground ,warm-fg)
               (default-italic :slant italic)
               (ffap :foreground ,fg4)
               (fringe :background ,warm-bg :foreground ,fg4)
               (highlight :foreground ,fg3 :background ,bg3)
               (hl-line :background ,warm-current :extend t)
               (info-quoted-name :foreground ,warm-orange)
               (info-string :foreground ,warm-yellow)
               (lazy-highlight :foreground ,fg2 :background ,bg2)
               (link :foreground ,warm-cyan :underline t)
               (linum :slant italic :foreground ,bg4 :background ,warm-bg)
               (line-number :slant italic :foreground ,bg4 :background ,warm-bg)
               (match :background ,warm-yellow :foreground ,warm-bg)
               (minibuffer-prompt
                ,@(if warm-alternate-mode-line-and-minibuffer
                      (list :weight 'normal :foreground warm-fg)
                    (list :weight 'bold :foreground warm-pink)))
               (read-multiple-choice-face :inherit completions-first-difference)
              ;; (region :inherit match :extend t)
               (region :background ,bg4)
               (shadow :foreground ,warm-comment)
               (trailing-whitespace :foreground "unspecified-fg" :background ,warm-orange)
               (vertical-border :foreground ,bg2)
               (success :foreground ,warm-green)
               (warning :foreground ,warm-orange)
               (error :foreground ,warm-red)
               (header-line :background ,warm-bg)
               ;; syntax
               (font-lock-builtin-face :foreground ,warm-orange)
               (font-lock-comment-face :inherit shadow)
               (font-lock-comment-delimiter-face :inherit shadow)
               (font-lock-constant-face :foreground ,warm-cyan)
               (font-lock-doc-face :foreground ,warm-comment)
               (font-lock-function-name-face :foreground ,warm-green :weight bold)
               (font-lock-keyword-face :foreground ,warm-pink :weight bold)
               (font-lock-negation-char-face :foreground ,warm-cyan)
               (font-lock-preprocessor-face :foreground ,warm-orange)
               (font-lock-reference-face :foreground ,warm-cyan)
               (font-lock-regexp-grouping-backslash :foreground ,warm-cyan)
               (font-lock-regexp-grouping-construct :foreground ,warm-purple)
               (font-lock-string-face :foreground ,warm-yellow)
               (font-lock-type-face :foreground ,warm-purple)
               (font-lock-variable-name-face :foreground ,warm-fg :weight bold)
               (font-lock-warning-face :foreground ,warm-orange :background ,bg2)
               ;; auto-complete
               (ac-completion-face :underline t :foreground ,warm-pink)
               ;; company
               (company-echo-common :foreground ,warm-bg :background ,warm-fg)
               (company-preview :background ,warm-current :foreground ,other-blue)
               (company-preview-common :inherit company-preview
                                       :foreground ,warm-pink)
               (company-preview-search :inherit company-preview
                                       :foreground ,warm-green)
               (company-scrollbar-bg :background ,warm-comment)
               (company-scrollbar-fg :foreground ,other-blue)
               (company-tooltip :foreground ,warm-fg :background ,warm-current)
               (company-tooltip-search :foreground ,warm-green
                                       :underline t)
               (company-tooltip-search-selection :background ,warm-green
                                                 :foreground ,warm-bg)
               (company-tooltip-selection :inherit match)
               (company-tooltip-mouse :background ,warm-bg)
               (company-tooltip-common :foreground ,warm-pink :weight bold)
               ;;(company-tooltip-common-selection :inherit company-tooltip-common)
               (company-tooltip-annotation :foreground ,warm-cyan)
               ;;(company-tooltip-annotation-selection :inherit company-tooltip-annotation)
               ;; completions (minibuffer.el)
               (completions-annotations :inherit font-lock-comment-face)
               (completions-common-part :foreground ,warm-green)
               (completions-first-difference :foreground ,warm-pink :weight bold)
               ;; diff-hl
               (diff-hl-change :foreground ,warm-orange :background ,warm-orange)
               (diff-hl-delete :foreground ,warm-red :background ,warm-red)
               (diff-hl-insert :foreground ,warm-green :background ,warm-green)
               ;; dired
               (dired-directory :foreground ,warm-green :weight normal)
               (dired-flagged :foreground ,warm-pink)
               (dired-header :foreground ,fg3 :background ,warm-bg)
               (dired-ignored :inherit shadow)
               (dired-mark :foreground ,warm-fg :weight bold)
               (dired-marked :foreground ,warm-orange :weight bold)
               (dired-perm-write :foreground ,fg3 :underline t)
               (dired-symlink :foreground ,warm-yellow :weight normal :slant italic)
               (dired-warning :foreground ,warm-orange :underline t)
               (diredp-compressed-file-name :foreground ,fg3)
               (diredp-compressed-file-suffix :foreground ,fg4)
               (diredp-date-time :foreground ,warm-fg)
               (diredp-deletion-file-name :foreground ,warm-pink :background ,warm-current)
               (diredp-deletion :foreground ,warm-pink :weight bold)
               (diredp-dir-heading :foreground ,fg2 :background ,bg4)
               (diredp-dir-name :inherit dired-directory)
               (diredp-dir-priv :inherit dired-directory)
               (diredp-executable-tag :foreground ,warm-orange)
               (diredp-file-name :foreground ,warm-fg)
               (diredp-file-suffix :foreground ,fg4)
               (diredp-flag-mark-line :foreground ,fg2 :slant italic :background ,warm-current)
               (diredp-flag-mark :foreground ,fg2 :weight bold :background ,warm-current)
               (diredp-ignored-file-name :foreground ,warm-fg)
               (diredp-mode-line-flagged :foreground ,warm-orange)
               (diredp-mode-line-marked :foreground ,warm-orange)
               (diredp-no-priv :foreground ,warm-fg)
               (diredp-number :foreground ,warm-cyan)
               (diredp-other-priv :foreground ,warm-orange)
               (diredp-rare-priv :foreground ,warm-orange)
               (diredp-read-priv :foreground ,warm-purple)
               (diredp-write-priv :foreground ,warm-pink)
               (diredp-exec-priv :foreground ,warm-yellow)
               (diredp-symlink :foreground ,warm-orange)
               (diredp-link-priv :foreground ,warm-orange)
               (diredp-autofile-name :foreground ,warm-yellow)
               (diredp-tagged-autofile-name :foreground ,warm-yellow)
               ;; elfeed
               (elfeed-search-date-face :foreground ,warm-comment)
               (elfeed-search-title-face :foreground ,warm-fg)
               (elfeed-search-unread-title-face :foreground ,warm-pink :weight bold)
               (elfeed-search-feed-face :foreground ,warm-fg :weight bold)
               (elfeed-search-tag-face :foreground ,warm-green)
               (elfeed-search-last-update-face :weight bold)
               (elfeed-search-unread-count-face :foreground ,warm-pink)
               (elfeed-search-filter-face :foreground ,warm-green :weight bold)
               ;;(elfeed-log-date-face :inherit font-lock-type-face)
               (elfeed-log-error-level-face :foreground ,warm-red)
               (elfeed-log-warn-level-face :foreground ,warm-orange)
               (elfeed-log-info-level-face :foreground ,warm-cyan)
               (elfeed-log-debug-level-face :foreground ,warm-comment)
               ;; elpher
               (elpher-gemini-heading1 :inherit bold :foreground ,warm-pink
                                       ,@(when warm-enlarge-headings
                                           (list :height warm-height-title-1)))
               (elpher-gemini-heading2 :inherit bold :foreground ,warm-purple
                                       ,@(when warm-enlarge-headings
                                           (list :height warm-height-title-2)))
               (elpher-gemini-heading3 :weight normal :foreground ,warm-green
                                       ,@(when warm-enlarge-headings
                                           (list :height warm-height-title-3)))
               (elpher-gemini-preformatted :inherit fixed-pitch
                                           :foreground ,warm-orange)
               ;; enh-ruby
               (enh-ruby-heredoc-delimiter-face :foreground ,warm-yellow)
               (enh-ruby-op-face :foreground ,warm-pink)
               (enh-ruby-regexp-delimiter-face :foreground ,warm-yellow)
               (enh-ruby-string-delimiter-face :foreground ,warm-yellow)
               ;; flyspell
               (flyspell-duplicate :underline (:style wave :color ,warm-orange))
               (flyspell-incorrect :underline (:style wave :color ,warm-red))
               ;; font-latex
               (font-latex-bold-face :foreground ,warm-purple)
               (font-latex-italic-face :foreground ,warm-pink :slant italic)
               (font-latex-match-reference-keywords :foreground ,warm-cyan)
               (font-latex-match-variable-keywords :foreground ,warm-fg)
               (font-latex-string-face :foreground ,warm-yellow)
               ;; gemini
               (gemini-heading-face-1 :inherit bold :foreground ,warm-pink
                                      ,@(when warm-enlarge-headings
                                          (list :height warm-height-title-1)))
               (gemini-heading-face-2 :inherit bold :foreground ,warm-purple
                                      ,@(when warm-enlarge-headings
                                          (list :height warm-height-title-2)))
               (gemini-heading-face-3 :weight normal :foreground ,warm-green
                                      ,@(when warm-enlarge-headings
                                          (list :height warm-height-title-3)))
               (gemini-heading-face-rest :weight normal :foreground ,warm-yellow)
               (gemini-quote-face :foreground ,warm-purple)
               ;; gnus-group
               (gnus-group-mail-1 :foreground ,warm-pink :weight bold)
               (gnus-group-mail-1-empty :inherit gnus-group-mail-1 :weight normal)
               (gnus-group-mail-2 :foreground ,warm-cyan :weight bold)
               (gnus-group-mail-2-empty :inherit gnus-group-mail-2 :weight normal)
               (gnus-group-mail-3 :foreground ,warm-comment :weight bold)
               (gnus-group-mail-3-empty :inherit gnus-group-mail-3 :weight normal)
               (gnus-group-mail-low :foreground ,warm-current :weight bold)
               (gnus-group-mail-low-empty :inherit gnus-group-mail-low :weight normal)
               (gnus-group-news-1 :foreground ,warm-pink :weight bold)
               (gnus-group-news-1-empty :inherit gnus-group-news-1 :weight normal)
               (gnus-group-news-2 :foreground ,warm-cyan :weight bold)
               (gnus-group-news-2-empty :inherit gnus-group-news-2 :weight normal)
               (gnus-group-news-3 :foreground ,warm-comment :weight bold)
               (gnus-group-news-3-empty :inherit gnus-group-news-3 :weight normal)
               (gnus-group-news-4 :inherit gnus-group-news-low)
               (gnus-group-news-4-empty :inherit gnus-group-news-low-empty)
               (gnus-group-news-5 :inherit gnus-group-news-low)
               (gnus-group-news-5-empty :inherit gnus-group-news-low-empty)
               (gnus-group-news-6 :inherit gnus-group-news-low)
               (gnus-group-news-6-empty :inherit gnus-group-news-low-empty)
               (gnus-group-news-low :foreground ,warm-current :weight bold)
               (gnus-group-news-low-empty :inherit gnus-group-news-low :weight normal)
               (gnus-header-content :foreground ,warm-pink)
               (gnus-header-from :foreground ,warm-fg)
               (gnus-header-name :foreground ,warm-purple)
               (gnus-header-subject :foreground ,warm-green :weight bold)
               (gnus-summary-markup-face :foreground ,warm-cyan)
               (gnus-summary-high-unread :foreground ,warm-pink :weight bold)
               (gnus-summary-high-read :inherit gnus-summary-high-unread :weight normal)
               (gnus-summary-high-ancient :inherit gnus-summary-high-read)
               (gnus-summary-high-ticked :inherit gnus-summary-high-read :underline t)
               (gnus-summary-normal-unread :foreground ,other-blue :weight bold)
               (gnus-summary-normal-read :foreground ,warm-comment :weight normal)
               (gnus-summary-normal-ancient :inherit gnus-summary-normal-read :weight light)
               (gnus-summary-normal-ticked :foreground ,warm-pink :weight bold)
               (gnus-summary-low-unread :foreground ,warm-comment :weight bold)
               (gnus-summary-low-read :inherit gnus-summary-low-unread :weight normal)
               (gnus-summary-low-ancient :inherit gnus-summary-low-read)
               (gnus-summary-low-ticked :inherit gnus-summary-low-read :underline t)
               (gnus-summary-selected :inverse-video t)
               ;; haskell-mode
               (haskell-operator-face :foreground ,warm-pink)
               (haskell-constructor-face :foreground ,warm-purple)
               ;; helm
               (helm-bookmark-w3m :foreground ,warm-purple)
               (helm-buffer-not-saved :foreground ,warm-purple :background ,warm-bg)
               (helm-buffer-process :foreground ,warm-orange :background ,warm-bg)
               (helm-buffer-saved-out :foreground ,warm-fg :background ,warm-bg)
               (helm-buffer-size :foreground ,warm-fg :background ,warm-bg)
               (helm-candidate-number :foreground ,warm-bg :background ,warm-fg)
               (helm-ff-directory :foreground ,warm-green :background ,warm-bg :weight bold)
               (helm-ff-dotted-directory :foreground ,warm-green :background ,warm-bg :weight normal)
               (helm-ff-executable :foreground ,other-blue :background ,warm-bg :weight normal)
               (helm-ff-file :foreground ,warm-fg :background ,warm-bg :weight normal)
               (helm-ff-invalid-symlink :foreground ,warm-pink :background ,warm-bg :weight bold)
               (helm-ff-prefix :foreground ,warm-bg :background ,warm-pink :weight normal)
               (helm-ff-symlink :foreground ,warm-pink :background ,warm-bg :weight bold)
               (helm-grep-cmd-line :foreground ,warm-fg :background ,warm-bg)
               (helm-grep-file :foreground ,warm-fg :background ,warm-bg)
               (helm-grep-finish :foreground ,fg2 :background ,warm-bg)
               (helm-grep-lineno :foreground ,warm-fg :background ,warm-bg)
               (helm-grep-match :foreground "unspecified-fg" :background "unspecified-bg" :inherit helm-match)
               (helm-grep-running :foreground ,warm-green :background ,warm-bg)
               (helm-header :foreground ,fg2 :background ,warm-bg :underline nil :box nil)
               (helm-moccur-buffer :foreground ,warm-green :background ,warm-bg)
               (helm-selection :background ,bg2 :underline nil)
               (helm-selection-line :background ,bg2)
               (helm-separator :foreground ,warm-purple :background ,warm-bg)
               (helm-source-go-package-godoc-description :foreground ,warm-yellow)
               (helm-source-header :foreground ,warm-pink :background ,warm-bg :underline nil :weight bold)
               (helm-time-zone-current :foreground ,warm-orange :background ,warm-bg)
               (helm-time-zone-home :foreground ,warm-purple :background ,warm-bg)
               (helm-visible-mark :foreground ,warm-bg :background ,bg3)
               ;; highlight-indentation minor mode
               (highlight-indentation-face :background ,bg2)
               ;; icicle
               (icicle-whitespace-highlight :background ,warm-fg)
               (icicle-special-candidate :foreground ,fg2)
               (icicle-extra-candidate :foreground ,fg2)
               (icicle-search-main-regexp-others :foreground ,warm-fg)
               (icicle-search-current-input :foreground ,warm-pink)
               (icicle-search-context-level-8 :foreground ,warm-orange)
               (icicle-search-context-level-7 :foreground ,warm-orange)
               (icicle-search-context-level-6 :foreground ,warm-orange)
               (icicle-search-context-level-5 :foreground ,warm-orange)
               (icicle-search-context-level-4 :foreground ,warm-orange)
               (icicle-search-context-level-3 :foreground ,warm-orange)
               (icicle-search-context-level-2 :foreground ,warm-orange)
               (icicle-search-context-level-1 :foreground ,warm-orange)
               (icicle-search-main-regexp-current :foreground ,warm-fg)
               (icicle-saved-candidate :foreground ,warm-fg)
               (icicle-proxy-candidate :foreground ,warm-fg)
               (icicle-mustmatch-completion :foreground ,warm-purple)
               (icicle-multi-command-completion :foreground ,fg2 :background ,bg2)
               (icicle-msg-emphasis :foreground ,warm-green)
               (icicle-mode-line-help :foreground ,fg4)
               (icicle-match-highlight-minibuffer :foreground ,warm-orange)
               (icicle-match-highlight-Completions :foreground ,warm-green)
               (icicle-key-complete-menu-local :foreground ,warm-fg)
               (icicle-key-complete-menu :foreground ,warm-fg)
               (icicle-input-completion-fail-lax :foreground ,warm-pink)
               (icicle-input-completion-fail :foreground ,warm-pink)
               (icicle-historical-candidate-other :foreground ,warm-fg)
               (icicle-historical-candidate :foreground ,warm-fg)
               (icicle-current-candidate-highlight :foreground ,warm-orange :background ,bg3)
               (icicle-Completions-instruction-2 :foreground ,fg4)
               (icicle-Completions-instruction-1 :foreground ,fg4)
               (icicle-completion :foreground ,warm-fg)
               (icicle-complete-input :foreground ,warm-orange)
               (icicle-common-match-highlight-Completions :foreground ,warm-purple)
               (icicle-candidate-part :foreground ,warm-fg)
               (icicle-annotation :foreground ,fg4)
               ;; icomplete
               (icompletep-determined :foreground ,warm-orange)
               ;; ido
               (ido-first-match
                ,@(if warm-alternate-mode-line-and-minibuffer
                      (list :weight 'normal :foreground warm-green)
                    (list :weight 'bold :foreground warm-pink)))
               (ido-only-match :foreground ,warm-orange)
               (ido-subdir :foreground ,warm-yellow)
               (ido-virtual :foreground ,warm-cyan)
               (ido-incomplete-regexp :inherit font-lock-warning-face)
               (ido-indicator :foreground ,warm-fg :background ,warm-pink)
               ;; ivy
               (ivy-current-match
                ,@(if warm-alternate-mode-line-and-minibuffer
                      (list :weight 'normal :foreground warm-green)
                    (list :weight 'bold :foreground warm-pink)))
               ;; Highlights the background of the match.
               (ivy-minibuffer-match-face-1 :background ,warm-current)
               ;; Highlights the first matched group.
               (ivy-minibuffer-match-face-2 :background ,warm-green
                                            :foreground ,warm-bg)
               ;; Highlights the second matched group.
               (ivy-minibuffer-match-face-3 :background ,warm-yellow
                                            :foreground ,warm-bg)
               ;; Highlights the third matched group.
               (ivy-minibuffer-match-face-4 :background ,warm-pink
                                            :foreground ,warm-bg)
               (ivy-confirm-face :foreground ,warm-orange)
               (ivy-match-required-face :foreground ,warm-red)
               (ivy-subdir :foreground ,warm-yellow)
               (ivy-remote :foreground ,warm-pink)
               (ivy-virtual :foreground ,warm-cyan)
               ;; isearch
               (isearch :inherit match :weight bold)
               (isearch-fail :foreground ,warm-bg :background ,warm-orange)
               ;; jde-java
               (jde-java-font-lock-constant-face :foreground ,warm-cyan)
               (jde-java-font-lock-modifier-face :foreground ,warm-pink)
               (jde-java-font-lock-number-face :foreground ,warm-fg)
               (jde-java-font-lock-package-face :foreground ,warm-fg)
               (jde-java-font-lock-private-face :foreground ,warm-pink)
               (jde-java-font-lock-public-face :foreground ,warm-pink)
               ;; js2-mode
               (js2-external-variable :foreground ,warm-purple)
               (js2-function-param :foreground ,warm-cyan)
               (js2-jsdoc-html-tag-delimiter :foreground ,warm-yellow)
               (js2-jsdoc-html-tag-name :foreground ,other-blue)
               (js2-jsdoc-value :foreground ,warm-yellow)
               (js2-private-function-call :foreground ,warm-cyan)
               (js2-private-member :foreground ,fg3)
               ;; js3-mode
               (js3-error-face :underline ,warm-orange)
               (js3-external-variable-face :foreground ,warm-fg)
               (js3-function-param-face :foreground ,warm-pink)
               (js3-instance-member-face :foreground ,warm-cyan)
               (js3-jsdoc-tag-face :foreground ,warm-pink)
               (js3-warning-face :underline ,warm-pink)
               ;; lsp
               (lsp-ui-peek-peek :background ,warm-bg)
               (lsp-ui-peek-list :background ,bg2)
               (lsp-ui-peek-filename :foreground ,warm-pink :weight bold)
               (lsp-ui-peek-line-number :foreground ,warm-fg)
               (lsp-ui-peek-highlight :inherit highlight :distant-foreground ,warm-bg)
               (lsp-ui-peek-header :background ,bg3 :foreground ,fg3, :weight bold)
               (lsp-ui-peek-footer :inherit lsp-ui-peek-header)
               (lsp-ui-peek-selection :inherit match)
               (lsp-ui-sideline-symbol :foreground ,fg4 :box (:line-width -1 :color ,fg4) :height 0.99)
               (lsp-ui-sideline-current-symbol :foreground ,warm-fg :weight ultra-bold
                                               :box (:line-width -1 :color warm-fg) :height 0.99)
               (lsp-ui-sideline-code-action :foreground ,warm-yellow)
               (lsp-ui-sideline-symbol-info :slant italic :height 0.99)
               (lsp-ui-doc-background :background ,warm-bg)
               (lsp-ui-doc-header :foreground ,warm-bg :background ,warm-cyan)
               ;; magit
               (magit-branch-local :foreground ,warm-cyan)
               (magit-branch-remote :foreground ,warm-green)
               (magit-tag :foreground ,warm-orange)
               (magit-section-heading :foreground ,warm-pink :weight bold)
               (magit-section-highlight :background ,bg3 :extend t)
               (magit-diff-context-highlight :background ,bg3
                                             :foreground ,fg3
                                             :extend t)
               (magit-diff-revision-summary :foreground ,warm-orange
                                            :background ,warm-bg
                                            :weight bold)
               (magit-diff-revision-summary-highlight :foreground ,warm-orange
                                                      :background ,bg3
                                                      :weight bold
                                                      :extend t)
               ;; the four following lines are just a patch of the
               ;; upstream color to add the extend keyword.
               (magit-diff-added :background "#335533"
                                 :foreground "#ddffdd"
                                 :extend t)
               (magit-diff-added-highlight :background "#336633"
                                           :foreground "#cceecc"
                                           :extend t)
               (magit-diff-removed :background "#553333"
                                   :foreground "#ffdddd"
                                   :extend t)
               (magit-diff-removed-highlight :background "#663333"
                                             :foreground "#eecccc"
                                             :extend t)
               (magit-diff-file-heading :foreground ,warm-fg)
               (magit-diff-file-heading-highlight :inherit magit-section-highlight)
               (magit-diffstat-added :foreground ,warm-green)
               (magit-diffstat-removed :foreground ,warm-red)
               (magit-hash :foreground ,fg2)
               (magit-hunk-heading :background ,bg3)
               (magit-hunk-heading-highlight :background ,bg3)
               (magit-item-highlight :background ,bg3)
               (magit-log-author :foreground ,fg3)
               (magit-process-ng :foreground ,warm-orange :weight bold)
               (magit-process-ok :foreground ,warm-green :weight bold)
               ;; markdown
               (markdown-blockquote-face :foreground ,warm-purple)
               (markdown-code-face :foreground ,warm-orange)
               (markdown-footnote-face :foreground ,other-blue)
               (markdown-header-face :weight normal)
               (markdown-header-face-1
                :inherit bold :foreground ,warm-pink
                ,@(when warm-enlarge-headings
                    (list :height warm-height-title-1)))
               (markdown-header-face-2
                :inherit bold :foreground ,warm-purple
                ,@(when warm-enlarge-headings
                    (list :height warm-height-title-2)))
               (markdown-header-face-3
                :foreground ,warm-green
                ,@(when warm-enlarge-headings
                    (list :height warm-height-title-3)))
               (markdown-header-face-4 :foreground ,warm-yellow)
               (markdown-header-face-5 :foreground ,warm-cyan)
               (markdown-header-face-6 :foreground ,warm-orange)
               (markdown-header-face-7 :foreground ,other-blue)
               (markdown-header-face-8 :foreground ,warm-fg)
               (markdown-inline-code-face :foreground ,warm-yellow)
               (markdown-plain-url-face :inherit link)
               (markdown-pre-face :foreground ,warm-orange)
               (markdown-table-face :foreground ,warm-purple)
               ;; message
               (message-header-to :foreground ,warm-fg :weight bold)
               (message-header-cc :foreground ,warm-fg :bold bold)
               (message-header-subject :foreground ,warm-orange)
               (message-header-newsgroups :foreground ,warm-purple)
               (message-header-other :foreground ,warm-purple)
               (message-header-name :foreground ,warm-green)
               (message-header-xheader :foreground ,warm-cyan)
               (message-separator :foreground ,warm-cyan :slant italic)
               (message-cited-text :foreground ,warm-purple)
               (message-cited-text-1 :foreground ,warm-purple)
               (message-cited-text-2 :foreground ,warm-orange)
               (message-cited-text-3 :foreground ,warm-comment)
               (message-cited-text-4 :foreground ,fg2)
               (message-mml :foreground ,warm-green :weight normal)
               ;; mode-line
               (mode-line :background ,warm-current
                          :box ,warm-current :inverse-video nil
                          ,@(if warm-alternate-mode-line-and-minibuffer
                                (list :foreground fg3)
                              (list :foreground "unspecified-fg")))
               (mode-line-inactive
                :inverse-video nil
                ,@(if warm-alternate-mode-line-and-minibuffer
                      (list :foreground warm-comment :background warm-bg
                            :box warm-bg)
                    (list :foreground warm-fg :background bg2 :box bg2)))
               ;; mu4e
               (mu4e-unread-face :foreground ,warm-pink :weight normal)
               (mu4e-view-url-number-face :foreground ,warm-purple)
               (mu4e-highlight-face :background ,warm-bg
                                    :foreground ,warm-yellow
                                    :extend t)
               (mu4e-header-highlight-face :background ,warm-current
                                           :foreground ,warm-fg
                                           :underline nil :weight bold
                                           :extend t)
               (mu4e-header-key-face :inherit message-mml)
               (mu4e-header-marks-face :foreground ,warm-purple)
               (mu4e-cited-1-face :foreground ,warm-purple)
               (mu4e-cited-2-face :foreground ,warm-orange)
               (mu4e-cited-3-face :foreground ,warm-comment)
               (mu4e-cited-4-face :foreground ,fg2)
               (mu4e-cited-5-face :foreground ,fg3)
               ;; neotree
               (neo-banner-face :foreground ,warm-orange :weight bold)
               ;;(neo-button-face :underline nil)
               (neo-dir-link-face :foreground ,warm-purple)
               (neo-expand-btn-face :foreground ,warm-fg)
               (neo-file-link-face :foreground ,warm-cyan)
               (neo-header-face :background ,warm-bg
                                :foreground ,warm-fg
                                :weight bold)
               (neo-root-dir-face :foreground ,warm-purple :weight bold)
               (neo-vc-added-face :foreground ,warm-orange)
               (neo-vc-conflict-face :foreground ,warm-red)
               (neo-vc-default-face :inherit neo-file-link-face)
               (neo-vc-edited-face :foreground ,warm-orange)
               (neo-vc-ignored-face :foreground ,warm-comment)
               (neo-vc-missing-face :foreground ,warm-red)
               (neo-vc-needs-merge-face :foreground ,warm-red
                                        :weight bold)
               ;;(neo-vc-needs-update-face :underline t)
               ;;(neo-vc-removed-face :strike-through t)
               (neo-vc-unlocked-changes-face :foreground ,warm-red)
               ;;(neo-vc-unregistered-face nil)
               (neo-vc-up-to-date-face :foreground ,warm-green)
               (neo-vc-user-face :foreground ,warm-purple)
               ;; org
               (org-agenda-date :foreground ,warm-cyan :underline nil)
               (org-agenda-dimmed-todo-face :foreground ,warm-comment)
               (org-agenda-done :foreground ,warm-green)
               (org-agenda-structure :foreground ,warm-purple)
               (org-block :foreground ,warm-orange)
               (org-code :foreground ,warm-yellow)
               (org-column :background ,bg4)
               (org-column-title :inherit org-column :weight bold :underline t)
               (org-date :foreground ,warm-cyan :underline t)
               (org-document-info :foreground ,other-blue)
               (org-document-info-keyword :foreground ,warm-comment)
               (org-document-title :weight bold :foreground ,warm-orange
                                   ,@(when warm-enlarge-headings
                                       (list :height warm-height-doc-title)))
               (org-done :foreground ,warm-green)
               (org-ellipsis :foreground ,warm-comment)
               (org-footnote :foreground ,other-blue)
               (org-formula :foreground ,warm-pink)
               (org-headline-done :foreground ,warm-comment
                                  :weight normal :strike-through t)
               (org-hide :foreground ,warm-bg :background ,warm-bg)
               (org-level-1 :inherit bold :foreground ,warm-pink
                            ,@(when warm-enlarge-headings
                                (list :height warm-height-title-1)))
               (org-level-2 :inherit bold :foreground ,warm-purple
                            ,@(when warm-enlarge-headings
                                (list :height warm-height-title-2)))
               (org-level-3 :weight normal :foreground ,warm-green
                            ,@(when warm-enlarge-headings
                                (list :height warm-height-title-3)))
               (org-level-4 :weight normal :foreground ,warm-yellow)
               (org-level-5 :weight normal :foreground ,warm-cyan)
               (org-level-6 :weight normal :foreground ,warm-orange)
               (org-level-7 :weight normal :foreground ,other-blue)
               (org-level-8 :weight normal :foreground ,warm-fg)
               (org-link :foreground ,warm-cyan :underline t)
               (org-priority :foreground ,warm-cyan)
               (org-scheduled :foreground ,warm-green)
               (org-scheduled-previously :foreground ,warm-yellow)
               (org-scheduled-today :foreground ,warm-green)
               (org-sexp-date :foreground ,fg4)
               (org-special-keyword :foreground ,warm-yellow)
               (org-table :foreground ,warm-purple)
               (org-tag :foreground ,warm-pink :weight bold :background ,bg2)
               (org-todo :foreground ,warm-orange :weight bold :background ,bg2)
               (org-upcoming-deadline :foreground ,warm-yellow)
               (org-warning :weight bold :foreground ,warm-pink)
               ;; outline
               (outline-1 :foreground ,warm-pink)
               (outline-2 :foreground ,warm-purple)
               (outline-3 :foreground ,warm-green)
               (outline-4 :foreground ,warm-yellow)
               (outline-5 :foreground ,warm-cyan)
               (outline-6 :foreground ,warm-orange)
               ;; powerline
               (powerline-active1 :background ,warm-bg :foreground ,warm-pink)
               (powerline-active2 :background ,warm-bg :foreground ,warm-pink)
               (powerline-inactive1 :background ,bg2 :foreground ,warm-purple)
               (powerline-inactive2 :background ,bg2 :foreground ,warm-purple)
               (powerline-evil-base-face :foreground ,bg2)
               (powerline-evil-emacs-face :inherit powerline-evil-base-face :background ,warm-yellow)
               (powerline-evil-insert-face :inherit powerline-evil-base-face :background ,warm-cyan)
               (powerline-evil-motion-face :inherit powerline-evil-base-face :background ,warm-purple)
               (powerline-evil-normal-face :inherit powerline-evil-base-face :background ,warm-green)
               (powerline-evil-operator-face :inherit powerline-evil-base-face :background ,warm-pink)
               (powerline-evil-replace-face :inherit powerline-evil-base-face :background ,warm-red)
               (powerline-evil-visual-face :inherit powerline-evil-base-face :background ,warm-orange)
               ;; rainbow-delimiters
               (rainbow-delimiters-depth-1-face :foreground ,warm-fg)
               (rainbow-delimiters-depth-2-face :foreground ,warm-cyan)
               (rainbow-delimiters-depth-3-face :foreground ,warm-purple)
               (rainbow-delimiters-depth-4-face :foreground ,warm-pink)
               (rainbow-delimiters-depth-5-face :foreground ,warm-orange)
               (rainbow-delimiters-depth-6-face :foreground ,warm-green)
               (rainbow-delimiters-depth-7-face :foreground ,warm-yellow)
               (rainbow-delimiters-depth-8-face :foreground ,other-blue)
               (rainbow-delimiters-unmatched-face :foreground ,warm-orange)
               ;; rpm-spec
               (rpm-spec-dir-face :foreground ,warm-green)
               (rpm-spec-doc-face :foreground ,warm-pink)
               (rpm-spec-ghost-face :foreground ,warm-purple)
               (rpm-spec-macro-face :foreground ,warm-yellow)
               (rpm-spec-obsolete-tag-face :inherit font-lock-warning-face)
               (rpm-spec-package-face :foreground ,warm-purple)
               (rpm-spec-section-face :foreground ,warm-yellow)
               (rpm-spec-tag-face :foreground ,warm-cyan)
               (rpm-spec-var-face :foreground ,warm-orange)
               ;; selectrum-mode
               (selectrum-current-candidate :weight bold)
               (selectrum-primary-highlight :foreground ,warm-pink)
               (selectrum-secondary-highlight :foreground ,warm-green)
               ;; show-paren
               (show-paren-match-face :background unspecified
                                      :foreground ,warm-cyan
                                      :weight bold)
               (show-paren-match :background unspecified
                                 :foreground ,warm-cyan
                                 :weight bold)
               (show-paren-match-expression :inherit match)
               (show-paren-mismatch :inherit font-lock-warning-face)
               ;; slime
               (slime-repl-inputed-output-face :foreground ,warm-purple)
               ;; spam
               (spam :inherit gnus-summary-normal-read :foreground ,warm-orange
                     :strike-through t :slant oblique)
               ;; speedbar (and sr-speedbar)
               (speedbar-button-face :foreground ,warm-green)
               (speedbar-file-face :foreground ,warm-cyan)
               (speedbar-directory-face :foreground ,warm-purple)
               (speedbar-tag-face :foreground ,warm-yellow)
               (speedbar-selected-face :foreground ,warm-pink)
               (speedbar-highlight-face :inherit match)
               (speedbar-separator-face :background ,warm-bg
                                        :foreground ,warm-fg
                                        :weight bold)
               ;; tab-bar & tab-line (since Emacs 27.1)
               (tab-bar :foreground ,warm-purple :background ,warm-current
                        :inherit variable-pitch)
               (tab-bar-tab :foreground ,warm-pink :background ,warm-bg
                            :box (:line-width 2 :color ,warm-bg :style nil))
               (tab-bar-tab-inactive :foreground ,warm-purple :background ,bg2
                                     :box (:line-width 2 :color ,bg2 :style nil))
               (tab-line :foreground ,warm-purple :background ,warm-current
                         :height 0.9 :inherit variable-pitch)
               (tab-line-tab :foreground ,warm-pink :background ,warm-bg
                             :box (:line-width 2 :color ,warm-bg :style nil))
               (tab-line-tab-inactive :foreground ,warm-purple :background ,bg2
                                      :box (:line-width 2 :color ,bg2 :style nil))
               (tab-line-tab-current :inherit tab-line-tab)
               (tab-line-close-highlight :foreground ,warm-red)
               ;; term
               (term :foreground ,warm-fg :background ,warm-bg)
               (term-color-black :foreground ,warm-bg :background ,warm-comment)
               (term-color-blue :foreground ,warm-purple :background ,warm-purple)
               (term-color-cyan :foreground ,warm-cyan :background ,warm-cyan)
               (term-color-green :foreground ,warm-green :background ,warm-green)
               (term-color-magenta :foreground ,warm-pink :background ,warm-pink)
               (term-color-red :foreground ,warm-red :background ,warm-red)
               (term-color-white :foreground ,warm-fg :background ,warm-fg)
               (term-color-yellow :foreground ,warm-yellow :background ,warm-yellow)
               ;; undo-tree
               (undo-tree-visualizer-current-face :foreground ,warm-orange)
               (undo-tree-visualizer-default-face :foreground ,fg2)
               (undo-tree-visualizer-register-face :foreground ,warm-purple)
               (undo-tree-visualizer-unmodified-face :foreground ,warm-fg)
               ;; web-mode
               (web-mode-builtin-face :inherit font-lock-builtin-face)
               (web-mode-comment-face :inherit font-lock-comment-face)
               (web-mode-constant-face :inherit font-lock-constant-face)
               (web-mode-doctype-face :inherit font-lock-comment-face)
               (web-mode-function-name-face :inherit font-lock-function-name-face)
               (web-mode-html-attr-name-face :foreground ,warm-purple)
               (web-mode-html-attr-value-face :foreground ,warm-green)
               (web-mode-html-tag-face :foreground ,warm-pink :weight bold)
               (web-mode-keyword-face :foreground ,warm-pink)
               (web-mode-string-face :foreground ,warm-yellow)
               (web-mode-type-face :inherit font-lock-type-face)
               (web-mode-warning-face :inherit font-lock-warning-face)
               ;; which-func
               (which-func :inherit font-lock-function-name-face)
               ;; which-key
               (which-key-key-face :inherit font-lock-builtin-face)
               (which-key-command-description-face :inherit default)
               (which-key-separator-face :inherit font-lock-comment-delimiter-face)
               (which-key-local-map-description-face :foreground ,warm-green)
               ;; whitespace
               (whitespace-big-indent :background ,warm-red :foreground ,warm-red)
               (whitespace-empty :background ,warm-orange :foreground ,warm-red)
               (whitespace-hspace :background ,bg3 :foreground ,warm-comment)
               (whitespace-indentation :background ,warm-orange :foreground ,warm-red)
               (whitespace-line :background ,warm-bg :foreground ,warm-pink)
               (whitespace-newline :foreground ,warm-comment)
               (whitespace-space :background ,warm-bg :foreground ,warm-comment)
               (whitespace-space-after-tab :background ,warm-orange :foreground ,warm-red)
               (whitespace-space-before-tab :background ,warm-orange :foreground ,warm-red)
               (whitespace-tab :background ,bg2 :foreground ,warm-comment)
               (whitespace-trailing :inherit trailing-whitespace)
               ;; yard-mode
               (yard-tag-face :inherit font-lock-builtin-face)
               (yard-directive-face :inherit font-lock-builtin-face))))

  (apply #'custom-theme-set-faces
         'warm
         (let ((expand-with-func
                (lambda (func spec)
                  (when (and (eq func 'caddr)
                             warm-use-24-bit-colors-on-256-colors-terms)
                    (setq func 'cadr))
                  (let (reduced-color-list)
                    (eval `(let ,(dolist (col colors reduced-color-list)
                                   (push `(,(car col) ,(funcall func col))
                                         reduced-color-list))
                             (eval `(backquote ,spec)))))))
               whole-theme)
           (pcase-dolist (`(,face . ,spec) faces)
             (push `(,face
                     ((((min-colors 16777216)) ; fully graphical envs
                       ,(funcall expand-with-func 'cadr spec))
                      (((min-colors 256))      ; terminal withs 256 colors
                       ,(funcall expand-with-func 'caddr spec))
                      (t                       ; should be only tty-like envs
                       ,(funcall expand-with-func 'cadddr spec))))
                   whole-theme))
           whole-theme)))



;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'warm)

;; Local Variables:
;; no-byte-compile: t
;; indent-tabs-mode: nil
;; End:

;;; warm-theme.el ends here
