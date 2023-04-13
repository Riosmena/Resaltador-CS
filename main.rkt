#lang racket
;; File: main.rkt
;; Autor: José Emiliano Riosmena Castañón
;; Matrícula: A01704245
;; Fecha: 12 de Abril del 2023

;; Archivos-----------------
(require "comments.rkt")
(require "chars.rkt")
(require "integers.rkt")
(require "operators.rkt")
(require "reals.rkt")
(require "strings.rkt")
(require "keywords.rkt")

;; Lectura de archivos------
(define inputFile
  (file->string "input.txt"))

;; Resaltadores-------------
(define highlight
  (Integers
   (Reals
    (Strings
     (Chars
      (Keywords
       (Comments
        (Operators inputFile))))))))

;; Salidas------------------
(define output
  (string-append
   "<head>
     <link rel='stylesheet' type='text/css' href='estilos.css'>
     <title>Resaltador de sintaxis</title>
    </head>
    <style>
      span *{color:inherit !important}
    </style>
    <pre>"
   highlight
   "</pre>"))

;; Archivo de salida--------
(define outputFile
  (open-output-file "index.html" #:exists 'replace))
(write-string output outputFile)
(close-output-port outputFile)