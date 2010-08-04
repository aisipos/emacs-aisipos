;;Search for word at point, taken from http://www.emacswiki.org/emacs/MacChan
 ;;
 ;; Emulate vim's * and # keys.
 ;;
 ;; Much better than emacs's default M-b... / M-f... + C-s C-w ... C-s
 ;;
 ;; This is my second version.
 ;;
 ;; Please send comments to emailmac (at) gmail com
 ;; (require 'custom)

 (defvar sap-word '()
   "last searched regex")

 (defvar sap-forward t
   "last search direction")

 (defvar sap-overlay '()
   "last highlighted word")

 (defvar sap-start-point '()
   "save the point where we start searching so that we can return later")

 (defface sap-face
   '((((type tty pc) (class color))
      (:background "magenta4" :foreground "cyan1"))
     (((class color) (background light))
      (:background "magenta4" :foreground "lightskyblue1"))
     (((class color) (background dark))
      (:background "palevioletred2" :foreground "brown4"))
     (t (:inverse-video t)))
   "Face for highlighting search-at-point matches."
   :group 'sap-faces)

 (defvar sap-face 'sap-face)

 (defun search-at-point-highlight (search-forward)
   "Highlight the current searched word.
 If search-forward is t, the cursor is currently at the end of the searched word."
   (save-excursion
 	;; sap-word is a regex that looks like \<word\>
 	;; so length - 4 is the length of word
 	(let (pt1 pt2 (sap-width (- (length sap-word) 4)))
 	  (setq pt1 (point))
 	  (if search-forward
 		  (backward-char sap-width)
 		(forward-char sap-width))
 	  (setq pt2 (point))
 	  (if sap-overlay (delete-overlay sap-overlay))
 	  (setq sap-overlay (make-overlay 1 1))
 	  (overlay-put sap-overlay 'face sap-face)
 	  (overlay-put sap-overlay 'modification-hooks (list 'delete-this-overlay))
 	  (move-overlay sap-overlay pt1 pt2))))

 (defun search-at-point-continue ()
   "Repeat the last search with the same target and direction."
   (interactive)
   (unless sap-word
 	(setq sap-word (concat "\\<" (find-tag-default) "\\>")))
   (if sap-forward
 	  (let ((count (if (looking-at "\\<") 2 1)))
 		(unless (re-search-forward sap-word nil t count)
 		  (goto-char (point-min))
 		  (re-search-forward sap-word nil t)
 		  ;; hey, I even steal vim's status message, sue me!
 		  (message "search hit BOTTOM, continuing at TOP")))
 	(let ((count (if (looking-at "\\>") 2 1)))
 	  (unless (re-search-backward sap-word nil t count)
 		(goto-char (point-max))
 		(re-search-backward sap-word nil t)
 		(message "search hit TOP, continuing at BOTTOM"))))
   (search-at-point-highlight sap-forward))

 (defun search-at-point (backward)
   "Similar to vim's * key. Search the word under the cursor."
   (interactive "P")
   (setq sap-start-point (point)
 		sap-word (concat "\\<" (find-tag-default) "\\>")
 		sap-forward (not backward))
   (search-at-point-continue))

 (defun search-at-point-backward ()
   "Similar to vim's # key. Search the word under the cursor backward."
   (interactive)
   (search-at-point t))

 (defun search-at-point-return ()
   "return to the point where we started the search"
   (interactive)
   (if sap-start-point (goto-char sap-start-point)))

 ;; Meta F3 will search the word under the cursor (like vim's *)
 ;; Ctrl F3 will search backward (like vim's #)
 ;; F3 will repeat the last search (like vim's n)
 ;; Shift F3 will return to where we started the search (behave like isearch's Ctrl-G)

 (global-set-key [f3] 'search-at-point-continue)
 (global-set-key [(meta f3)] 'search-at-point)
 (global-set-key [(control f3)] 'search-at-point-backward)
 (global-set-key [(shift f3)] 'search-at-point-return)
