(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)

(eval-after-load 'flycheck
                '(progn
                   (setq flycheck-highlighting-mode 'lines)
                   (set-face-background 'flycheck-error "red")
                   (set-face-background 'flycheck-warning "orange")))
                (provide 'init-locales)


(add-hook 'go-mode-hook 'go-eldoc-setup)
(eval-after-load "auto-complete"
                 '(progn
                    (require 'auto-complete-config)
                    (require 'go-autocomplete)
                    (ac-config-default)))

(setq desktop-save-mode nil)
(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)
(setq ring-bell-function #'ignore)
