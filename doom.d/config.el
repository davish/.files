;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

(add-to-list 'default-frame-alist '(width . 100))

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Davis Haupt"
      user-mail-address "davis.haupt@gmail.com")

(projectile-add-known-project "~/projects/penn-courses")
(projectile-add-known-project "~/projects/website")
(projectile-add-known-project "~/projects/study-rooms")
(projectile-add-known-project "~/.doom.d")
(projectile-add-known-project "~/Class/2020a/cis341/shared_hws")
(projectile-add-known-project "~/projects/davish-site")
(projectile-add-known-project "~/org")


(defun setup-python-env ()
  (interactive)
  (pipenv-activate)
  (setenv "PYTHONPATH" "backend")
  (lsp-restart-workspace)
)

(after! org
  (setq org-log-done 'time)
)

(setq mac-mouse-wheel-smooth-scroll 1)

(after! evil-snipe
  (evil-snipe-mode -1))

(after! company
  (setq company-idle-delay 0.2))


(global-set-key (kbd "<s-mouse-1>") '+lookup/definition)
(global-set-key (kbd "s-k") 'org-roam-insert)

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
(setq doom-font (font-spec :family "monospace" :size 14))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-nord-light)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-roam-directory "~/roam/")
(setq org-directory "~/org/")
(setq org-default-notes-file (concat org-directory "inbox.org"))

(after! org
  (setq org-capture-templates
      `(("i" "inbox" entry (file ,(concat org-directory "inbox.org"))
         "* TODO %?")
        ("n" "note"  entry (file ,(concat org-directory "inbox.org"))
         "* %?")
    ))
  (setq org-agenda-custom-commands
        '(("c" "Simple agenda view"
           ((agenda "" ((org-agenda-overriding-header "Agenda")
                        (org-agenda-span 2)
                        (org-agenda-start-day "0d")
                        (org-agenda-start-on-weekday nil)))
            (alltodo "" ((org-agenda-overriding-header "All tasks")
                         (org-agenda-skip-function '(org-agenda-skip-entry-if 'deadline 'scheduled))
                         ))))))
  )

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

(setq-hook! 'web-mode-hook web-mode-code-indent-offset 2)

;;(add-hook! web-mode
;;  (setq web-mode-code-indent-offset 2))


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c g k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c g d') to jump to their definition and see how
;; they are implemented.
