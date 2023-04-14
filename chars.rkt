#lang racket
;; File: chars.rkt
;; Autores (Nombre y Matrícula): 
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

(define singleChar "[^'\\\\(\\\n)]")

(define simpleSequence "\\\\['\"\\\\abfnrtv0]")

(define char
  (string-append singleChar "|" simpleSequence "|" hexSequence "|" unicodeSequence))

(define charLit
  (string-append "'(" char ")'"))

(define charRegex
  (pregexp charLit))

(define charWrap
  (lambda m
    (string-append "<span class=chars>" (first m) "</span>")))

(define Chars
  (lambda (s)
    (regexp-replace* charRegex s charWrap)))

(provide Chars)