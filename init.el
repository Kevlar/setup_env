(setq
 backup-by-copying t ; don't clobber symlinks
 backup-directory-alist
 '(("." . "~/.saves/")) ; don't litter my source tree
 delete-old-versions t
 kept-new-versions 6 ; version counts
 kept-old-versions 2
 version-control t) ; use versioned backups

(message "Deleting old backup files...") ; everthing older than a week
(let ((week (* 60 60 24 7))
      (current (float-time (current-time))))
  (dolist (file (directory-files temporary-file-directory t))
    (when (and (backup-file-name-p file)
	       (> (- current (float-time (fifth (file-attributes file))))
		  week))
      (message "%s" file)
      (delete-file file))))

(setq-default indent-tabs-mode nil) ; use spaces instead of tabs
