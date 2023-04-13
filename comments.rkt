#lang racket
;; File: comments.rkt
;; Autor: José Emiliano Riosmena Castañón
;; Matrícula: A01704245
;; Fecha: 12 de Abril del 2023

;; Comentarios------------------------
(define safe
  (lambda (s)
    (string-append "<[^/>]*>" s "</[^>]*>")))

(define singleLineComment
  (string-append (safe "//") "[^\n]*\\\n"))

(define multiLineComment
  (string-append (safe "/\\*") "(.*)" (safe "\\*/")))

(define commentRegex
  (regexp (string-append singleLineComment "|" multiLineComment)))

(define commentWrap
  (lambda m
    (string-append "<span class=comments>" (first m) "</span>")))

(define Comments
  (lambda (s)
    (regexp-replace* commentRegex s commentWrap)))

(provide Comments)