(load (expand-file-name "~/quicklisp/slime-helper.el"))

;; Conf to start sbcl with slime as fast as possible.
;; If new swank or any of sb-bsd-sockets sb-posix sb-introspect sb-cltl2 asdf
;; comes out in new versions, the core image needs to be build anew.
;; Instructions here: https://common-lisp.net/project/slime/doc/html/Loading-Swank-faster.html#Loading-Swank-faster
(setq ;inferior-lisp-program "/usr/bin/sbcl"
      slime-startup-animation nil
      slime-net-coding-system 'utf-8-unix
      inhibit-startup-message t
      ;slime-lisp-implementations '((sbcl ("sbcl" "--core" "/home/torbjorn/.emacs.d/sbcl.core-for-slime")))
      slime-lisp-implementations
      '((sbcl ("sbcl" "--core" "/home/torbjorn/.emacs.d/sbcl.core-with-swank")
              :init (lambda (port-file _)
                      (format "(swank:start-server %S)\n" port-file)))))

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(cua-mode t nil (cua-base))
 '(inhibit-startup-screen t)
 '(show-paren-mode t)
 '(search-highlight t))

(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
)

(menu-bar-mode -1)


(add-to-list 'load-path "~/.emacs.d/evil")
(require 'evil)
(evil-mode 1)
;; change mode-line color by evil state
(lexical-let ((default-color (cons (face-background 'mode-line)
                                   (face-foreground 'mode-line))))
             (add-hook 'post-command-hook
                       (lambda ()
                         (let ((color (cond ((minibufferp) default-color)
                                            ((evil-insert-state-p) '("#e80000" . "#ffffff"))
                                            ((evil-emacs-state-p)  '("#444488" . "#ffffff"))
                                            ((buffer-modified-p)   '("#006fa0" . "#ffffff"))
                                            (t default-color))))
                           (set-face-background 'mode-line (car color))
                           (set-face-foreground 'mode-line (cdr color))))))

(setq pop-up-windows nil)

(global-set-key [S-dead-grave] "`")
(global-set-key [dead-tilde] "~")


(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

