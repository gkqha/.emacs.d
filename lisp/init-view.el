;;; init-view.el --- Theme.
;;; Commentary:
;;; Code:
;; Init theme as spacemacs-dark
(use-package spacemacs-common
    :ensure spacemacs-theme
    :config (load-theme 'spacemacs-light t))


(use-package powerline
  :ensure t
  :config
  ;; (powerline-default-theme)
  ;; (powerline-center-theme)
  (powerline-center-evil-theme))


(use-package dired-sidebar
  :bind (("C-x C-n" . dired-sidebar-toggle-sidebar))
  :ensure t
  :commands (dired-sidebar-toggle-sidebar)
  :init
  (add-hook 'dired-sidebar-mode-hook
            (lambda ()
              (unless (file-remote-p default-directory)
                (auto-revert-mode))))
  :config
  (push 'toggle-window-split dired-sidebar-toggle-hidden-commands)
  (push 'rotate-windows dired-sidebar-toggle-hidden-commands)

  (setq dired-sidebar-subtree-line-prefix "__")
  (setq dired-sidebar-use-term-integration t)
  (setq dired-sidebar-use-custom-font t))


(use-package ibuffer-sidebar
  :ensure t
  :commands (ibuffer-sidebar-toggle-sidebar))


(defun sidebar-toggle ()
  "Toggle both `dired-sidebar' and `ibuffer-sidebar'."
  (interactive)
  (dired-sidebar-toggle-sidebar)
  (ibuffer-sidebar-toggle-sidebar))


(use-package highlight-indent-guides
  :ensure t
  :hook (prog-mode . highlight-indent-guides-mode)
  :config
  (setq highlight-indent-guides-method 'character) ;; 'fill , 'column, 'character
  (setq highlight-indent-guides-character ?\|)	   ;; customize specific character
  ;; By default, this mode dynamically choose colors that look acceptable with the loaded theme
  ;; the percentages can be tweaked to make the colors more intense or subtle.
  (setq highlight-indent-guides-auto-odd-face-perc 15)
  (setq highlight-indent-guides-auto-even-face-perc 15)
  (setq highlight-indent-guides-auto-character-face-perc 20)
  ;; Or to set the colors manually, disable this feature and customize the faces directly
  (setq highlight-indent-guides-auto-enabled nil)
  ;; (set-face-background 'highlight-indent-guides-odd-face "darkgray")
  (set-face-background 'highlight-indent-guides-odd-face "green")
  ;; (set-face-background 'highlight-indent-guides-even-face "dimgray")
  (set-face-background 'highlight-indent-guides-even-face "blue")
  ;; (set-face-foreground 'highlight-indent-guides-character-face "dimgray"))
  (set-face-foreground 'highlight-indent-guides-character-face "#75715e")
  :diminish)


(provide 'init-view)
;;; init-view.el ends here
