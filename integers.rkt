#lang racket
;; File: integers.rkt
;; Autores (Nombre y Matrícula): 
;; José Emiliano Riosmena Castañón A01704245
;; Iván Ricardo Paredes Avilez A01705083
;; Fecha: 12 de Abril del 2023

(define intType "([uU][lL]?|[lL][uU]?)")

(define decimalDigit "(_*[0-9])")

(define decimalInteger
  (string-append "[0-9]" decimalDigit "*" intType "?"))

;; Hexadecimales-------------

(define hexDigit "[0-9|A-F|a-f]")

(define intHexDigit
  (string-append "(_*" hexDigit ")"))

(define hexInteger
  (string-append "(0x|0X)" intHexDigit "+" intType "?"))

;; Binarios------------------

(define binaryDigit "(0|1)")

(define intBinaryDigit
  (string-append "(_*" binaryDigit ")"))

(define binaryInteger
  (string-append "(0b|0B)" intBinaryDigit "+" intType "?"))

(define intLit
  (string-append "\\b(" decimalInteger "|" hexInteger "|" binaryInteger ")\\b"))

(define intRegex
  (pregexp intLit))

(define intWrap
  (lambda m
    (string-append "<span class=integers>" (first m) "</span>")))

(define Integers
  (lambda (s)
    (regexp-replace* intRegex s intWrap)))

(provide Integers)