;;; pastel-theme.el --- Pastel Theme

;; Copyright 2015-present, All rights reserved
;;
;; Code licensed under the MIT license

;; Author: film42
;; Version: 1.7.0
;; Package-Requires: ((emacs "24.3"))
;; URL: https://github.com/pastel/emacs

;;; Commentary:

;; A dark color theme available for a number of editors.

;;; Code:
(deftheme pastel)


;;;; Configuration options:

(defgroup pastel nil
  "Pastel theme options.

The theme has to be reloaded after changing anything in this group."
  :group 'faces)

(defcustom pastel-enlarge-headings t
  "Use different font sizes for some headings and titles."
  :type 'boolean
  :group 'pastel)

(defcustom pastel-height-title-1 1.3
  "Font size 100%."
  :type 'number
  :group 'pastel)

(defcustom pastel-height-title-2 1.1
  "Font size 110%."
  :type 'number
  :group 'pastel)

(defcustom pastel-height-title-3 1.0
  "Font size 130%."
  :type 'number
  :group 'pastel)

(defcustom pastel-height-doc-title 1.44
  "Font size 144%."
  :type 'number
  :group 'pastel)

(defcustom pastel-alternate-mode-line-and-minibuffer nil
  "Use less bold and pink in the minibuffer."
  :type 'boolean
  :group 'pastel)

(defvar pastel-use-24-bit-colors-on-256-colors-terms nil
  "Use true colors even on terminals announcing less capabilities.

Beware the use of this variable.  Using it may lead to unwanted
behavior, the most common one being an ugly blue background on
terminals, which don't understand 24 bit colors.  To avoid this
blue background, when using this variable, one can try to add the
following lines in their config file after having load the
Pastel theme:

    (unless (display-graphic-p)
      (set-face-background 'default \"black\" nil))

There is a lot of discussion behind the 256 colors theme (see URL
`https://github.com/pastel/emacs/pull/57').  Please take time to
read it before opening a new issue about your will.")


;;;; Theme definition:

;; Assigment form: VARIABLE COLOR [256-COLOR [TTY-COLOR]]
(let ((colors '(;; Upstream theme color
                (pastel-bg      "#272a34" "unspecified-bg" "unspecified-bg") ; official background
                (pastel-fg      "#dcdbd7" "#ffffff" "brightwhite") ; official foreground
                (pastel-current "#44475a" "#303030" "brightblack") ; official current-line/selection
                (pastel-comment "#65a4cf" "#5f5faf" "blue")        ; official comment
                (pastel-cyan    "#6dcac0" "#87d7ff" "brightcyan")  ; official cyan
                (pastel-green   "#8dbc92" "#5fff87" "green")       ; official green
                (pastel-orange  "#dea981" "#ffaf5f" "brightred")   ; official orange
                (pastel-pink    "#d38da9" "#ff87d7" "magenta")     ; official pink
                (pastel-purple  "#ca9bf7" "#af87ff" "brightmagenta") ; official purple
                (pastel-red     "#db948e" "#ff8787" "red")         ; official red
                (pastel-yellow  "#e1d179" "#ffff87" "yellow")      ; official yellow
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
               (default :background ,pastel-bg :foreground ,pastel-fg)
               (default-italic :slant italic)
               (ffap :foreground ,fg4)
               (fringe :background ,pastel-bg :foreground ,fg4)
               (highlight :foreground ,fg3 :background ,bg3)
               (hl-line :background ,pastel-current :extend t)
               (info-quoted-name :foreground ,pastel-orange)
               (info-string :foreground ,pastel-yellow)
               (lazy-highlight :foreground ,fg2 :background ,bg2)
               (link :foreground ,pastel-cyan :underline t)
               (linum :slant italic :foreground ,bg4 :background ,pastel-bg)
               (line-number :slant italic :foreground ,bg4 :background ,pastel-bg)
               (match :background ,pastel-yellow :foreground ,pastel-bg)
               (minibuffer-prompt
                ,@(if pastel-alternate-mode-line-and-minibuffer
                      (list :weight 'normal :foreground pastel-fg)
                    (list :weight 'bold :foreground pastel-pink)))
               (read-multiple-choice-face :inherit completions-first-difference)
              ;; (region :inherit match :extend t)
               (region :background ,bg4)
               (shadow :foreground ,pastel-comment)
               (trailing-whitespace :foreground "unspecified-fg" :background ,pastel-orange)
               (vertical-border :foreground ,bg2)
               (success :foreground ,pastel-green)
               (warning :foreground ,pastel-orange)
               (error :foreground ,pastel-red)
               (header-line :background ,pastel-bg)
               ;; syntax
               (font-lock-builtin-face :foreground ,pastel-orange)
               (font-lock-comment-face :inherit shadow)
               (font-lock-comment-delimiter-face :inherit shadow)
               (font-lock-constant-face :foreground ,pastel-cyan)
               (font-lock-doc-face :foreground ,pastel-comment)
               (font-lock-function-name-face :foreground ,pastel-green :weight bold)
               (font-lock-keyword-face :foreground ,pastel-pink :weight bold)
               (font-lock-negation-char-face :foreground ,pastel-cyan)
               (font-lock-preprocessor-face :foreground ,pastel-orange)
               (font-lock-reference-face :foreground ,pastel-cyan)
               (font-lock-regexp-grouping-backslash :foreground ,pastel-cyan)
               (font-lock-regexp-grouping-construct :foreground ,pastel-purple)
               (font-lock-string-face :foreground ,pastel-yellow)
               (font-lock-type-face :foreground ,pastel-purple)
               (font-lock-variable-name-face :foreground ,pastel-fg :weight bold)
               (font-lock-warning-face :foreground ,pastel-orange :background ,bg2)
               ;; auto-complete
               (ac-completion-face :underline t :foreground ,pastel-pink)
               ;; company
               (company-echo-common :foreground ,pastel-bg :background ,pastel-fg)
               (company-preview :background ,pastel-current :foreground ,other-blue)
               (company-preview-common :inherit company-preview
                                       :foreground ,pastel-pink)
               (company-preview-search :inherit company-preview
                                       :foreground ,pastel-green)
               (company-scrollbar-bg :background ,pastel-comment)
               (company-scrollbar-fg :foreground ,other-blue)
               (company-tooltip :foreground ,pastel-fg :background ,pastel-current)
               (company-tooltip-search :foreground ,pastel-green
                                       :underline t)
               (company-tooltip-search-selection :background ,pastel-green
                                                 :foreground ,pastel-bg)
               (company-tooltip-selection :inherit match)
               (company-tooltip-mouse :background ,pastel-bg)
               (company-tooltip-common :foreground ,pastel-pink :weight bold)
               ;;(company-tooltip-common-selection :inherit company-tooltip-common)
               (company-tooltip-annotation :foreground ,pastel-cyan)
               ;;(company-tooltip-annotation-selection :inherit company-tooltip-annotation)
               ;; completions (minibuffer.el)
               (completions-annotations :inherit font-lock-comment-face)
               (completions-common-part :foreground ,pastel-green)
               (completions-first-difference :foreground ,pastel-pink :weight bold)
               ;; diff-hl
               (diff-hl-change :foreground ,pastel-orange :background ,pastel-orange)
               (diff-hl-delete :foreground ,pastel-red :background ,pastel-red)
               (diff-hl-insert :foreground ,pastel-green :background ,pastel-green)
               ;; dired
               (dired-directory :foreground ,pastel-green :weight normal)
               (dired-flagged :foreground ,pastel-pink)
               (dired-header :foreground ,fg3 :background ,pastel-bg)
               (dired-ignored :inherit shadow)
               (dired-mark :foreground ,pastel-fg :weight bold)
               (dired-marked :foreground ,pastel-orange :weight bold)
               (dired-perm-write :foreground ,fg3 :underline t)
               (dired-symlink :foreground ,pastel-yellow :weight normal :slant italic)
               (dired-warning :foreground ,pastel-orange :underline t)
               (diredp-compressed-file-name :foreground ,fg3)
               (diredp-compressed-file-suffix :foreground ,fg4)
               (diredp-date-time :foreground ,pastel-fg)
               (diredp-deletion-file-name :foreground ,pastel-pink :background ,pastel-current)
               (diredp-deletion :foreground ,pastel-pink :weight bold)
               (diredp-dir-heading :foreground ,fg2 :background ,bg4)
               (diredp-dir-name :inherit dired-directory)
               (diredp-dir-priv :inherit dired-directory)
               (diredp-executable-tag :foreground ,pastel-orange)
               (diredp-file-name :foreground ,pastel-fg)
               (diredp-file-suffix :foreground ,fg4)
               (diredp-flag-mark-line :foreground ,fg2 :slant italic :background ,pastel-current)
               (diredp-flag-mark :foreground ,fg2 :weight bold :background ,pastel-current)
               (diredp-ignored-file-name :foreground ,pastel-fg)
               (diredp-mode-line-flagged :foreground ,pastel-orange)
               (diredp-mode-line-marked :foreground ,pastel-orange)
               (diredp-no-priv :foreground ,pastel-fg)
               (diredp-number :foreground ,pastel-cyan)
               (diredp-other-priv :foreground ,pastel-orange)
               (diredp-rare-priv :foreground ,pastel-orange)
               (diredp-read-priv :foreground ,pastel-purple)
               (diredp-write-priv :foreground ,pastel-pink)
               (diredp-exec-priv :foreground ,pastel-yellow)
               (diredp-symlink :foreground ,pastel-orange)
               (diredp-link-priv :foreground ,pastel-orange)
               (diredp-autofile-name :foreground ,pastel-yellow)
               (diredp-tagged-autofile-name :foreground ,pastel-yellow)
               ;; elfeed
               (elfeed-search-date-face :foreground ,pastel-comment)
               (elfeed-search-title-face :foreground ,pastel-fg)
               (elfeed-search-unread-title-face :foreground ,pastel-pink :weight bold)
               (elfeed-search-feed-face :foreground ,pastel-fg :weight bold)
               (elfeed-search-tag-face :foreground ,pastel-green)
               (elfeed-search-last-update-face :weight bold)
               (elfeed-search-unread-count-face :foreground ,pastel-pink)
               (elfeed-search-filter-face :foreground ,pastel-green :weight bold)
               ;;(elfeed-log-date-face :inherit font-lock-type-face)
               (elfeed-log-error-level-face :foreground ,pastel-red)
               (elfeed-log-warn-level-face :foreground ,pastel-orange)
               (elfeed-log-info-level-face :foreground ,pastel-cyan)
               (elfeed-log-debug-level-face :foreground ,pastel-comment)
               ;; elpher
               (elpher-gemini-heading1 :inherit bold :foreground ,pastel-pink
                                       ,@(when pastel-enlarge-headings
                                           (list :height pastel-height-title-1)))
               (elpher-gemini-heading2 :inherit bold :foreground ,pastel-purple
                                       ,@(when pastel-enlarge-headings
                                           (list :height pastel-height-title-2)))
               (elpher-gemini-heading3 :weight normal :foreground ,pastel-green
                                       ,@(when pastel-enlarge-headings
                                           (list :height pastel-height-title-3)))
               (elpher-gemini-preformatted :inherit fixed-pitch
                                           :foreground ,pastel-orange)
               ;; enh-ruby
               (enh-ruby-heredoc-delimiter-face :foreground ,pastel-yellow)
               (enh-ruby-op-face :foreground ,pastel-pink)
               (enh-ruby-regexp-delimiter-face :foreground ,pastel-yellow)
               (enh-ruby-string-delimiter-face :foreground ,pastel-yellow)
               ;; flyspell
               (flyspell-duplicate :underline (:style wave :color ,pastel-orange))
               (flyspell-incorrect :underline (:style wave :color ,pastel-red))
               ;; font-latex
               (font-latex-bold-face :foreground ,pastel-purple)
               (font-latex-italic-face :foreground ,pastel-pink :slant italic)
               (font-latex-match-reference-keywords :foreground ,pastel-cyan)
               (font-latex-match-variable-keywords :foreground ,pastel-fg)
               (font-latex-string-face :foreground ,pastel-yellow)
               ;; gemini
               (gemini-heading-face-1 :inherit bold :foreground ,pastel-pink
                                      ,@(when pastel-enlarge-headings
                                          (list :height pastel-height-title-1)))
               (gemini-heading-face-2 :inherit bold :foreground ,pastel-purple
                                      ,@(when pastel-enlarge-headings
                                          (list :height pastel-height-title-2)))
               (gemini-heading-face-3 :weight normal :foreground ,pastel-green
                                      ,@(when pastel-enlarge-headings
                                          (list :height pastel-height-title-3)))
               (gemini-heading-face-rest :weight normal :foreground ,pastel-yellow)
               (gemini-quote-face :foreground ,pastel-purple)
               ;; gnus-group
               (gnus-group-mail-1 :foreground ,pastel-pink :weight bold)
               (gnus-group-mail-1-empty :inherit gnus-group-mail-1 :weight normal)
               (gnus-group-mail-2 :foreground ,pastel-cyan :weight bold)
               (gnus-group-mail-2-empty :inherit gnus-group-mail-2 :weight normal)
               (gnus-group-mail-3 :foreground ,pastel-comment :weight bold)
               (gnus-group-mail-3-empty :inherit gnus-group-mail-3 :weight normal)
               (gnus-group-mail-low :foreground ,pastel-current :weight bold)
               (gnus-group-mail-low-empty :inherit gnus-group-mail-low :weight normal)
               (gnus-group-news-1 :foreground ,pastel-pink :weight bold)
               (gnus-group-news-1-empty :inherit gnus-group-news-1 :weight normal)
               (gnus-group-news-2 :foreground ,pastel-cyan :weight bold)
               (gnus-group-news-2-empty :inherit gnus-group-news-2 :weight normal)
               (gnus-group-news-3 :foreground ,pastel-comment :weight bold)
               (gnus-group-news-3-empty :inherit gnus-group-news-3 :weight normal)
               (gnus-group-news-4 :inherit gnus-group-news-low)
               (gnus-group-news-4-empty :inherit gnus-group-news-low-empty)
               (gnus-group-news-5 :inherit gnus-group-news-low)
               (gnus-group-news-5-empty :inherit gnus-group-news-low-empty)
               (gnus-group-news-6 :inherit gnus-group-news-low)
               (gnus-group-news-6-empty :inherit gnus-group-news-low-empty)
               (gnus-group-news-low :foreground ,pastel-current :weight bold)
               (gnus-group-news-low-empty :inherit gnus-group-news-low :weight normal)
               (gnus-header-content :foreground ,pastel-pink)
               (gnus-header-from :foreground ,pastel-fg)
               (gnus-header-name :foreground ,pastel-purple)
               (gnus-header-subject :foreground ,pastel-green :weight bold)
               (gnus-summary-markup-face :foreground ,pastel-cyan)
               (gnus-summary-high-unread :foreground ,pastel-pink :weight bold)
               (gnus-summary-high-read :inherit gnus-summary-high-unread :weight normal)
               (gnus-summary-high-ancient :inherit gnus-summary-high-read)
               (gnus-summary-high-ticked :inherit gnus-summary-high-read :underline t)
               (gnus-summary-normal-unread :foreground ,other-blue :weight bold)
               (gnus-summary-normal-read :foreground ,pastel-comment :weight normal)
               (gnus-summary-normal-ancient :inherit gnus-summary-normal-read :weight light)
               (gnus-summary-normal-ticked :foreground ,pastel-pink :weight bold)
               (gnus-summary-low-unread :foreground ,pastel-comment :weight bold)
               (gnus-summary-low-read :inherit gnus-summary-low-unread :weight normal)
               (gnus-summary-low-ancient :inherit gnus-summary-low-read)
               (gnus-summary-low-ticked :inherit gnus-summary-low-read :underline t)
               (gnus-summary-selected :inverse-video t)
               ;; haskell-mode
               (haskell-operator-face :foreground ,pastel-pink)
               (haskell-constructor-face :foreground ,pastel-purple)
               ;; helm
               (helm-bookmark-w3m :foreground ,pastel-purple)
               (helm-buffer-not-saved :foreground ,pastel-purple :background ,pastel-bg)
               (helm-buffer-process :foreground ,pastel-orange :background ,pastel-bg)
               (helm-buffer-saved-out :foreground ,pastel-fg :background ,pastel-bg)
               (helm-buffer-size :foreground ,pastel-fg :background ,pastel-bg)
               (helm-candidate-number :foreground ,pastel-bg :background ,pastel-fg)
               (helm-ff-directory :foreground ,pastel-green :background ,pastel-bg :weight bold)
               (helm-ff-dotted-directory :foreground ,pastel-green :background ,pastel-bg :weight normal)
               (helm-ff-executable :foreground ,other-blue :background ,pastel-bg :weight normal)
               (helm-ff-file :foreground ,pastel-fg :background ,pastel-bg :weight normal)
               (helm-ff-invalid-symlink :foreground ,pastel-pink :background ,pastel-bg :weight bold)
               (helm-ff-prefix :foreground ,pastel-bg :background ,pastel-pink :weight normal)
               (helm-ff-symlink :foreground ,pastel-pink :background ,pastel-bg :weight bold)
               (helm-grep-cmd-line :foreground ,pastel-fg :background ,pastel-bg)
               (helm-grep-file :foreground ,pastel-fg :background ,pastel-bg)
               (helm-grep-finish :foreground ,fg2 :background ,pastel-bg)
               (helm-grep-lineno :foreground ,pastel-fg :background ,pastel-bg)
               (helm-grep-match :foreground "unspecified-fg" :background "unspecified-bg" :inherit helm-match)
               (helm-grep-running :foreground ,pastel-green :background ,pastel-bg)
               (helm-header :foreground ,fg2 :background ,pastel-bg :underline nil :box nil)
               (helm-moccur-buffer :foreground ,pastel-green :background ,pastel-bg)
               (helm-selection :background ,bg2 :underline nil)
               (helm-selection-line :background ,bg2)
               (helm-separator :foreground ,pastel-purple :background ,pastel-bg)
               (helm-source-go-package-godoc-description :foreground ,pastel-yellow)
               (helm-source-header :foreground ,pastel-pink :background ,pastel-bg :underline nil :weight bold)
               (helm-time-zone-current :foreground ,pastel-orange :background ,pastel-bg)
               (helm-time-zone-home :foreground ,pastel-purple :background ,pastel-bg)
               (helm-visible-mark :foreground ,pastel-bg :background ,bg3)
               ;; highlight-indentation minor mode
               (highlight-indentation-face :background ,bg2)
               ;; icicle
               (icicle-whitespace-highlight :background ,pastel-fg)
               (icicle-special-candidate :foreground ,fg2)
               (icicle-extra-candidate :foreground ,fg2)
               (icicle-search-main-regexp-others :foreground ,pastel-fg)
               (icicle-search-current-input :foreground ,pastel-pink)
               (icicle-search-context-level-8 :foreground ,pastel-orange)
               (icicle-search-context-level-7 :foreground ,pastel-orange)
               (icicle-search-context-level-6 :foreground ,pastel-orange)
               (icicle-search-context-level-5 :foreground ,pastel-orange)
               (icicle-search-context-level-4 :foreground ,pastel-orange)
               (icicle-search-context-level-3 :foreground ,pastel-orange)
               (icicle-search-context-level-2 :foreground ,pastel-orange)
               (icicle-search-context-level-1 :foreground ,pastel-orange)
               (icicle-search-main-regexp-current :foreground ,pastel-fg)
               (icicle-saved-candidate :foreground ,pastel-fg)
               (icicle-proxy-candidate :foreground ,pastel-fg)
               (icicle-mustmatch-completion :foreground ,pastel-purple)
               (icicle-multi-command-completion :foreground ,fg2 :background ,bg2)
               (icicle-msg-emphasis :foreground ,pastel-green)
               (icicle-mode-line-help :foreground ,fg4)
               (icicle-match-highlight-minibuffer :foreground ,pastel-orange)
               (icicle-match-highlight-Completions :foreground ,pastel-green)
               (icicle-key-complete-menu-local :foreground ,pastel-fg)
               (icicle-key-complete-menu :foreground ,pastel-fg)
               (icicle-input-completion-fail-lax :foreground ,pastel-pink)
               (icicle-input-completion-fail :foreground ,pastel-pink)
               (icicle-historical-candidate-other :foreground ,pastel-fg)
               (icicle-historical-candidate :foreground ,pastel-fg)
               (icicle-current-candidate-highlight :foreground ,pastel-orange :background ,bg3)
               (icicle-Completions-instruction-2 :foreground ,fg4)
               (icicle-Completions-instruction-1 :foreground ,fg4)
               (icicle-completion :foreground ,pastel-fg)
               (icicle-complete-input :foreground ,pastel-orange)
               (icicle-common-match-highlight-Completions :foreground ,pastel-purple)
               (icicle-candidate-part :foreground ,pastel-fg)
               (icicle-annotation :foreground ,fg4)
               ;; icomplete
               (icompletep-determined :foreground ,pastel-orange)
               ;; ido
               (ido-first-match
                ,@(if pastel-alternate-mode-line-and-minibuffer
                      (list :weight 'normal :foreground pastel-green)
                    (list :weight 'bold :foreground pastel-pink)))
               (ido-only-match :foreground ,pastel-orange)
               (ido-subdir :foreground ,pastel-yellow)
               (ido-virtual :foreground ,pastel-cyan)
               (ido-incomplete-regexp :inherit font-lock-warning-face)
               (ido-indicator :foreground ,pastel-fg :background ,pastel-pink)
               ;; ivy
               (ivy-current-match
                ,@(if pastel-alternate-mode-line-and-minibuffer
                      (list :weight 'normal :foreground pastel-green)
                    (list :weight 'bold :foreground pastel-pink)))
               ;; Highlights the background of the match.
               (ivy-minibuffer-match-face-1 :background ,pastel-current)
               ;; Highlights the first matched group.
               (ivy-minibuffer-match-face-2 :background ,pastel-green
                                            :foreground ,pastel-bg)
               ;; Highlights the second matched group.
               (ivy-minibuffer-match-face-3 :background ,pastel-yellow
                                            :foreground ,pastel-bg)
               ;; Highlights the third matched group.
               (ivy-minibuffer-match-face-4 :background ,pastel-pink
                                            :foreground ,pastel-bg)
               (ivy-confirm-face :foreground ,pastel-orange)
               (ivy-match-required-face :foreground ,pastel-red)
               (ivy-subdir :foreground ,pastel-yellow)
               (ivy-remote :foreground ,pastel-pink)
               (ivy-virtual :foreground ,pastel-cyan)
               ;; isearch
               (isearch :inherit match :weight bold)
               (isearch-fail :foreground ,pastel-bg :background ,pastel-orange)
               ;; jde-java
               (jde-java-font-lock-constant-face :foreground ,pastel-cyan)
               (jde-java-font-lock-modifier-face :foreground ,pastel-pink)
               (jde-java-font-lock-number-face :foreground ,pastel-fg)
               (jde-java-font-lock-package-face :foreground ,pastel-fg)
               (jde-java-font-lock-private-face :foreground ,pastel-pink)
               (jde-java-font-lock-public-face :foreground ,pastel-pink)
               ;; js2-mode
               (js2-external-variable :foreground ,pastel-purple)
               (js2-function-param :foreground ,pastel-cyan)
               (js2-jsdoc-html-tag-delimiter :foreground ,pastel-yellow)
               (js2-jsdoc-html-tag-name :foreground ,other-blue)
               (js2-jsdoc-value :foreground ,pastel-yellow)
               (js2-private-function-call :foreground ,pastel-cyan)
               (js2-private-member :foreground ,fg3)
               ;; js3-mode
               (js3-error-face :underline ,pastel-orange)
               (js3-external-variable-face :foreground ,pastel-fg)
               (js3-function-param-face :foreground ,pastel-pink)
               (js3-instance-member-face :foreground ,pastel-cyan)
               (js3-jsdoc-tag-face :foreground ,pastel-pink)
               (js3-warning-face :underline ,pastel-pink)
               ;; lsp
               (lsp-ui-peek-peek :background ,pastel-bg)
               (lsp-ui-peek-list :background ,bg2)
               (lsp-ui-peek-filename :foreground ,pastel-pink :weight bold)
               (lsp-ui-peek-line-number :foreground ,pastel-fg)
               (lsp-ui-peek-highlight :inherit highlight :distant-foreground ,pastel-bg)
               (lsp-ui-peek-header :background ,bg3 :foreground ,fg3, :weight bold)
               (lsp-ui-peek-footer :inherit lsp-ui-peek-header)
               (lsp-ui-peek-selection :inherit match)
               (lsp-ui-sideline-symbol :foreground ,fg4 :box (:line-width -1 :color ,fg4) :height 0.99)
               (lsp-ui-sideline-current-symbol :foreground ,pastel-fg :weight ultra-bold
                                               :box (:line-width -1 :color pastel-fg) :height 0.99)
               (lsp-ui-sideline-code-action :foreground ,pastel-yellow)
               (lsp-ui-sideline-symbol-info :slant italic :height 0.99)
               (lsp-ui-doc-background :background ,pastel-bg)
               (lsp-ui-doc-header :foreground ,pastel-bg :background ,pastel-cyan)
               ;; magit
               (magit-branch-local :foreground ,pastel-cyan)
               (magit-branch-remote :foreground ,pastel-green)
               (magit-tag :foreground ,pastel-orange)
               (magit-section-heading :foreground ,pastel-pink :weight bold)
               (magit-section-highlight :background ,bg3 :extend t)
               (magit-diff-context-highlight :background ,bg3
                                             :foreground ,fg3
                                             :extend t)
               (magit-diff-revision-summary :foreground ,pastel-orange
                                            :background ,pastel-bg
                                            :weight bold)
               (magit-diff-revision-summary-highlight :foreground ,pastel-orange
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
               (magit-diff-file-heading :foreground ,pastel-fg)
               (magit-diff-file-heading-highlight :inherit magit-section-highlight)
               (magit-diffstat-added :foreground ,pastel-green)
               (magit-diffstat-removed :foreground ,pastel-red)
               (magit-hash :foreground ,fg2)
               (magit-hunk-heading :background ,bg3)
               (magit-hunk-heading-highlight :background ,bg3)
               (magit-item-highlight :background ,bg3)
               (magit-log-author :foreground ,fg3)
               (magit-process-ng :foreground ,pastel-orange :weight bold)
               (magit-process-ok :foreground ,pastel-green :weight bold)
               ;; markdown
               (markdown-blockquote-face :foreground ,pastel-purple)
               (markdown-code-face :foreground ,pastel-orange)
               (markdown-footnote-face :foreground ,other-blue)
               (markdown-header-face :weight normal)
               (markdown-header-face-1
                :inherit bold :foreground ,pastel-pink
                ,@(when pastel-enlarge-headings
                    (list :height pastel-height-title-1)))
               (markdown-header-face-2
                :inherit bold :foreground ,pastel-purple
                ,@(when pastel-enlarge-headings
                    (list :height pastel-height-title-2)))
               (markdown-header-face-3
                :foreground ,pastel-green
                ,@(when pastel-enlarge-headings
                    (list :height pastel-height-title-3)))
               (markdown-header-face-4 :foreground ,pastel-yellow)
               (markdown-header-face-5 :foreground ,pastel-cyan)
               (markdown-header-face-6 :foreground ,pastel-orange)
               (markdown-header-face-7 :foreground ,other-blue)
               (markdown-header-face-8 :foreground ,pastel-fg)
               (markdown-inline-code-face :foreground ,pastel-yellow)
               (markdown-plain-url-face :inherit link)
               (markdown-pre-face :foreground ,pastel-orange)
               (markdown-table-face :foreground ,pastel-purple)
               ;; message
               (message-header-to :foreground ,pastel-fg :weight bold)
               (message-header-cc :foreground ,pastel-fg :bold bold)
               (message-header-subject :foreground ,pastel-orange)
               (message-header-newsgroups :foreground ,pastel-purple)
               (message-header-other :foreground ,pastel-purple)
               (message-header-name :foreground ,pastel-green)
               (message-header-xheader :foreground ,pastel-cyan)
               (message-separator :foreground ,pastel-cyan :slant italic)
               (message-cited-text :foreground ,pastel-purple)
               (message-cited-text-1 :foreground ,pastel-purple)
               (message-cited-text-2 :foreground ,pastel-orange)
               (message-cited-text-3 :foreground ,pastel-comment)
               (message-cited-text-4 :foreground ,fg2)
               (message-mml :foreground ,pastel-green :weight normal)
               ;; mode-line
               (mode-line :background ,pastel-current
                          :box ,pastel-current :inverse-video nil
                          ,@(if pastel-alternate-mode-line-and-minibuffer
                                (list :foreground fg3)
                              (list :foreground "unspecified-fg")))
               (mode-line-inactive
                :inverse-video nil
                ,@(if pastel-alternate-mode-line-and-minibuffer
                      (list :foreground pastel-comment :background pastel-bg
                            :box pastel-bg)
                    (list :foreground pastel-fg :background bg2 :box bg2)))
               ;; mu4e
               (mu4e-unread-face :foreground ,pastel-pink :weight normal)
               (mu4e-view-url-number-face :foreground ,pastel-purple)
               (mu4e-highlight-face :background ,pastel-bg
                                    :foreground ,pastel-yellow
                                    :extend t)
               (mu4e-header-highlight-face :background ,pastel-current
                                           :foreground ,pastel-fg
                                           :underline nil :weight bold
                                           :extend t)
               (mu4e-header-key-face :inherit message-mml)
               (mu4e-header-marks-face :foreground ,pastel-purple)
               (mu4e-cited-1-face :foreground ,pastel-purple)
               (mu4e-cited-2-face :foreground ,pastel-orange)
               (mu4e-cited-3-face :foreground ,pastel-comment)
               (mu4e-cited-4-face :foreground ,fg2)
               (mu4e-cited-5-face :foreground ,fg3)
               ;; neotree
               (neo-banner-face :foreground ,pastel-orange :weight bold)
               ;;(neo-button-face :underline nil)
               (neo-dir-link-face :foreground ,pastel-purple)
               (neo-expand-btn-face :foreground ,pastel-fg)
               (neo-file-link-face :foreground ,pastel-cyan)
               (neo-header-face :background ,pastel-bg
                                :foreground ,pastel-fg
                                :weight bold)
               (neo-root-dir-face :foreground ,pastel-purple :weight bold)
               (neo-vc-added-face :foreground ,pastel-orange)
               (neo-vc-conflict-face :foreground ,pastel-red)
               (neo-vc-default-face :inherit neo-file-link-face)
               (neo-vc-edited-face :foreground ,pastel-orange)
               (neo-vc-ignored-face :foreground ,pastel-comment)
               (neo-vc-missing-face :foreground ,pastel-red)
               (neo-vc-needs-merge-face :foreground ,pastel-red
                                        :weight bold)
               ;;(neo-vc-needs-update-face :underline t)
               ;;(neo-vc-removed-face :strike-through t)
               (neo-vc-unlocked-changes-face :foreground ,pastel-red)
               ;;(neo-vc-unregistered-face nil)
               (neo-vc-up-to-date-face :foreground ,pastel-green)
               (neo-vc-user-face :foreground ,pastel-purple)
               ;; org
               (org-agenda-date :foreground ,pastel-cyan :underline nil)
               (org-agenda-dimmed-todo-face :foreground ,pastel-comment)
               (org-agenda-done :foreground ,pastel-green)
               (org-agenda-structure :foreground ,pastel-purple)
               (org-block :foreground ,pastel-orange)
               (org-code :foreground ,pastel-yellow)
               (org-column :background ,bg4)
               (org-column-title :inherit org-column :weight bold :underline t)
               (org-date :foreground ,pastel-cyan :underline t)
               (org-document-info :foreground ,other-blue)
               (org-document-info-keyword :foreground ,pastel-comment)
               (org-document-title :weight bold :foreground ,pastel-orange
                                   ,@(when pastel-enlarge-headings
                                       (list :height pastel-height-doc-title)))
               (org-done :foreground ,pastel-green)
               (org-ellipsis :foreground ,pastel-comment)
               (org-footnote :foreground ,other-blue)
               (org-formula :foreground ,pastel-pink)
               (org-headline-done :foreground ,pastel-comment
                                  :weight normal :strike-through t)
               (org-hide :foreground ,pastel-bg :background ,pastel-bg)
               (org-level-1 :inherit bold :foreground ,pastel-pink
                            ,@(when pastel-enlarge-headings
                                (list :height pastel-height-title-1)))
               (org-level-2 :inherit bold :foreground ,pastel-purple
                            ,@(when pastel-enlarge-headings
                                (list :height pastel-height-title-2)))
               (org-level-3 :weight normal :foreground ,pastel-green
                            ,@(when pastel-enlarge-headings
                                (list :height pastel-height-title-3)))
               (org-level-4 :weight normal :foreground ,pastel-yellow)
               (org-level-5 :weight normal :foreground ,pastel-cyan)
               (org-level-6 :weight normal :foreground ,pastel-orange)
               (org-level-7 :weight normal :foreground ,other-blue)
               (org-level-8 :weight normal :foreground ,pastel-fg)
               (org-link :foreground ,pastel-cyan :underline t)
               (org-priority :foreground ,pastel-cyan)
               (org-scheduled :foreground ,pastel-green)
               (org-scheduled-previously :foreground ,pastel-yellow)
               (org-scheduled-today :foreground ,pastel-green)
               (org-sexp-date :foreground ,fg4)
               (org-special-keyword :foreground ,pastel-yellow)
               (org-table :foreground ,pastel-purple)
               (org-tag :foreground ,pastel-pink :weight bold :background ,bg2)
               (org-todo :foreground ,pastel-orange :weight bold :background ,bg2)
               (org-upcoming-deadline :foreground ,pastel-yellow)
               (org-warning :weight bold :foreground ,pastel-pink)
               ;; outline
               (outline-1 :foreground ,pastel-pink)
               (outline-2 :foreground ,pastel-purple)
               (outline-3 :foreground ,pastel-green)
               (outline-4 :foreground ,pastel-yellow)
               (outline-5 :foreground ,pastel-cyan)
               (outline-6 :foreground ,pastel-orange)
               ;; powerline
               (powerline-active1 :background ,pastel-bg :foreground ,pastel-pink)
               (powerline-active2 :background ,pastel-bg :foreground ,pastel-pink)
               (powerline-inactive1 :background ,bg2 :foreground ,pastel-purple)
               (powerline-inactive2 :background ,bg2 :foreground ,pastel-purple)
               (powerline-evil-base-face :foreground ,bg2)
               (powerline-evil-emacs-face :inherit powerline-evil-base-face :background ,pastel-yellow)
               (powerline-evil-insert-face :inherit powerline-evil-base-face :background ,pastel-cyan)
               (powerline-evil-motion-face :inherit powerline-evil-base-face :background ,pastel-purple)
               (powerline-evil-normal-face :inherit powerline-evil-base-face :background ,pastel-green)
               (powerline-evil-operator-face :inherit powerline-evil-base-face :background ,pastel-pink)
               (powerline-evil-replace-face :inherit powerline-evil-base-face :background ,pastel-red)
               (powerline-evil-visual-face :inherit powerline-evil-base-face :background ,pastel-orange)
               ;; rainbow-delimiters
               (rainbow-delimiters-depth-1-face :foreground ,pastel-fg)
               (rainbow-delimiters-depth-2-face :foreground ,pastel-cyan)
               (rainbow-delimiters-depth-3-face :foreground ,pastel-purple)
               (rainbow-delimiters-depth-4-face :foreground ,pastel-pink)
               (rainbow-delimiters-depth-5-face :foreground ,pastel-orange)
               (rainbow-delimiters-depth-6-face :foreground ,pastel-green)
               (rainbow-delimiters-depth-7-face :foreground ,pastel-yellow)
               (rainbow-delimiters-depth-8-face :foreground ,other-blue)
               (rainbow-delimiters-unmatched-face :foreground ,pastel-orange)
               ;; rpm-spec
               (rpm-spec-dir-face :foreground ,pastel-green)
               (rpm-spec-doc-face :foreground ,pastel-pink)
               (rpm-spec-ghost-face :foreground ,pastel-purple)
               (rpm-spec-macro-face :foreground ,pastel-yellow)
               (rpm-spec-obsolete-tag-face :inherit font-lock-warning-face)
               (rpm-spec-package-face :foreground ,pastel-purple)
               (rpm-spec-section-face :foreground ,pastel-yellow)
               (rpm-spec-tag-face :foreground ,pastel-cyan)
               (rpm-spec-var-face :foreground ,pastel-orange)
               ;; selectrum-mode
               (selectrum-current-candidate :weight bold)
               (selectrum-primary-highlight :foreground ,pastel-pink)
               (selectrum-secondary-highlight :foreground ,pastel-green)
               ;; show-paren
               (show-paren-match-face :background unspecified
                                      :foreground ,pastel-cyan
                                      :weight bold)
               (show-paren-match :background unspecified
                                 :foreground ,pastel-cyan
                                 :weight bold)
               (show-paren-match-expression :inherit match)
               (show-paren-mismatch :inherit font-lock-warning-face)
               ;; slime
               (slime-repl-inputed-output-face :foreground ,pastel-purple)
               ;; spam
               (spam :inherit gnus-summary-normal-read :foreground ,pastel-orange
                     :strike-through t :slant oblique)
               ;; speedbar (and sr-speedbar)
               (speedbar-button-face :foreground ,pastel-green)
               (speedbar-file-face :foreground ,pastel-cyan)
               (speedbar-directory-face :foreground ,pastel-purple)
               (speedbar-tag-face :foreground ,pastel-yellow)
               (speedbar-selected-face :foreground ,pastel-pink)
               (speedbar-highlight-face :inherit match)
               (speedbar-separator-face :background ,pastel-bg
                                        :foreground ,pastel-fg
                                        :weight bold)
               ;; tab-bar & tab-line (since Emacs 27.1)
               (tab-bar :foreground ,pastel-purple :background ,pastel-current
                        :inherit variable-pitch)
               (tab-bar-tab :foreground ,pastel-pink :background ,pastel-bg
                            :box (:line-width 2 :color ,pastel-bg :style nil))
               (tab-bar-tab-inactive :foreground ,pastel-purple :background ,bg2
                                     :box (:line-width 2 :color ,bg2 :style nil))
               (tab-line :foreground ,pastel-purple :background ,pastel-current
                         :height 0.9 :inherit variable-pitch)
               (tab-line-tab :foreground ,pastel-pink :background ,pastel-bg
                             :box (:line-width 2 :color ,pastel-bg :style nil))
               (tab-line-tab-inactive :foreground ,pastel-purple :background ,bg2
                                      :box (:line-width 2 :color ,bg2 :style nil))
               (tab-line-tab-current :inherit tab-line-tab)
               (tab-line-close-highlight :foreground ,pastel-red)
               ;; term
               (term :foreground ,pastel-fg :background ,pastel-bg)
               (term-color-black :foreground ,pastel-bg :background ,pastel-comment)
               (term-color-blue :foreground ,pastel-purple :background ,pastel-purple)
               (term-color-cyan :foreground ,pastel-cyan :background ,pastel-cyan)
               (term-color-green :foreground ,pastel-green :background ,pastel-green)
               (term-color-magenta :foreground ,pastel-pink :background ,pastel-pink)
               (term-color-red :foreground ,pastel-red :background ,pastel-red)
               (term-color-white :foreground ,pastel-fg :background ,pastel-fg)
               (term-color-yellow :foreground ,pastel-yellow :background ,pastel-yellow)
               ;; undo-tree
               (undo-tree-visualizer-current-face :foreground ,pastel-orange)
               (undo-tree-visualizer-default-face :foreground ,fg2)
               (undo-tree-visualizer-register-face :foreground ,pastel-purple)
               (undo-tree-visualizer-unmodified-face :foreground ,pastel-fg)
               ;; web-mode
               (web-mode-builtin-face :inherit font-lock-builtin-face)
               (web-mode-comment-face :inherit font-lock-comment-face)
               (web-mode-constant-face :inherit font-lock-constant-face)
               (web-mode-doctype-face :inherit font-lock-comment-face)
               (web-mode-function-name-face :inherit font-lock-function-name-face)
               (web-mode-html-attr-name-face :foreground ,pastel-purple)
               (web-mode-html-attr-value-face :foreground ,pastel-green)
               (web-mode-html-tag-face :foreground ,pastel-pink :weight bold)
               (web-mode-keyword-face :foreground ,pastel-pink)
               (web-mode-string-face :foreground ,pastel-yellow)
               (web-mode-type-face :inherit font-lock-type-face)
               (web-mode-warning-face :inherit font-lock-warning-face)
               ;; which-func
               (which-func :inherit font-lock-function-name-face)
               ;; which-key
               (which-key-key-face :inherit font-lock-builtin-face)
               (which-key-command-description-face :inherit default)
               (which-key-separator-face :inherit font-lock-comment-delimiter-face)
               (which-key-local-map-description-face :foreground ,pastel-green)
               ;; whitespace
               (whitespace-big-indent :background ,pastel-red :foreground ,pastel-red)
               (whitespace-empty :background ,pastel-orange :foreground ,pastel-red)
               (whitespace-hspace :background ,bg3 :foreground ,pastel-comment)
               (whitespace-indentation :background ,pastel-orange :foreground ,pastel-red)
               (whitespace-line :background ,pastel-bg :foreground ,pastel-pink)
               (whitespace-newline :foreground ,pastel-comment)
               (whitespace-space :background ,pastel-bg :foreground ,pastel-comment)
               (whitespace-space-after-tab :background ,pastel-orange :foreground ,pastel-red)
               (whitespace-space-before-tab :background ,pastel-orange :foreground ,pastel-red)
               (whitespace-tab :background ,bg2 :foreground ,pastel-comment)
               (whitespace-trailing :inherit trailing-whitespace)
               ;; yard-mode
               (yard-tag-face :inherit font-lock-builtin-face)
               (yard-directive-face :inherit font-lock-builtin-face))))

  (apply #'custom-theme-set-faces
         'pastel
         (let ((expand-with-func
                (lambda (func spec)
                  (when (and (eq func 'caddr)
                             pastel-use-24-bit-colors-on-256-colors-terms)
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

(provide-theme 'pastel)

;; Local Variables:
;; no-byte-compile: t
;; indent-tabs-mode: nil
;; End:

;;; pastel-theme.el ends here
