;;Custom functions

;;Seems to be needed for search-at-point
(defun delete-this-overlay(overlay is-after begin end &optional len)
  (delete-overlay overlay)
)
