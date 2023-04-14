#lang racket
;; File: operators.rkt
;; Autores: 
;; José Emiliano Riosmena Castañón A01704245
;; Iván Ricardo Paredes Avilez A01705083
;; Fecha: 12 de Abril del 2023

(define csoperators
  (list
   "{" "}" "[" "]" "(" ")" "." "," ":" ";" "+" "-" "*" "/" "%" "&" "|" "^" "!" "~"
   "=" "<" ">" "?" "??" "::" "++" "--" "&&" "||" "->" "==" "!=" "<=" ">=" "+=" "-="
   "*=" "/=" "%=" "&=" "|=" "^=" "<<" "<<=" "=>"))

(define opRegex
  (pregexp (string-append "("
                          (string-join (map
                                        regexp-quote csoperators) "|") ")+")))

(define opWrap
  (lambda m
    (string-append "<span class=operators>" (first m) "</span>")))

(define Operators
  (lambda (s)
    (regexp-replace* opRegex s opWrap)))

(provide Operators)