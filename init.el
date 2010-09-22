; enable Common Lisp support
(require 'cl)

(setq dotfiles-dir (file-name-directory
                    (or (buffer-file-name) load-file-name)))
(add-to-list 'load-path dotfiles-dir)

;;; This was installed by package-install.el.
;;; This provides support for the package system and
;;; interfacing with ELPA, the package archive.
;;; Move this code earlier if you want to reference
;;; packages in your .emacs.
(when
    (load
     (expand-file-name "~/.emacs.d/elpa/package.el"))
  (package-initialize))


; some modes need to call stuff on the exec-path
(if (string-equal system-type "gnu/linux")
    (push "/usr/local/bin" exec-path))

; add directories to the load path
;;(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/.emacs.d/customizations")
(add-to-list 'load-path "~/.emacs.d/utilities")
(add-to-list 'load-path "~/.emacs.d/vendor")
(add-to-list 'load-path "~/.emacs.d/starter-kit")

; handy function to load all elisp files in a directory
(load-file "~/.emacs.d/load-directory.el")

; load utility functions
(mapcar 'load-directory '("~/.emacs.d/utilities"))

; load third-party modes
; note: these are configured in customizations/my-modes.el

(vendor 'color-theme)
(vendor 'auto-complete)
(vendor 'yasnippet)
(vendor 'pymacs)
;; (vendor 'textmate)
;; (vendor 'nav)
(vendor 'centered-cursor-mode)
;; (vendor 'browse-kill-ring)
;; (vendor 'yaml-mode)
;; (vendor 'rinari)
(vendor 'full-ack)
;; (vendor 'textile-minor-mode)
;; (vendor 'magit)
;; (vendor 'save-visited-files)
;; (vendor 'dired+)
;; (vendor 'minimap)
;; (vendor 'thrift-mode)
;; (vendor 'mo-git-blame)
(vendor 'smart-tab)
(vendor 'markdown-mode)

; Use emacs starter kit customization as a base
; starter kit init.el defines dotfiles-dir
(mapcar 'load-directory '("~/.emacs.d/starter-kit"))

; load personal customizations (keybindings, colors, etc.)
(mapcar 'load-directory '("~/.emacs.d/customizations"))

; per-OS customizations
(if (string-equal system-type "gnu/linux")
    (mapcar 'load-directory '("~/.emacs.d/linux-customizations")))
(if (string-equal system-type "windows-nt")
    (mapcar 'load-directory '("~/.emacs.d/win-customizations")))

; start a server for usage with emacsclient
(add-hook 'after-init-hook 'server-start)

(put 'dired-find-alternate-file 'disabled nil)
