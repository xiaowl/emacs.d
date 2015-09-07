;(require 'ensime)
;(add-hook 'scala-mode-hook
;          'ensime-scala-mode-hook)
;(require 'scala-eldoc)
;(add-hook 'scala-mode-hook
;          'scala-eldoc-setup)

(add-hook 'before-save-hook 'gofmt-before-save)

(require 'powerline)
(powerline-default-theme)
(load-theme 'sanityinc-tomorrow-day)
;(load-theme 'monokai)
(require 'helm-config)
(global-set-key (kbd "M-x") 'helm-M-x)
(helm-mode 1)
(yas-global-mode 1)
(projectile-global-mode)
(setq split-width-threshold 140)
(setq echo-keystrokes 0.1)


(defun xah-copy-line-or-region ()
  "Copy current line, or text selection.
When `universal-argument' is called first, copy whole buffer (but respect `narrow-to-region')."
  (interactive)
  (let (p1 p2)
    (if (null current-prefix-arg)
        (progn (if (use-region-p)
                   (progn (setq p1 (region-beginning))
                          (setq p2 (region-end)))
                 (progn (setq p1 (line-beginning-position))
                        (setq p2 (line-end-position)))))
      (progn (setq p1 (point-min))
             (setq p2 (point-max))))
    (kill-ring-save p1 p2)))
(global-set-key (kbd "C-c c") 'xah-copy-line-or-region)

(defun xwl-open-region-file ()
  (interactive)
  (if (use-region-p)
      (let ((path (buffer-substring-no-properties (region-beginning) (region-end))))
        (if (file-exists-p path)
            (view-file path)
          (message "File doesn't exist.")))
    (message "Please select a region.")))
(global-set-key (kbd "C-c f") 'xwl-open-region-file)


(prefer-coding-system 'utf-8)
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(tool-bar-mode -1)
(customize-set-variable 'wakatime-cli-path "/usr/local/bin/wakatime")
(customize-set-variable 'wakatime-api-key "bd4a0f1e-628b-4731-81ba-5e300d3b0a6e")
(global-wakatime-mode)

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.html$" . web-mode))

(provide 'init-local)
