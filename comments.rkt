#lang racket
;; File: comments.rkt
;; Autores (Nombre y Matrícula): 
;; José Emiliano Riosmena Castañón A01704245
;; Iván Ricardo Paredes Avilez A01705083
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