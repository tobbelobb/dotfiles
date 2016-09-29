(show-paren-mode 1)
(set-language-environment "UTF-8")

;;; Backup files and such
(setq backup-by-copying t      ; don't clobber symlinks-
      backup-directory-alist
      '(("." . "~/.saves"))    ; don't litter my fs tree
      auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t))
      delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2
      version-control t)       ; use versioned backups

;;; Some more packages...
;;; Use with M-x package-install
(require 'package)
(add-to-list 'package-archives
	     '("marmalade" . "http://marmalade-repo.org/packages/"))

(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

;;; Recommended packages:
;;; - smex
;;; - magit
(load (expand-file-name "~/.roswell/lisp/quicklisp/slime-helper.el"))
;; Replace "sbcl" with the path to your implementation
(setq inferior-lisp-program "/home/torbjorn/.roswell/impls/x86-64/linux/sbcl/1.3.9/bin/sbcl")
;;; By default, ros doesn't load .sbclrc, so we include it with the -l option
(setf slime-lisp-implementations
      `((sbcl ("ros" "-Q" "-l" "~/.sbclrc" "-L" "sbcl" "run"))))
(setf slime-default-lisp 'sbcl)
;;; Tell slime to use utf-9 when communicating with the lisp process
(setq slime-net-coding-system 'utf-8-unix)

;;; Make Emacs behave nicely with lisp code
(defun lisp-hook-fn ()
  (interactive)
  ;; Start Slime mode
  (slime-mode)
  ;; Useful key-bindings
  (local-set-key [tab] 'slime-complete-symbol)
  (local-set-key (kbd "M-q") 'slime-reindent-defun) ; Help us follow indentation conventions...
  ;; We set the indent function. common-lisp-indent-function
  ;; will indent our code the right way
  (set (make-local-variable lisp-indent-function) 'common-lisp-indent-function)
  ;; We tell slime to not load failed compiled code
  (setq slime-load-failed-fasl 'never))
;; Finally we tell lisp-mode to run our function on startup
(add-hook 'lisp-mode-hook 'lisp-hook-fn)

(global-set-key [S-dead-grave] "`")
(global-set-key [dead-tilde] "~")

(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;; Make shift+tab and shift+arrow jump between splits
(global-set-key [backtab] 'next-multiframe-window)
(windmove-default-keybindings)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(custom-enabled-themes (quote (manoj-dark))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Change theme...
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'cyberpunk t)

;; Split horizontal every time
(setq split-height-threshold nil)
(setq split-width-threshold 0)

;; Scroll nicer
(setq redisplay-dont-pause t
  scroll-margin 1
  scroll-step 1
  scroll-conservatively 10000
  scroll-preserve-screen-position 1)

;; Common User Access. Copy and paste with C-c and C-v when in mark mode.
;; Rectangular mark mode with C-Ret
(cua-mode t)

;; Make new lines above and below current line (preserve indentation and move cursor also)
(defun insert-and-indent-line-below ()
  (interactive)
  (push-mark)
  (let* 
    ((ipt (progn (back-to-indentation) (point))) ; Move cursor and register one point
     (bol (progn (move-beginning-of-line 1) (point))) ; Move cursor and register another point
     (indent (buffer-substring bol ipt))) ; Storing correct amount of spaces in buffer
    (move-end-of-line 1)
    (newline)
    (insert indent)))
(defun insert-and-indent-line-above ()
  (interactive)
  (push-mark)
  (let* 
    ((ipt (progn (back-to-indentation) (point))) ; Move cursor and register one point
     (bol (progn (move-beginning-of-line 1) (point))) ; Move cursor and register another point
     (indent (buffer-substring bol ipt))) ; Storing correct amount of spaces in buffer
    (newline)
    (previous-line)
    (insert indent)))
(global-set-key [ (control shift o) ] 'insert-and-indent-line-above)
(global-set-key [ (control shift j) ] 'insert-and-indent-line-below)
