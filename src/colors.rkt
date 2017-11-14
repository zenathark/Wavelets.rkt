#lang racket/base

(require "colortype.rkt"
         racket/match
         racket/class
         racket/gui)

(define/match (convert type color)
  [('Gray (RGB r g b)) (+ (* 0.299 r)
                           (* 0.587 g)
                           (* 0.114 b))])

(define (bitmap->color-matrix img)
  (let* ([height    (send img get-height)]
         [width     (send img get-width)]
         [new-bytes (make-bytes (* 4 height width))])
    (send img get-argb-pixels 0 0 (sub1 height) (sub1 width) new-bytes)
    (for/vector ([i height])
      (for/vector ([j width])
        (let ([red   (bytes-ref new-bytes (+ (* i height 4) (* 4 j) 1))]
              [green (bytes-ref new-bytes (+ (* i height 4) (* 4 j) 2))]
              [blue  (bytes-ref new-bytes (+ (* i height 4) (* 4 j) 3))])
          (RGB red green blue))))))

(define (convert-color-matrix type image)
  (for/vector ([i image])
    (for/vector ([j i])
      (convert type j))))

(define (mtx-ref image i j)
  (vector-ref (vector-ref image i) j))

(define (shape image)
  `(,(vector-length image) . ,(vector-length (vector-ref image 0))))


(define (gray-matrix->bitmap img)
  (let* ([height    (send img get-height)]
         [width     (send img get-width)]
         [new-bytes (make-bytes (* 4 height width))])
    (send img get-argb-pixels 0 0 (sub1 height) (sub1 width) new-bytes)
    (for/vector ([i height])
      (for/vector ([j width])
        (let ([red   (bytes-ref new-bytes (+ (* i height 4) (* 4 j) 1))]
              [green (bytes-ref new-bytes (+ (* i height 4) (* 4 j) 2))]
              [blue  (bytes-ref new-bytes (+ (* i height 4) (* 4 j) 3))])
          (RGB red green blue))))))
