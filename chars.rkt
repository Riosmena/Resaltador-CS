#lang racket
;; File: chars.rkt
;; Autor: José Emiliano Riosmena Castañón
;; Matrícula: A01704245
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