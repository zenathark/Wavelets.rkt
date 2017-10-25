#lang typed/racket/base

(require math/array)

(struct Orthogonal-Filter ([name : Symbol] [forward-bank : (Array Flonum)]))

(struct wavelet-coefficients ([filter]))
