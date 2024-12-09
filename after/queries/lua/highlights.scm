;; extends 

(("and" @keyword.function) (#set! conceal "&"))
(("return" @keyword.function) (#set! conceal "R"))
(("then" @conditional) (#set! conceal "t"))
(("else" @conditional) (#set! conceal "e"))
(("elseif" @conditional) (#set! conceal "e"))
(("end" @keyword.function) (#set! conceal "E"))
(("for" @keyword) (#set! conceal "F"))
(("function" @keyword.function) (#set! conceal "f"))
(("if" @conditional) (#set! conceal "?"))
((function_call name: (identifier) @function.builtin (#eq? @function.builtin "require")) (#set! conceal "R"))
(("do" @repeat) (#set! conceal "d"))
(("in" @keyword) (#set! conceal "i"))
