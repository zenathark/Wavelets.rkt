#lang racket/base

(require "colortype.rkt"
         racket/match)

(define/match (convert type color)
  [('Gray (RGB r g b)) (+ (* 0.299 r)
                           (* 0.587 g)
                           (* 0.114 b))])

(define (bitmap->raster img)
  (for*/vector [i (send img get-height)] ))
