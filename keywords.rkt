#lang racket
;; File: keywords.rkt
;; Autores: 
;; José Emiliano Riosmena Castañón A01704245
;; Iván Ricardo Paredes Avilez A01705083
;; Fecha: 12 de Abril del 2023

(define cskeywords
  (list
   "abstract" "as" "base" "bool" "break" "byte" "case" "catch" "char" "checked"
   "class" "const" "continue" "decimal" "default" "delegate" "do" "double" "else"
   "enum" "event" "explicit" "extern" "false" "finally" "fixed" "float" "for" "foreach"
   "goto" "if" "implicit" "in" "int" "interface" "internal" "is" "lock" "long" "namespace"
   "new" "null" "object" "operator" "out" "override" "params" "private" "protected"
   "public" "readonly" "ref" "return" "sbyte" "sealed" "short" "sizeof" "stackalloc"
   "static" "string" "struct" "switch" "this" "throw" "true" "try" "typeof" "uint"
   "ulong" "unchecked" "unsafe" "ushort" "using" "virtual" "void" "volatile" "while"))

(define keyRegex
  (pregexp
   (string-append "(?![^<]*>)\\b("
                  (string-join
                   (map
                    regexp-quote cskeywords) "|") ")\\b")))


(define keyWrap
  (lambda m
    (string-append "<span class=keywords>" (first m) "</span>")))

(define Keywords
  (lambda (s)
    (regexp-replace* keyRegex s keyWrap)))

(provide Keywords)