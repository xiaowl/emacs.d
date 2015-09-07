(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)

(eval-after-load 'flycheck
                '(progn
                   (setq flycheck-highlighting-mode 'lines)
                   (set-face-background 'flycheck-error "red")
                   (set-face-background 'flycheck-warning "orange")))
                (provide 'init-locales)

(when (or window-system (locale-is-utf8-p))
  (setq utf-translate-cjk-mode nil) ; disable CJK coding/encoding (Chinese/Japanese/Korean characters)
  (set-language-environment 'utf-8)
  (setq locale-coding-system 'utf-8)
  (set-default-coding-systems 'utf-8)
  (set-terminal-coding-system 'utf-8)
  (set-selection-coding-system (if (eq system-type 'windows-nt) 'utf-16-le 'utf-8))
  (prefer-coding-system 'utf-8))

(add-hook 'go-mode-hook 'go-eldoc-setup)
(eval-after-load "auto-complete"
                 '(progn
                    (require 'auto-complete-config)
                    (require 'go-autocomplete)
                    (ac-config-default)))

(setq desktop-save-mode nil)
(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)
(setq ring-bell-function #'ignore)
