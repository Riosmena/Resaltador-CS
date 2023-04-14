#lang racket
;; File: strings.rkt
;; Autores: 
;; José Emiliano Riosmena Castañón A01704245
;; Iván Ricardo Paredes Avilez A01705083
;; Fecha: 12 de Abril del 2023

(define hexDigit "[0-9A-Fa-f]")

(define unicodeSequence
  (string-append
   (string-append "\\\\u" hexDigit hexDigit hexDigit hexDigit) "|"
   (string-append "\\\\U" hexDigit hexDigit hexDigit hexDigit hexDigit hexDigit hexDigit hexDigit)))

(define hexSequence
  (string-append "\\\\x" hexDigit hexDigit "?" hexDigit "?" hexDigit "?"))

(define simpleSequence "\\\\['\"\\\\abfnrtv0]")

(define singleString "[^\"\\\\]")

(define regularString
  (string-append "(" singleString "|" simpleSequence "|" hexSequence "|" unicodeSequence ")"))

(define regularStringLit
  (string-append "\"" regularString "*" "\""))

(define quoteSequence "\"\"")

(define singleStringLit "[^\"]")

(define verbatimString
  (string-append "(" singleStringLit "|" quoteSequence ")"))

(define verbatimStringLit
  (string-append "@\"" verbatimString "*" "\""))

(define stringLit
  (string-append "(" regularStringLit "|" verbatimStringLit ")"))

(define stringWrap
  (lambda m
    (string-append "<span class=strings>" (first m) "</span>")))

(define stringRegex
  (pregexp stringLit))

(define Strings
  (lambda (s)
    (regexp-replace* stringRegex s stringWrap)))

(provide Strings)