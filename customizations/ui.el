; don't display startup message
(setq inhibit-startup-message t)

; no toolbar
(tool-bar-mode -1)

; blink cursor
(blink-cursor-mode t)

; highlight current line
(global-hl-line-mode t)

; force new frames into existing window
(setq ns-pop-up-frames nil)

; theme
(require 'color-theme)
(color-theme-initialize)
(setq color-theme-is-global t)
(color-theme-deep-blue)

