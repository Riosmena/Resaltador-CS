#lang racket
;; File: reals.rkt
;; Autor: José Emiliano Riosmena Castañón
;; Matrícula: A01704245
;; Fecha: 12 de Abril del 2023

(define safe
  (lambda (s)
    (string-append "(<[^/>]*>" s "</[^>]*>)")))

(define decimalDigit "[0-9]")

(define realDecimalDigit
  (string-append "(_*" decimalDigit ")"))

(define realType "[FfDdMm]")

(define sign
  (safe "(\\+|-)"))

(define exponent
  (string-append "([eE]" sign "?"
                 decimalDigit realDecimalDigit "*)"))

(define realLit
  (string-append "\\s(" decimalDigit realDecimalDigit "*"
                 (safe "\\.") decimalDigit realDecimalDigit "*"
                 exponent "?" realType "?" (safe "\\.")
                 decimalDigit realDecimalDigit "*" exponent "?"
                 realType "?|" decimalDigit realDecimalDigit "*"
                 exponent realType "?|" decimalDigit realDecimalDigit "*"
                 realType ")\\b"))

(define realRegex
  (pregexp realLit))

(define realWrap
  (lambda m
    (string-append "<span class=reals>" (first m) "</span>")))

(define Reals
  (lambda (s)
    (regexp-replace* realRegex s realWrap)))

(provide Reals)