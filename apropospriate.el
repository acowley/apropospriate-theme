;;; apropospriate.el --- A light & dark theme set for Emacs.

;; Copyright (C) 2015 Justin Talbott

;; Author: Justin Talbott <justin@waymondo.com>
;; URL: http://github.com/waymondo/apropospriate-theme
;; Version: 0.0.1

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; A light & dark theme set for Emacs.

;;; Code:

(require 'color)

(defun create-apropospriate-theme (variant theme-name)
  "Create a VARIANT of the theme named THEME-NAME."
  (let* ((class '((class color) (min-colors 89)))
         (base00   (if (eq variant 'light) "#FAFAFA" "#424242"))
         (base01   (if (eq variant 'light) "#90A4AE" "#757575"))
         (base02   (if (eq variant 'light) "#78909C" "#9E9E9E"))
         (base03   (if (eq variant 'light) "#546E7A" "#E0E0E0"))
         (yellow   (if (eq variant 'light) "#FFA000" "#FFEE58"))
         (yellow-1 (if (eq variant 'light) "#FFD600" "#FFF59D"))
         (brown    (if (eq variant 'light) "#4E342E" "#BCAAA4"))
         (brown-1  (if (eq variant 'light) "#6D4C41" "#D7CCC8"))
         (orange   (if (eq variant 'light) "#D84315" "#FFCC80"))
         (orange-1 (if (eq variant 'light) "#FF5722" "#FFA726"))
         (red      (if (eq variant 'light) "#D50000" "#E57373"))
         (red-1    (if (eq variant 'light) "#FF1744" "#EF9A9A"))
         (pink     (if (eq variant 'light) "#F8BBD0" "#F8BBD0"))
         (pink-1   (if (eq variant 'light) "#EC407A" "#FF80AB"))
         (purple   (if (eq variant 'light) "#7E57C2" "#E1BEE7"))
         (purple-1 (if (eq variant 'light) "#B388FF" "#9575CD"))
         (blue     (if (eq variant 'light) "#42A5F5" "#64B5F6"))
         (blue-1   (if (eq variant 'light) "#1E88E5" "#42A5F5"))
         (indigo   (if (eq variant 'light) "#5C6BC0" "#C5CAE9"))
         (indigo-1 (if (eq variant 'light) "#9FA8DA" "#7986CB"))
         (cyan     (if (eq variant 'light) "#0097A7" "#80DEEA"))
         (cyan-1   (if (eq variant 'light) "#00B8D4" "#26C6DA"))
         (teal     (if (eq variant 'light) "#26A69A" "#80CBC4"))
         (teal-1   (if (eq variant 'light) "#00897B" "#4DB6AC"))
         (green    (if (eq variant 'light) "#66BB6A" "#C5E1A5"))
         (green-1  (if (eq variant 'light) "#558B2F" "#F4FF81"))
         (base00-1 (if (eq variant 'light)
                       (color-lighten-name base00 3)
                     (color-darken-name base00 3)))
         (base00-2 (if (eq variant 'light)
                       (color-lighten-name base00 5)
                     (color-darken-name base00 5)))
         (base00-3 (if (eq variant 'light)
                       (color-lighten-name base00 10)
                     (color-darken-name base00 10)))
         (base00+1 (if (eq variant 'light)
                       (color-darken-name base00 3)
                     (color-lighten-name base00 3)))
         (base00+2 (if (eq variant 'light)
                       (color-darken-name base00 5)
                     (color-lighten-name base00 5)))
         (base00+3 (if (eq variant 'light)
                       (color-darken-name base00 10)
                     (color-lighten-name base00 10)))
         (mode-line-box-color (if (eq variant 'light) base00+3 base00-3))
         (highlight-line-color (if (eq variant 'light) base00-1 base00+1)))

    (apply 'custom-theme-set-faces theme-name
           (mapcar
            (lambda (x) `(,(car x) ((t ,(cdr x)))))
            `((default :background ,base00 :foreground ,base03)
              (bold :weight bold)
              (border :background ,base02)
              (cursor :background ,pink-1 :inverse-video t)
              (highlight :background ,base00+1)
              (hl-line :background ,highlight-line-color)
              (link :foreground ,blue :underline t)
              (link-visited :inherit link :foreground ,purple)
              (minibuffer-prompt :foreground ,blue)
              (region :background ,base00+2)
              (vhl/default-face :background ,base00+1)
              (trailing-whitespace :background ,base00+1 :foreground ,yellow)
              (next-error :background ,base01)
              (secondary-selection :background ,yellow-1)
              (header-line :foreground ,purple :background nil)
              (auto-dim-other-buffers-face :background ,base00+1)
              (fringe :background ,base00+1 :foreground ,base02)
              (linum :inherit fringe :foreground ,base01)
              (vertical-border :foreground ,base00+3)
              (widget-button :underline t)
              (widget-field :background ,base02 :box (:line-width 1 :color ,base03))
              (error :foreground ,red)
              (warning :foreground ,orange :weight bold)
              (success :foreground ,green :weight bold)
              (ace-jump-face-background :foreground ,base00+3)
              (ace-jump-face-foreground :foreground ,pink-1 :background nil :weight bold)
              (ajb-face :background ,base00+1)
              (avi-lead-face :inherit ace-jump-face-foreground)
              (aw-leading-char-face :inherit ace-jump-face-foreground)
              (aw-background-face :inherit ace-jump-face-background)
              (parenthesis :foreground ,base00+3)

              (font-lock-comment-face :foreground ,base01)
              (font-lock-comment-delimiter-face :foreground ,base01)
              (font-lock-builtin-face :foreground ,cyan)
              (font-lock-doc-face :foreground ,base02)
              (font-lock-constant-face :foreground ,indigo)
              (font-lock-function-name-face :foreground ,blue)
              (font-lock-keyword-face :foreground ,purple)
              (font-lock-negation-char-face :foreground ,red-1)
              (font-lock-preprocessor-face :foreground ,blue-1)
              (font-lock-regexp-grouping-backslash :foreground ,purple-1)
              (font-lock-regexp-grouping-construct :foreground ,purple-1)
              (font-lock-string-face :foreground ,green)
              (font-lock-type-face :foreground ,orange)
              (font-lock-variable-name-face :foreground ,teal)
              (font-lock-warning-face :foreground ,red)

              (mode-line :box (:line-width 4 :color ,mode-line-box-color :style nil)
                         :height 0.9 :background ,base00-2 :foreground ,base03)
              (mode-line-inactive :box (:line-width 4 :color ,base00+1 :style nil)
                                  :height 0.9 :background ,base00+1 :foreground ,base02)

              (mode-line-buffer-id :foreground unspecified :background nil)
              (mode-line-emphasis :foreground ,base02 :slant italic)
              (mode-line-highlight :foreground ,base02 :box nil :weight bold)
              (powerline-active1 :background ,base00)
              (powerline-active2 :background ,base00+1)
              (powerline-inactive1 :background ,base00+1)
              (powerline-inactive2 :background ,base00+1)
              (alert-trivial-face :inherit nil :foreground nil :background nil)
              (anzu-mode-line :foreground ,yellow)
              (persp-selected-face :foreground ,base03)
              (mm-command-output :foreground unspecified :background unspecified)

              (match :foreground ,yellow :background ,base00+1 :inverse-video t :weight bold)
              (isearch :inherit match)
              (query-replace :inherit isearch)
              (anzu-replace-to :foreground ,yellow :background ,base00+1)
              (lazy-highlight :foreground ,yellow)
              (isearch-lazy-highlight-face :foreground ,yellow)
              (isearch-fail :inherit font-lock-warning-face)
              (regex-tool-matched-face :foreground nil :background nil :inherit match)
              (ag-match-face :inherit isearch-lazy-highlight-face)
              (custom-state :foreground ,green)

              (wgrep-face :background ,base00+2)
              (wgrep-file-face :background ,base00+1)
              (wgrep-delete-face :foreground ,red)
              (wgrep-reject-face :foreground ,red)
              (wgrep-done-face :foreground ,green)

              (guide-key/highlight-command-face :foreground ,yellow)
              (guide-key/key-face :foreground ,pink)
              (guide-key/prefix-command-face :foreground ,cyan)

              (tabbar-default :inherit default :foreground ,base02 :background "black"
                              :box (:line-width 4 :color ,base00 :style nil))
              (tabbar-button :height 0.8 :box (:line-width 4 :color ,base00-2 :style nil))
              (tabbar-unselected :inherit tabbar-button :background ,base00-2)
              (tabbar-modified :inherit tabbar-unselected)
              (tabbar-selected :inherit tabbar-button
                               :box (:line-width 4 :color ,base00 :style nil))
              (tabbar-separator :inherit tabbar-selected)

              (company-tooltip :background ,base00-1 :foreground ,base02)
              (company-tooltip-selection :background ,base00-2 :foreground ,base03)
              (company-tooltip-common :inherit company-tooltip)
              (company-tooltip-common-selection :inherit company-tooltip-selection)
              (company-tooltip-search :foreground ,yellow)
              (company-echo-common :inherit company-tooltip :foreground ,yellow)
              (company-scrollbar-bg :background ,base00+1)
              (company-scrollbar-fg :background ,base00+3)
              (company-tooltip-annotation :inherit company-tooltip :foreground ,base01)
              (company-preview :background ,base00 :foreground ,base02)
              (company-preview-common :foreground ,base02)
              (company-preview-search :background ,base00)

              (tooltip :background ,base03 :foreground ,base00 :height 0.9)
              (popup-tip-face :inherit tooltip)
              (popup-face :foreground ,base00+1 :background ,base03)
              (popup-menu-selection-face :foreground ,base03 :background ,blue)
              (popup-isearch-match :foreground ,yellow :background nil)
              (popup-scroll-bar-foreground-face :inherit company-scrollbar-fg)
              (popup-scroll-bar-background-face :background ,base02)

              (flymake-warnline :underline ,orange :background ,base00+1)
              (flymake-errline :underline ,red :background ,base00+1)

              (flycheck-error :underline (:style wave :color ,red) :inherit unspecified)
              (flycheck-info :underline (:style wave :color ,green) :inherit unspecified)
              (flycheck-warning :underline (:style wave :color ,orange) :inherit unspecified)

              (swoop-face-target-words :foreground ,yellow)
              (swoop-face-target-line :background ,base01)
              (swoop-face-line-buffer-name :inherit header-line :foreground ,base02)
              (swoop-face-header-format-line :inherit swoop-face-line-buffer-name :foreground ,purple)
              (swoop-face-line-number :foreground ,base02)
              (helm-swoop-target-word-face :foreground ,yellow)
              (helm-swoop-target-line-face :background ,base00+2)
              (helm-swoop-target-line-block-face :background ,base00+1)
              (helm-swoop-line-number-face :foreground ,base01)

              (helm-match :foreground ,yellow-1)
              (helm-source-header :family inherit :inherit header-line :foreground ,purple)
              (helm-visible-mark :background ,green)
              (helm-header :inherit header-line)
              (helm-candidate-number :background unspecified)
              (helm-selection :background ,base00+2)
              (helm-selection-line :inherit helm-selection)
              (helm-separator :foreground ,base01)
              (helm-action :underline nil)
              (helm-prefarg :foreground ,green)
              (helm-buffer-saved-out :foreground ,red)
              (helm-buffer-not-saved :foreground ,red)
              (helm-buffer-size :foreground ,base02)
              (helm-buffer-process :foreground ,base02)
              (helm-buffer-directory :foreground ,brown)
              (helm-M-x-key :foreground ,base02)
              (helm-ff-prefix :foreground ,yellow)
              (helm-ff-executable :foreground ,green)
              (helm-ff-directory :inherit helm-buffer-directory)
              (helm-ff-symlink :foreground ,brown)
              (helm-ff-invalid-symlink :inherit helm-ff-symlink :underline (:style wave :color ,red))
              (helm-grep-match :inherit match)
              (helm-grep-file :foreground ,base01)
              (helm-grep-lineno :foreground ,base02)
              (helm-grep-running :inherit compilation-mode-line-run)
              (helm-grep-finish :inherit success)
              (helm-visible-mark :inverse-video t)
              (helm-ls-git-added-modified-face :foreground ,cyan)
              (helm-ls-git-conflict-face :foreground ,purple-1)
              (helm-ls-git-deleted-and-staged-face :foreground ,base02)
              (helm-ls-git-deleted-not-staged-face :foreground ,orange)
              (helm-ls-git-modified-and-staged-face :foreground ,orange-1)
              (helm-ls-git-modified-not-staged-face :foreground ,orange-1)
              (helm-ls-git-renamed-modified-face :foreground ,orange-1)
              (helm-ls-git-untracked-face :foreground ,blue)

              (show-paren-match :background unspecified :underline (:style line :color ,pink))
              (show-paren-mismatch :background unspecified :foreground ,red :inverse-video t
                                   :underline (:style line :color ,red))
              (highlight-symbol-face :foreground unspecified :background unspecified
                                     :underline (:style line :color ,base02))
              (sp-show-pair-match-face :inherit show-paren-match)
              (sp-show-pair-mismatch-face :inherit show-paren-mismatch)

              (rainbow-delimiters-depth-1-face :foreground ,purple-1)
              (rainbow-delimiters-depth-2-face :foreground ,indigo-1)
              (rainbow-delimiters-depth-3-face :foreground ,cyan-1)
              (rainbow-delimiters-depth-4-face :foreground ,blue-1)
              (rainbow-delimiters-depth-5-face :foreground ,teal-1)
              (rainbow-delimiters-depth-6-face :foreground ,pink-1)
              (rainbow-delimiters-depth-7-face :foreground ,purple)
              (rainbow-delimiters-depth-8-face :foreground ,indigo)
              (rainbow-delimiters-depth-9-face :foreground ,cyan)
              (rainbow-delimiters-depth-10-face :foreground ,blue)
              (rainbow-delimiters-depth-11-face :foreground ,teal)
              (rainbow-delimiters-depth-12-face :foreground ,pink)
              (rainbow-delimiters-mismatched-face :foreground ,red)
              (rainbow-delimiters-unmatched-face :foreground ,red)

              (ido-subdir :foreground ,brown :weight bold)
              (ido-first-match :foreground ,orange :weight bold)
              (ido-only-match :inherit ido-first-match)
              (ido-indicator :foreground ,red :background ,base00+1)
              (ido-virtual :foreground ,cyan)
              (ido-vertical-match-face :foreground unspecified :underline (:style line :color ,yellow))
              (flx-highlight-face :foreground ,yellow)

              (diff-added :foreground ,green)
              (diff-changed :foreground ,blue)
              (diff-removed :foreground ,red)
              (diff-header :background ,base00+1)
              (diff-file-header :foreground ,base01)
              (diff-hunk-header :foreground ,base01)
              (ediff-even-diff-A :foreground nil :background nil :inverse-video t)
              (ediff-even-diff-B :foreground nil :background nil :inverse-video t)
              (ediff-odd-diff-A  :foreground ,base03 :background nil :inverse-video t)
              (ediff-odd-diff-B  :foreground ,base03 :background nil :inverse-video t)

              (git-gutter:added :foreground ,base01)
              (git-gutter:deleted :foreground ,base01)
              (git-gutter:modified :foreground ,base01)

              (diff-hl-insert :foreground ,green :background ,base00+1)
              (diff-hl-unknown :foreground ,orange-1 :background ,base00+1)
              (diff-hl-delete :foreground ,red-1 :backgound ,base00+1)
              (diff-hl-change :foreground ,blue-1 :background ,base00+1)

              (eldoc-highlight-function-argument :foreground ,green :weight bold)

              (undo-tree-visualizer-default-face :foreground ,base03)
              (undo-tree-visualizer-current-face :foreground ,green :weight bold)
              (undo-tree-visualizer-active-branch-face :foreground ,red)
              (undo-tree-visualizer-register-face :foreground ,yellow)

              (dired-directory :inherit ido-subdir)
              (dired-header :inherit header-line)
              (diredp-compressed-file-suffix :foreground ,blue)
              (diredp-dir-heading :inherit dired-header)
              (diredp-dir-priv :foreground ,cyan :background nil)
              (diredp-exec-priv :foreground ,blue :background nil)
              (diredp-executable-tag :foreground ,red :background nil)
              (diredp-file-name :foreground ,orange)
              (diredp-file-suffix :foreground ,green)
              (diredp-flag-mark-line :background nil :inherit highlight)
              (diredp-ignored-file-name :foreground ,base03)
              (diredp-link-priv :background nil :foreground ,purple)
              (diredp-mode-line-flagged :foreground ,red)
              (diredp-mode-line-marked :foreground ,green)
              (diredp-no-priv :background nil)
              (diredp-number :foreground ,orange-1)
              (diredp-other-priv :background nil :foreground ,purple)
              (diredp-rare-priv :foreground ,red :background nil)
              (diredp-read-priv :foreground ,green :background nil)
              (diredp-symlink :foreground ,purple)
              (diredp-write-priv :foreground ,yellow :background nil)

              (magit-process-ok :foreground ,green)
              (magit-process-ng :foreground ,red)
              (magit-tag :foreground ,cyan-1)
              (magit-log-author :foreground ,base02)
              (magit-log-date :foreground ,base02)
              (magit-log-graph :foreground ,base02)
              (magit-log-head-label-head :box nil :background ,base00+1 :foreground ,green-1)
              (magit-log-head-label-remote :box nil :background ,base00+1 :foreground ,green-1)
              (magit-log-head-label-local :box nil :background ,base00+1 :foreground ,green-1)
              (magit-log-head-label-tags :box nil :background ,base00+1 :foreground ,green-1)
              (magit-log-head-label-patches :box nil :background ,base00+1 :foreground ,green-1)
              (magit-hash :foreground ,cyan)
              (magit-branch :background ,base00+1 :foreground ,green-1)
              (magit-branch-local :foreground ,green-1)
              (magit-branch-remote :foreground ,green-1)
              (magit-branch-label :foreground ,green-1)
              (magit-branch-current :foreground ,green-1)
              (magit-head :foreground ,indigo)
              (magit-section-highlight :inherit highlight)
              (magit-section-heading :foreground ,purple :weight bold)
              (magit-dimmed :background ,base00-2)
              (magit-refname :foreground ,orange)
              (magit-diff-added :foreground ,green :background unspecified)
              (magit-diff-removed :foreground ,red :background unspecified)
              (magit-diff-context :foreground unspecified :background unspecified)
              (magit-diff-added-highlight :foreground ,green :background ,base00-1)
              (magit-diff-removed-highlight :foreground ,red :background ,base00-1)
              (magit-diff-context-highlight :foreground unspecified :background ,base00-1)
              (magit-diffstat-added :foreground ,green :background unspecified)
              (magit-diffstat-removed :foreground ,red :background unspecified)
              (magit-cherry-unmatched :foreground ,cyan)
              (magit-cherry-equivalent :foreground ,purple)
              (magit-blame-heading :foreground unspecified :background unspecified)
              (magit-diff-hunk-heading :foreground ,base01)
              (magit-diff-hunk-heading-highlight :inherit magit-diff-hunk-heading :background ,base00-1)
              (magit-diff-hunk-heading-selection :foregroud unspecified)
              (magit-diff-lines-heading :background unspecified)
              (magit-popup-argument :foreground ,base02)
              (magit-popup-disabled-argument :foreground ,base01)
              (magit-item-highlight :background ,highlight-line-color)
              (git-commit-summary :foreground ,base03)

              (ediff-current-diff-A :foreground ,base03 :background ,red-1)
              (ediff-current-diff-Ancestor :foreground ,base03 :background ,red-1)
              (ediff-current-diff-B :foreground ,base03 :background ,green-1)
              (ediff-current-diff-C :foreground ,base03 :background ,blue-1)
              (ediff-even-diff-A :background ,base00+2)
              (ediff-even-diff-Ancestor :background ,base00+2)
              (ediff-even-diff-B :background ,base00+2)
              (ediff-even-diff-C :background ,base00+2)
              (ediff-fine-diff-A :foreground ,base03 :background ,red-1 :weight bold)
              (ediff-fine-diff-Ancestor :foreground ,base03 :background ,red-1 weight bold)
              (ediff-fine-diff-B :foreground ,base03 :background ,green-1 :weight bold)
              (ediff-fine-diff-C :foreground ,base03 :background ,blue-1 :weight bold )
              (ediff-odd-diff-A :background ,base01)
              (ediff-odd-diff-Ancestor :background ,base01)
              (ediff-odd-diff-B :background ,base01)
              (ediff-odd-diff-C :background ,base01)

              (compilation-info :foreground ,base02 :underline t)
              (compilation-column-number :foreground ,base02)
              (compilation-line-number :foreground ,base02)
              (compilation-message-face :foreground ,blue)
              (compilation-mode-line-exit :inherit nil :foreground unspecified :background unspecified)
              (compilation-mode-line-fail :inherit nil :foreground unspecified :background unspecified)
              (compilation-mode-line-run :inherit nil :foreground unspecified :background unspecified)

              (org-date :foreground ,purple)
              (org-done :foreground ,green)
              (org-checkbox :foreground ,purple)
              (org-agenda-structure :foreground ,purple)
              (org-agenda-date :foreground ,blue :underline nil)
              (org-agenda-done :foreground ,green)
              (org-agenda-dimmed-todo-face :foreground ,base03)
              (org-block :foreground ,orange)
              (org-code :foreground ,orange-1)
              (org-column :background ,base02)
              (org-column-title :inherit org-column :weight bold :underline t)
              (org-document-info :foreground ,cyan)
              (org-document-info-keyword :foreground ,green)
              (org-document-title :weight bold :foreground ,orange :height 1.44)
              (org-ellipsis :foreground ,base03)
              (org-footnote :foreground ,cyan)
              (org-formula :foreground ,red)
              (org-hide :foreground ,base02)
              (org-link :foreground ,blue)
              (org-scheduled :foreground ,green)
              (org-scheduled-previously :foreground ,orange)
              (org-scheduled-today :foreground ,green)
              (org-special-keyword :foreground ,orange)
              (org-table :foreground ,purple)
              (org-todo :foreground ,red)
              (org-upcoming-deadline :foreground ,orange)
              (org-warning :weight bold :foreground ,red)

              (markdown-url-face :inherit link)
              (markdown-link-face :foreground ,blue :underline t)

              (js2-warning-face :underline ,orange)
              (js2-error-face :foreground nil :underline ,red)
              (js2-external-variable-face :foreground ,purple)
              (js2-function-param-face :foreground ,blue)
              (js2-instance-member-face :foreground ,blue)
              (js2-private-function-call-face :foreground ,red)
              (js3-warning-face :underline ,orange)
              (js3-error-face :inherit js2-error-face)
              (js3-external-variable-face :inherit js2-external-variable-face)
              (js3-function-param-face :foreground ,blue)
              (js3-jsdoc-tag-face :foreground ,orange)
              (js3-jsdoc-type-face :foreground ,cyan)
              (js3-jsdoc-value-face :foreground ,orange-1)
              (js3-jsdoc-html-tag-name-face :foreground ,blue)
              (js3-jsdoc-html-tag-delimiter-face :foreground ,green)
              (js3-instance-member-face :foreground ,blue)
              (js3-private-function-call-face :inherit js2-external-variable-face)

              (erb-face :background ,base00+1 :foreground ,base03)
              (erb-delim-face :background ,base00+1 :foreground ,red)
              (erb-exec-face :background ,base00+1 :foreground ,base02)
              (erb-exec-delim-face :background ,base00+1 :foreground ,red)
              (erb-out-face :background ,base00+1 :foreground ,base03)
              (erb-out-delim-face :background ,base00+1 :foreground ,red)
              (erb-comment-face :background ,base00+1 :foreground ,base02)
              (erb-comment-delim-face :background ,base00+1 :foreground ,base01)

              (pulse-highlight-face :background ,pink)
              (pulse-highlight-start-face :background ,pink))))

    (custom-theme-set-variables theme-name

     `(evil-emacs-state-cursor '(,red bar))
     `(evil-insert-state-cursor '(,red hbar))
     `(evil-normal-state-cursor '(,yellow box))
     `(evil-visual-state-cursor '(,green box))
     `(pos-tip-foreground-color ,base02)
     `(pos-tip-background-color ,base00-1)

     `(highlight-symbol-foreground-color ,base03)
     `(highlight-symbol-colors '(,yellow
                                 ,green
                                 ,cyan
                                 ,blue
                                 ,purple
                                 ,orange))

     `(highlight-tail-colors
       (if (eq ',variant 'light)
           '((,orange-1 . 0)
             (,yellow . 10)
             (,yellow-1 . 30)
             (,base00+1 . 60)
             (,base00 . 80))
         '((,pink . 0)
           (,pink-1 . 10)
           (,purple-1 . 30)
           (,base00+1 . 60)
           (,base00 . 80))))

     `(tabbar-background-color ,base00-2)

     `(ansi-color-names-vector
       [,base00 ,red-1 ,green ,yellow ,blue ,purple ,cyan ,base03])
     `(ansi-term-color-vector
       [unspecified ,base00 ,red-1 ,green ,yellow ,blue ,purple ,cyan ,base03])))

  (when (and highlight-tail-mode (fboundp 'highlight-tail-reload))
    (highlight-tail-reload)))

;;;###autoload
(and load-file-name
     (boundp 'custom-theme-load-path)
     (add-to-list 'custom-theme-load-path
                  (file-name-as-directory
                   (file-name-directory load-file-name))))

(provide 'apropospriate)

;; Local Variables:
;; no-byte-compile: t
;; eval: (when (require 'rainbow-mode nil t) (rainbow-mode 1))
;; fill-column: 105
;; End:
;;; apropospriate.el ends here
