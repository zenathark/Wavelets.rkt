#lang racket/base

(struct Int ())

(struct UInt8 Int (n [size #:auto])
  #:auto-value 8)

(define-syntax-rule (make-int lenght)
  )
