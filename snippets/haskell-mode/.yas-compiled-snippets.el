;;; Compiled snippets and support files for `haskell-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'haskell-mode
                     '(("case" "case ${1:x} of\n    ${2:Data} -> ${4:expression}\n    ${3:Data} -> ${5:expression}$0" "case" nil nil
                        ((yas-indent-line 'fixed))
                        nil nil nil)
                       ("{-" "{- $0 -}" "block comment" nil nil nil nil nil nil)
                       ("=>" "(${1:Class} ${2:m}) => $0" "Type constraint" nil nil nil nil nil nil)
                       ("data" "data ${1:Type} = ${2:Data}$0 ${3:deriving (${4:Show, Eq})}" "inline data"
                        (=
                         (length "data")
                         (current-column))
                        nil nil nil nil nil)
                       ("data" "data ${1:Type} = $1\n    { ${2:field} :: ${3:Type}\n    , ${4:field} :: ${5:Type}$0\n    } ${6:deriving (${7:Show, Eq})}" "record data"
                        (=
                         (length "data")
                         (current-column))
                        nil nil nil nil nil)
                       ("fn" "${1:f} :: ${2:a} ${3:-> ${4:b}}\n$1 ${5:x} = ${6:expression}$0" "simple function"
                        (=
                         (length "fn")
                         (current-column))
                        nil
                        ((yas-indent-line 'fixed))
                        nil nil nil)
                       ("fn" "${1:f} :: ${2:a} ${3:-> ${4:b}}\n$1 ${5:pattern} = ${7:expression}\n$1 ${6:pattern} = ${8:expression}$0" "clause function"
                        (=
                         (length "fn")
                         (current-column))
                        nil
                        ((yas-indent-line 'fixed))
                        nil nil nil)
                       ("fn" "${1:f} :: ${2:a} ${3:-> ${4:b}}\n$1 ${5:x}\n    | ${6:conditional} = ${8:expression}\n    | ${7:conditional} = ${9:expression}$0" "guarded function"
                        (=
                         (length "fn")
                         (current-column))
                        nil
                        ((yas-indent-line 'fixed))
                        nil nil nil)
                       ("<-" "${1:x} <- ${2:expression}$0" "monadic get" nil nil nil nil nil nil)
                       ("if" "if ${1:condition}\n    then ${2:expression}\n    else ${3:expression}$0" "block if" nil nil nil nil nil nil)
                       ("if" "if ${1:condition} then ${2:expression} else ${3:expression}$0" "inline if" nil nil nil nil nil nil)
                       ("imp" "import           ${1:Module} ${2:(${3:f})}" "simple import"
                        (=
                         (length "imp")
                         (current-column))
                        nil nil nil nil nil)
                       ("imp" "import qualified ${1:Module} as ${2:${1:$(let ((name (car (last (split-string yas-text \"\\\\\\.\")))))\n                                              (if (not (nil-blank-string name)) \"\"\n                                                  (subseq name 0 1)))}}$0" "qualified import"
                        (=
                         (length "imp")
                         (current-column))
                        nil nil nil nil nil)
                       ("inst" "instance ${1:Class} ${2:Data} where\n    ${3:f} = ${4:expression}$0" "instance"
                        (=
                         (length "inst")
                         (current-column))
                        nil nil nil nil nil)
                       ("\\" "\\\\${1:x} -> ${2:expression}$0" "lambda" nil nil nil nil nil nil)
                       ("lang" "{-# LANGUAGE `(progn (require 'haskell-yas) (haskell-yas-complete \"Extension: \" haskell-yas-ghc-language-pragmas))` #-}" "language pragma"
                        (=
                         (length "lang")
                         (current-column))
                        nil nil nil nil nil)
                       ("let" "let ${1:x} = ${2:expression}$0" "let" nil nil nil nil nil nil)
                       ("main" "module Main where\n\nmain :: IO ()\nmain = do\n  ${1:expression}$0\n  return ()" "main module"
                        (=
                         (length "main")
                         (current-column))
                        nil
                        ((yas-indent-line 'fixed))
                        nil nil nil)
                       ("mod" "module ${1:`(if (not buffer-file-name) \"Module\"\n                (let ((name (file-name-sans-extension (buffer-file-name))))\n                     (if (search \"src/\" name)\n                         (replace-regexp-in-string \"/\" \".\" (car (last (split-string name \"src/\"))))\n                         (file-name-nondirectory name))))`} where\n\n$0" "simple module"
                        (=
                         (length "mod")
                         (current-column))
                        nil
                        ((yas-indent-line 'fixed))
                        nil nil nil)
                       ("mod" "module ${1:`(if (not buffer-file-name) \"Module\"\n                (let ((name (file-name-sans-extension (buffer-file-name))))\n                     (if (search \"src/\" name)\n                         (replace-regexp-in-string \"/\" \".\" (car (last (split-string name \"src/\"))))\n                         (file-name-nondirectory name))))`}\n    ( ${3:export}\n    ${4:, ${5:export}}\n    ) where\n\n$0" "exports module"
                        (=
                         (length "mod")
                         (current-column))
                        nil
                        ((yas-indent-line 'fixed))
                        nil nil nil)
                       ("new" "newtype ${1:Type} = $1 { un$1 :: ${2:a} } ${3:deriving (${4:Show, Eq})}" "newtype"
                        (=
                         (length "new")
                         (current-column))
                        nil nil nil nil nil)))


;;; Do not edit! File generated at Mon Aug  5 20:34:44 2013
