#lang racket/base

(require binary-class/base
         binary-class/common
         binary-class/string)

(define-binary-class bmp-tag
  ([identifier (iso-8859-1-string 3)]))
