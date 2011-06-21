; navigation
(global-set-key (kbd "M-n") 'forward-paragraph-nomark)
(global-set-key (kbd "M-p") 'backward-paragraph-nomark)

; magit
(global-set-key (kbd "C-c i") 'magit-status)

(global-set-key "\C-xr\r" 'revert-buffer)

(global-set-key (kbd "C-`") 'other-frame)

(global-set-key [(control return)] 'hippie-expand)

(global-set-key [(control tab)] 'auto-complete)
