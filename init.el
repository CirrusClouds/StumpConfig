
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(custom-enabled-themes '(deeper-blue))
 '(custom-safe-themes
   '("b0334e8e314ea69f745eabbb5c1817a173f5e9715493d63b592a8dc9c19a4de6" default))
 '(global-display-line-numbers-mode t)
 '(package-selected-packages
   '(nyan-mode rainbow-delimiters slime ivy elpy restart-emacs ivy-explorer doom-themes doom-modeline lispy rust-mode haskell-mode isortify anaconda-mode auto-virtualenv jedi format-all python-mode python))
 '(send-mail-function 'mailclient-send-it)
 '(show-paren-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Get rid of gross stuff

(if (boundp 'menu-bar-mode)
    (menu-bar-mode -1))
(if (boundp 'tool-bar-mode)
    (tool-bar-mode -1))
(if (boundp 'scroll-bar-mode)
    (scroll-bar-mode -1))
(setq inhibit-startup-screen t)
(setq initial-scratch-message nil)
(setq initial-major-mode 'org-mode)

(line-number-mode 1)
(column-number-mode 1)
(set-frame-font "Inconsolata 12" nil t)
0
;; Melpa

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))


;; Now install the necessary files and then uncomment the rest


;;MODELINE

(require 'doom-modeline)
(require 'nyan-mode)
(nyan-mode 1)
(doom-modeline-mode 1)
(setq doom-modeline-buffer-state-icon t)
(setq doom-modeline-major-mode-icon t)
(setq doom-modeline-major-mode-color-icon t)
(setq doom-modeline-buffer-state-icon t)


;; EXTRA VISUALS

(load-theme 'doom-vibrant t)
(doom-themes-visual-bell-config)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
(global-prettify-symbols-mode +1)

;; IVY

(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
;; enable this if you want `swiper' to use it
;; (setq search-default-mode #'char-fold-to-regexp)


;; PYTHON

(setq python-shell-interpreter "/usr/bin/python3")

(defvar myPackages
  '(better-defaults
    exec-path-from-shell
    elpy
    pyenv-mode))


(elpy-enable)
(setq elpy-rpc-backend "jedi")
(setq elpy-rpc-python-command "python3")



;; COMMON LISP

(load (expand-file-name "~/.quicklisp/slime-helper.el"))
(setq inferior-lisp-program "sbcl")
(add-to-list 'slime-contribs 'slime-repl)
(add-hook 'emacs-lisp-mode-hook (lambda () (lispy-mode 1)))


;; HASKELL

(add-hook 'python-mode-hook 'anaconda-mode)

(require 'haskell-interactive-mode)
(require 'haskell-process)
(add-hook 'haskell-mode-hook 'interactive-haskell-mode)


(define-key haskell-mode-map (kbd "C-c C-l") 'haskell-process-load-or-reload)
(define-key haskell-mode-map (kbd "C-`") 'haskell-interactive-bring)
(define-key haskell-mode-map (kbd "C-c C-t") 'haskell-process-do-type)
(define-key haskell-mode-map (kbd "C-c C-i") 'haskell-process-do-info)
(define-key haskell-mode-map (kbd "C-c C-c") 'haskell-process-cabal-build)
(define-key haskell-mode-map (kbd "C-c C-k") 'haskell-interactive-mode-clear)
(define-key haskell-mode-map (kbd "C-c c") 'haskell-process-cabal)
