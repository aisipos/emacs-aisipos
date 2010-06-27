; nice font
;;(set-default-font "-unknown-DejaVu Sans Mono-medium-normal-normal-*-20-*-*-*-m-0-iso10646-1")
(push '(font . "Liberation Mono-10") default-frame-alist)

(defun toggle-fullscreen ()
  (interactive)
  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
	    		 '(2 "_NET_WM_STATE_MAXIMIZED_VERT" 0))
  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
	    		 '(2 "_NET_WM_STATE_MAXIMIZED_HORZ" 0))
)
(toggle-fullscreen)
(toggle-fullscreen)

