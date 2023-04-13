#lang racket
;; File: operators.rkt
;; Autor: José Emiliano Riosmena Castañón
;; Matrícula: A01704245
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