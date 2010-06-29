; magit
(global-set-key (kbd "C-c i") 'magit-status)

(global-set-key "\C-xr\r" 'revert-buffer)

(global-set-key (kbd "C-`") 'other-frame)

(global-set-key [(control return)] 'hippie-expand)

(global-set-key [(control tab)] 'auto-complete)

;;Let yas control the tab key behavior for now
(global-set-key (kbd "TAB") 'yas/expand)

;;some python keys
(global-set-key (kbd "C-C C-,") 'python-shift-left)
(global-set-key (kbd "C-C C-.") 'python-shift-right)
