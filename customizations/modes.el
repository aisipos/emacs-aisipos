
;;smex
(require 'smex)
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;;uniquify
(require 'uniquify)
(setq uniquify-buffer-name-style 'reverse)

; centered- scrolling
(require 'centered-cursor-mode)
;;disabling for now since centered-cursor can prevent you from having
;;a whole function on the screen. Find a better smooth scroller.
;;(global-centered-cursor-mode t)

;;smooth-scrolling, from Adam Spiers
(require 'smooth-scrolling)

;markdown
(require 'markdown-mode)
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))

; smart-tab
(require 'smart-tab)
(global-smart-tab-mode 1)
(setq smart-tab-using-hippie-expand nil)

; Ack
(autoload 'ack-same "full-ack" nil t)
(autoload 'ack "full-ack" nil t)
(autoload 'ack-find-same-file "full-ack" nil t)
(autoload 'ack-find-file "full-ack" nil t)
(setq ack-prompt-for-directory t)

; Git
(require 'magit)
(autoload 'magit-status "magit" nil t)

;;yasnippet - ideas from EnigmaCurry
(require 'yasnippet)
;Don't map TAB to yasnippet
;In fact, set it to something we'll never use because
;we'll only ever trigger it indirectly.
(setq yas/trigger-key (kbd "C-c <kp-multiply>"))
(yas/initialize)
(yas/load-directory "~/.emacs.d/snippets")

; winner -mode
; allows you to go through your window configurations with c-x left and c-x right
; (which otherwise are mapped to previous buffer and next bufer
;(winner-mode)

;;ido
;;ido's definition of "everywhere" is somewhat limited
(ido-everywhere t)
;;TODO: See http://stackoverflow.com/questions/905338/can-i-use-ido-completing-read-instead-of-completing-read-everywhere

;;auto-complete
(add-to-list 'ac-dictionary-directories "~/.emacs.d/dict")
(require 'auto-complete-config)
(ac-config-default)

