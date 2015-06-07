;http://emacswiki.org/emacs/SpeedBar
;http://www.delorie.com/gnu/docs/elisp-manual-21/elisp_201.html
;http://www.mygooglest.com/fni/dot-emacs.html

(provide 'speedbar_config)


;http://emacswiki.org/emacs/SpeedBar
;Speedbar Without A Separate Frame

 ;abre speedbar automaticamente M-x speedbar tambem funciona
;ref uteis
;http://www.mygooglest.com/fni/dot-emacs.html

;speed bar "show all files" por padrao
;ref: http://stackoverflow.com/questions/2220005/how-do-i-enable-speedbar-to-display-all-types-of-files
(custom-set-variables
 '(speedbar-show-unknown-files t)
)


;speed bar "show all files" por padrao
;ref: http://stackoverflow.com/questions/2220005/how-do-i-enable-speedbar-to-display-all-types-of-files
(custom-set-variables
 '(speedbar-show-unknown-files t))


;;SPEEDBAR
;https://sites.google.com/site/xiangyangsite/home/linux-unix/emacs/speedbar-in-one-frame
(require 'speedbar)
(defconst my-speedbar-buffer-name "SPEEDBAR")
(setq speedbar-buffer (get-buffer-create my-speedbar-buffer-name)
      speedbar-frame (selected-frame)
      dframe-attached-frame (selected-frame)
      speedbar-select-frame-method 'attached
      speedbar-verbosity-level 0
      speedbar-last-selected-file nil)

(setq right-window (split-window-horizontally 24))
(setq left-window (frame-first-window))

;(walk-windows (lambda (w) (setq left-window w)) "nominibuffer" t)
(set-buffer speedbar-buffer)
(speedbar-mode)
(speedbar-reconfigure-keymaps)
(speedbar-update-contents)
(speedbar-set-timer 1)
(set-window-buffer left-window "SPEEDBAR")
(set-window-dedicated-p left-window t)
(toggle-read-only) ; HACK, REQUIRED for Tramp to work ????
(select-window right-window)
(defun select-right-window () (select-window right-window))
;(defun reset-window-config () (interactive)
; (walk-windows (lambda (w) (when (not (or (eq w left-window) (eq w right-window))) (delete-window w))) "nominibuffer" t)
; )
(defun reset-window-config () (interactive)
  (delete-other-windows)
  (setq right-window (split-window-horizontally 24))
  (setq left-window (frame-first-window))
  (set-window-buffer left-window speedbar-buffer)
  (set-window-dedicated-p left-window t)
  (select-window right-window)
  (set-window-dedicated-p right-window nil)
  (when (eq speedbar-buffer (window-buffer right-window)) (set-window-buffer right-window (next-buffer)))
  (set-window-dedicated-p right-window nil)
  )
(global-set-key "\C-x1" 'reset-window-config)



;;SPEEDBAR
;https://sites.google.com/site/xiangyangsite/home/linux-unix/emacs/speedbar-in-one-frame
;(require 'tramp)
;(defconst my-junk-buffer-name "Junk")
;(setq junk-buffer (get-buffer-create my-junk-buffer-name)
;      )
;(require 'speedbar)
;(defconst my-speedbar-buffer-name "SPEEDBAR")
;(setq speedbar-buffer (get-buffer-create my-speedbar-buffer-name)
;      speedbar-frame (selected-frame)
;      dframe-attached-frame (selected-frame)
;      speedbar-select-frame-method 'attached
;      speedbar-verbosity-level 0
;      speedbar-last-selected-file nil)
;(setq right-window (split-window-horizontally 24))
;(setq left-window (frame-first-window))
;;(walk-windows (lambda (w) (setq left-window w)) "nominibuffer" t)
;(set-buffer speedbar-buffer)
;(speedbar-mode)
;(speedbar-reconfigure-keymaps)
;(speedbar-update-contents)
;(speedbar-set-timer 1)
;(set-window-buffer left-window "SPEEDBAR")
;(set-window-dedicated-p left-window t)
;(toggle-read-only) ; HACK, REQUIRED for Tramp to work ????
;(select-window right-window)
;(defun select-right-window () (select-window right-window))
;;(defun reset-window-config () (interactive)
;; (walk-windows (lambda (w) (when (not (or (eq w left-window) (eq w right-window))) (delete-window w))) "nominibuffer" t)
;; )
;(defun reset-window-config () (interactive)
;  (delete-other-windows)
;  (setq right-window (split-window-horizontally 24))
;  (setq left-window (frame-first-window))
;  (set-window-buffer left-window speedbar-buffer)
;  (set-window-dedicated-p left-window t)
;  (select-window right-window)
;  (set-window-dedicated-p right-window nil)
;  (when (eq speedbar-buffer (window-buffer right-window)) (set-window-buffer right-window (next-buffer)))
;  (set-window-dedicated-p right-window nil)
;  )
;(global-set-key "\C-x1" 'reset-window-config)