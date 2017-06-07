;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

;;; Code:
(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     html
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     helm
     ;auto-completion
     (auto-completion :variables
                      auto-completion-enable-snippets-in-popup t ;; Expand yasnippets through popup.
                      auto-completion-return-key-behavior nil)   ;; Do newlines with return, even if suggestion is active
     ;; better-defaults
     emacs-lisp
     ;; git
     ;; markdown
     org
     ;; evil-org-mode
     (shell :variables
            shell-default-height 30
            shell-default-position 'bottom
            shell-default-shell 'shell)
     ;; spell-checking
     (syntax-checking :variables syntax-checking-enable-by-default nil)
     ;; version-control
     common-lisp ; needs some config to show slime-arglist for longer periods of time
     semantic ; gives automatic semantic refactor
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '()
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '(evil-search-highlight-persist)
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner nil
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 7)
                                (projects . 5)
                                (bookmarks . 10))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(cyberpunk
                         spacemacs-dark
                         spacemacs-light)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 13
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m)
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup t
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols nil
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; If non nil line numbers are turned on in all `prog-mode' and `text-mode'
   ;; derivatives. If set to `relative', also turns on relative line numbers.
   ;; (default nil)
   dotspacemacs-line-numbers t
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  (setq-default

   ;; Evil
   evil-shift-round nil ; Behaviour of < and >. Nil means "insert/remove a constant number of spaces. Don't round."

   ;; Enable double caps mode
   ;; Is this the right place to do this?
   ;double-caps-mode 1

   ; I want to always see line numbers.
   ;; Is this the right place to do this?
   ;spacemacs/toggle-line-numbers-on
   ))

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."
  ;; Tell slime to run the Roswell controlled sbcl
  ;; If sbcl 1.3.10 exists, use it, otherwise try to use 1.3.9
  ;; This is weakly coded since it assumes that either ros sbcl 1.3.9 or 1.3.10 is installed
  ;; Will fail soon...
  (if (file-exists-p "/home/torbjorn/.roswell/impls/x86-64/linux/sbcl/1.3.10/bin/sbcl")
      (setq inferior-lisp-program "/home/torbjorn/.roswell/impls/x86-64/linux/sbcl/1.3.10/bin/sbcl")
      (setq inferior-lisp-program "/home/torbjorn/.roswell/impls/x86-64/linux/sbcl/1.3.9/bin/sbcl"))

  ;; Tell slime to load .sbclrc if sbcl is being used
  ;; Also use 4 Gb heap because CLML needs it
  ;; To check which space size you got: (sb-ext:dyamic-space-size)
  (setf slime-lisp-implementations `((sbcl ("ros" "dynamic-space-size=4000" "-Q" "-l" "~/.sbclrc" "-L" "sbcl" "run"))))
  (setf slime-default-lisp 'sbcl)
  ; Tell slime to use utf-8 when communicating with the lisp process
  (setq slime-net-coding-system 'utf-8-unix)

  ;; follow symlinks under version control
  (setq vc-follow-symlinks t)

  ;; Please insert newline below with Shift - j
  (define-key evil-normal-state-map "J" 'spacemacs/evil-insert-line-below)
;  (define-key evil-normal-state-map (kbd "S-j") 'spacemacs/evil-insert-line-below)
  (define-key evil-normal-state-map "K" 'spacemacs/evil-insert-line-above)
;  (define-key evil-normal-state-map (kbd "S-k") 'spacemacs/evil-insert-line-above)

  ;; Scroll page with C-j and C-k.
  ;; I'll never use default C-j electric-newline-and-maybe-indent or C-k evil-insert-digraph (kill to end of line?)
  (define-key evil-normal-state-map (kbd "C-k") 'evil-scroll-page-up)
  (define-key evil-normal-state-map (kbd "C-j") 'evil-scroll-page-down)

  ; Forward slurp on Ctrl Shift s
  (define-key evil-normal-state-map (kbd "C-S-s") 'evil-lisp-state-sp-forward-slurp-sexp)
  ; Forward barf on Ctrl Shift s
  (define-key evil-normal-state-map (kbd "C-S-b") 'evil-lisp-state-sp-forward-barf-sexp)

  ;; Save file from normal mode with Ø/Ö/ø/ö
  (define-key evil-normal-state-map "Ø" 'save-buffer)
  (define-key evil-normal-state-map "Ö" 'save-buffer)
  (define-key evil-normal-state-map "ø" 'save-buffer)
  (define-key evil-normal-state-map "ö" 'save-buffer)
  ;; Jump between windows with caps lock
  ;; Holding shift when pressing either cycles backwards instead of forwards
  (if (eq window-system 'x)
      (shell-command "xmodmap -e 'clear Lock' -e 'keycode 66 = F13'"))
  (global-set-key [f13]
                  'next-multiframe-window)
  (global-set-key (kbd "<S-f13>")
                  'previous-multiframe-window)
  ;; Make backtab insert an actual tab character when in insert state
  (defun my-insert-tab ()
    (interactive)
    (insert "	"))
  (define-key evil-insert-state-map [backtab] 'my-insert-tab)
  ;; Make org mode not indent on tab...
                                        ;(setq spacemacs-indent-sensitive-modes 'org)
  ;; Above line doesn't place cursor on bullet on tab
  ;; Why doesn't tab org-cycle ??
  ;; Sometimes it does...

  ;; Strict mode refuses to delete parens sometimes
                                        ;(turn-on-smartparens-strict-mode)
  ;; Use SPC tp to toggle smartparen

  ;; use vaws" as in visual all word surround double-tick to surround something in double-tick
  ;; vaws) to surround in parens. using ( will surround with both space and paren...
  ;; ds( deletes surrounding parens
  ;; ds" deletes surrounding doublequotes etc

  ;; Unimpaired leader keys duplicated to 8 and 9 because [ and ] are hard to reach on my keyboard
  ;; The following is copy-pasted from evil-unimpaired.el
  (define-key evil-normal-state-map (kbd "8 SPC") 'evil-unimpaired/insert-space-above)
  (define-key evil-normal-state-map (kbd "9 SPC") 'evil-unimpaired/insert-space-below)
  (define-key evil-normal-state-map (kbd "8 e") 'move-text-up)
  (define-key evil-normal-state-map (kbd "9 e") 'move-text-down)
  (define-key evil-visual-state-map (kbd "8 e") ":move'<--1")
  (define-key evil-visual-state-map (kbd "9 e") ":move'>+1")
  (define-key evil-normal-state-map (kbd "8 b") 'previous-buffer)
  (define-key evil-normal-state-map (kbd "9 b") 'next-buffer)
  (define-key evil-normal-state-map (kbd "8 f") 'evil-unimpaired/previous-file)
  (define-key evil-normal-state-map (kbd "9 f") 'evil-unimpaired/next-file)
  (define-key evil-normal-state-map (kbd "9 l") 'spacemacs/next-error)
  (define-key evil-normal-state-map (kbd "8 l") 'spacemacs/previous-error)
  (define-key evil-normal-state-map (kbd "9 q") 'spacemacs/next-error)
  (define-key evil-normal-state-map (kbd "8 q") 'spacemacs/previous-error)
  (define-key evil-normal-state-map (kbd "8 t") 'evil-unimpaired/previous-frame)
  (define-key evil-normal-state-map (kbd "9 t") 'evil-unimpaired/next-frame)
  (define-key evil-normal-state-map (kbd "8 w") 'previous-multiframe-window)
  (define-key evil-normal-state-map (kbd "9 w") 'next-multiframe-window)
  (define-key evil-normal-state-map (kbd "8 p") 'evil-unimpaired/paste-above) ; paste above or below with newline
  (define-key evil-normal-state-map (kbd "9 p") 'evil-unimpaired/paste-below)

  ;; Toggle centered cursor mini-mode with SPC t -
  ;; Use auto-completion and flycheck layer when I get home to the Internet
  ;; To scroll page: C-b and C-f

  ;; SPC l 2 creates "layout" number 2 if not already existent (set of windows with displayed buffers)
  ;; Such layouts can be made and saved per project with SPC p l
  ;; Did it but really dunno what it did...

  ;; Cursor is pink in lisp-state and yellow in normal-state

  ;; When in lisp-mode, Enter-button adds newline, indents and also indents complete sexp if there is one
  (define-key lisp-mode-shared-map (kbd "RET") 'sp-newline)
  ;; srefactor is a wonderful thing
  ;; Bring sexp to one line:  SPC m = o
  ;; Format a defun nicely:   SPC m = d
  ;; Try make multiline sexp: SPC m = s
  ;; Wowowow... Somehow remapped to
  ;; M-RET = o
  ;; M-RET = d
  ;; M-RET = s...
  ;; Not available on the laptop!? srefactor is but keybindings are not
  ;; I write "try" because there's per operator rules about how many operands there should be on the first line
  ;; srefactor-lisp-format-sexp will also refuse to create a column of constants...

  ;; Disable matching paren highlighting
  ;; The closest pair of outer parens are always green anyways
  (with-eval-after-load 'smartparens
    (show-smartparens-global-mode -1))
  ;; Press fr to jump to the next r
  ;; Repeat with semicolon
  ;; Step backwards again with K
  ;; OMG I'd rather insert newline above with K
  ;(define-key evil-normal-state-map (kbd "K") 'evil-repeat-find-char-reverse)
  ;; Press \ (backslash) to do stuff in emacs state...

  ;; Delete word with C-w even when autocompletion is on
  (define-key company-active-map (kbd "C-w") 'evil-delete-backward-word)
  ;; Scroll up and down with C-w and C-y
  ;; This is built into Vim

  ;; Navigate up and down in Helm with C-j and C-k
  ;; You can choose with C-l, tab or return
  ;; C-z shows Helm keybindings
  ;; C-SPC marks things in Helm
  ;; When navigating folders in Helm: use C-l and C-h to go into and out of directories

  ;; Open files:
  ;; Any file:     SPC f f (only for files you open for the first time)
  ;; Recent file:  SPC f r
  ;; Project file: SPC p f
  ;; Projects:     SPC p p

  ;; Search in a file: SPC s s (helmswoop. The big thing.)

  ;; SPC o is reserved for user shortcuts. Doesn't work...
  ;(spacemacs/set-leader-keys "oi" 'imenu)
  ;; SPC v (expand region) is extremely handy for lisp code...

  ;; SPC s e is extremely useful for changing variable names...

  ;; describe-key is found at
  ;; SPC h d k
  ;; C-h k (in insert mode)

  ;; SPC h SPC gives what you need to know about spacemacs

  ;; Autocompletion is scrolled with C-j and C-k, and selection done with C-l
  ;; To get docstring of highlighted completion: C-d
  ;; Some completions are actually snippets
  ;; List all snippets with SPC i s
  ;; Learn the most frequently useful ones?

  ;; SPC t s to toggle syntax-checking
  ;; SPC e l to get the errors all listed

  ;; M-. and M-, work both in lisp-files and SLIME REPL

  ;; Make slime selector available through F12 always
  ;; TODO: This keybinding just disappeared while working??
  ;; This doesn't always actually bind the key...
  (global-set-key (kbd "<f12>") 'slime-selector)

  ;; *Messages* says:
  ;;   (Spacemacs) Error in dotspacemacs/user-config: Symbol's value as variable is void: slime-fuzzy-completions-map
  ;;(define-key slime-fuzzy-completions-map (kbd "C-j") 'slime-fuzzy-next)
  ;;(define-key slime-fuzzy-completions-map (kbd "C-k") 'slime-fuzzy-prev)
  ;;(define-key slime-fuzzy-completions-map (kbd "C-l") 'slime-fuzzy-select-or-update-completions)

  ;; Do vim movements in slime
  ;; https://www.common-lisp.net/project/slime/doc/html/Basic-customization.html#Basic-customization
  (eval-after-load 'slime
    `(define-key sldb-mode-map (kbd "j") 'next-line))
  (eval-after-load 'slime
    `(define-key sldb-mode-map (kbd "k") 'previous-line))
  (eval-after-load 'slime
    `(define-key sldb-mode-map (kbd "l") 'evil-forward-char))
  (eval-after-load 'slime
    `(define-key sldb-mode-map (kbd "h") 'evil-backward-char))
  (eval-after-load 'slime
    `(define-key slime-fuzzy-completions-map (kbd "C-j") 'slime-fuzzy-next))
  (eval-after-load 'slime
    `(define-key slime-fuzzy-completions-map (kbd "C-k") 'slime-fuzzy-prev))
  (eval-after-load 'slime
    `(define-key slime-fuzzy-completions-map (kbd "C-l") 'slime-fuzzy-select-or-update-completions))


  ;; Really useful: with cursor on macro sexp, press
  ;; C-c RET to slime-macroexpand-1
  ;; You get an own macroexpansion buffer (which allows the vimmy hjkl keybindings)

  ;; M-n and M-p runs the commands slime-next-note and slime-previous-note

  ;; To navigate forward in inspector, type RET
  ;; To navigate back again, type l
  ;; To look at current keybindings: M-m ? or SPC ?
  ;; To get back vimmy keybindings in sldb: C-z
  ;; You're then back in Evil and lose sldb and inspector-specific key bindings

  ;; Toggle tracing with C-c C-t

  ;; List callers with C-c <.
  ;; TODO: slime xref buffer doesn't behave well

  ;; middle click copy-paste
  (setq x-select-enable-primary t)


  ;; Syntax highlighting in SLIME REPL
  (defvar slime-repl-font-lock-keywords lisp-font-lock-keywords-2)
  (defun slime-repl-font-lock-setup ()
    (setq font-lock-defaults
          '(slime-repl-font-lock-keywords
            ;; From lisp-mode.el
            nil nil (("+-*/.<>=!?$%_&~^:@" . "w")) nil
            (font-lock-syntactic-face-function
             . lisp-font-lock-syntactic-face-function))))
  (add-hook 'slime-repl-mode-hook 'slime-repl-font-lock-setup)
  (defadvice slime-repl-insert-prompt (after font-lock-face activate)
    (let ((inhibit-read-only t))
      (add-text-properties
       slime-repl-prompt-start-mark (point)
       '(font-lock-face
         slime-repl-prompt-face
         rear-nonsticky
         (slime-repl-prompt read-only font-lock-face intangible)))))


  ;; hopefully disable semantic-idle-summary-mode
  (add-hook 'lisp-mode '(lambda ()
                          (semantic-idle-summary-mode nil)
                          (show-paren-mode)
                          ;; I think it might be eldoc mode that clutters my slime-autodoc
                          (eldoc-mode nil)))

  (if (file-exists-p "~/.local_emacs")
      (load-file "~/.local_emacs"))

  ;; Adding SLIME contribs
  ;; Setup load-path, autoloads and your lisp system
  ;;(add-to-list 'load-path "/home/torbjorn/.emacs.d/elpa/slime-20161004.816")
  ;;(require 'slime-autoloads)
  ;; Also setup the slime-fancy contrib
  ;;(add-to-list 'slime-contribs 'slime-fancy)

  ;; Configure next-buffer skipping/nonskipping
  (setq spacemacs-useful-buffers-regexp '("\\*\\(slime-repl \.\+\\|terminal\.\+\\|ansi-term\\|eshell\\)\\*"))
  (defun skip-lisp-inferior (oldfun buffer)
    "Advise spacemacs/useful-buffer-p to exclude *inferior-lisp* buffer even if its in comint mode"
    (if (funcall oldfun buffer)
        (not (with-current-buffer buffer
               (derived-mode-p 'comint-mode)
               (string-equal (buffer-name) "*inferior-lisp*")))))
  (advice-add 'spacemacs/useful-buffer-p :around #'skip-lisp-inferior)

  ;(push "\\*Messages\\*" spacemacs-useless-buffers-regexp)
  ;(push "\\*Shell Command Output\\*" spacemacs-useless-buffers-regexp)
  ;(push "\\*slime-events\\*" spacemacs-useless-buffers-regexp)
  ;(push "\\*inferior-lisp\\*" spacemacs-useless-buffers-regexp)
  ;(kill-buffer "*scratch*")

  ;; Open REPL in sole window
  (slime)
  (spacemacs/toggle-maximize-buffer)
  )

;; do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(evil-want-C-i-jump t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; To make emacsclient launch by default, i put Spacemacsclient.desktop
;; into /usr/share/applications/Spacemacsclient.desktop

;;; .spacemacs ends here



