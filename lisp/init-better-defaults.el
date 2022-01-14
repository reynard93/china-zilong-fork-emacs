;;;;  -*- lexical-binding: t; -*-

(require 'init-funcs)


(with-eval-after-load 'dired
  (progn
    (require 'dired-x)
    (require 'dired-aux)

    (setq dired-listing-switches "-alh")
    (setq dired-guess-shell-alist-user
          '(("\\.pdf\\'" "open")
            ("\\.docx\\'" "open")
            ("\\.\\(?:djvu\\|eps\\)\\'" "open")
            ("\\.\\(?:jpg\\|jpeg\\|png\\|gif\\|xpm\\)\\'" "open")
            ("\\.\\(?:xcf\\)\\'" "open")
            ("\\.csv\\'" "open")
            ("\\.tex\\'" "open")
            ("\\.\\(?:mp4\\|mkv\\|avi\\|flv\\|ogv\\)\\(?:\\.part\\)?\\'"
             "open")
            ("\\.\\(?:mp3\\|flac\\)\\'" "open")
            ("\\.html?\\'" "open")
            ("\\.md\\'" "open")))

    (setq dired-omit-files
          (concat dired-omit-files "\\|^.DS_Store$\\|^.projectile$\\|\\.js\\.meta$\\|\\.meta$"))

    ;; always delete and copy recursively
    (setq dired-recursive-deletes 'always)
    (setq dired-recursive-copies 'always)
	 (evil-define-key 'normal dired-mode-map
                                 (kbd "C-k") 'zilongshanren/dired-up-directory
                                 "<RET>" 'dired-find-alternate-file
                                 "E" 'dired-toggle-read-only
                                 "C" 'dired-do-copy
                                 "<mouse-2>" 'my-dired-find-file
                                 "`" 'dired-open-term
                                 "gr" 'revert-buffer
                                 "z" 'dired-get-size
                                 "c" 'dired-copy-file-here
                                 "J" 'counsel-find-file
                                 "f" 'zilongshanren/open-file-with-projectile-or-counsel-git
                                 ")" 'dired-omit-mode
      )

    (define-key dired-mode-map "e" 'ora-ediff-files))

    )

(provide 'init-better-defaults)
