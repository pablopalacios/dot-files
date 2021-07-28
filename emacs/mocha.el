(defun mocha-results-reload () (interactive) (revert-buffer t t))

(defvar mocha-results-mode-map
  (let ((map (make-sparse-keymap)))
  (define-key map "r" 'mocha-results-reload)
  (define-key map "n" 'next-line)
  (define-key map "p" 'previous-line)
  map)
  "Keymap for mocha mode")

(define-derived-mode mocha-results-mode mocha-compilation-mode "mocha-results"
  "major mode for navigating mocha results"
  :keymap mocha-results-mode-map
  )
(add-to-list 'auto-mode-alist '("\\.mocha\\'" . mocha-results-mode))


(defun cleanup-tests ()
  (interactive)
  (beginning-of-buffer)
  (delete-matching-lines "enzymeIntlUtils")
  (delete-matching-lines "react-intl")
  (delete-matching-lines "const intl =")

  (beginning-of-buffer)
  (replace-string "shallowWithIntl" "shallow")

  (beginning-of-buffer)
  (replace-string "mountWithIntl" "mount")

  (beginning-of-buffer)
  (replace-string "intl = buildIntl()," "")

  (beginning-of-buffer)
  (replace-string " buildIntl()," "")

  (beginning-of-buffer)
  (replace-string " intl," "")

  (beginning-of-buffer)
  (replace-string "(intl, " "(")

  (beginning-of-buffer)
  (replace-string ", intl)" ")")

  (beginning-of-buffer)
  (replace-string "intl" "")

  (beginning-of-buffer)
  (forward-sentence)
  (newline)
  (insert "import { shallow } from 'enzyme';")

  (save-buffer)
  (mocha-test-file))
