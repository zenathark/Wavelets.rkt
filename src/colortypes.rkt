#lang racket/base

(require multimethod)
(require threading)


(struct RGB8 (red green blue [size #:auto])
  #:auto-value 8)
(struct RGB16 (red green blue [size #:auto])
  #:auto-value 16)
(struct BGR8 (blue green red [size #:auto])
  #:auto-value 8)
(struct BGR16 (blue green red [size #:auto])
  #:auto-value 16)
(define RGB RGB8)

(define-generic (red color))
(define-instance ((red RGB8) color)
  (RGB8-red color))
(define-instance ((red RGB16) color)
  (RGB16-red color))
(define-instance ((red BGR8) color)
  (BGR8-red color))
(define-instance ((red BGR16) color)
  (BGR16-red color))

(define-generic (size color))
(define-instance ((size RGB8) color)
  (RGB8-size color))
(define-instance ((size RGB16) color)
  (RGB16-size color))
(define-instance ((size BGR8) color)
  (BGR8-size color))
(define-instance ((size BGR16) color)
  (BGR16-size color))

(define-generic (green color))
(define-instance ((green RGB8) color)
  (RGB8-green color))
(define-instance ((green RGB16) color)
  (RGB16-green color))
(define-instance ((green BGR8) color)
  (BGR8-green color))
(define-instance ((green BGR16) color)
  (BGR16-green color))

(define-generic (blue color))
(define-instance ((blue RGB8) color)
  (RGB8-blue color))
(define-instance ((blue RGB16) color)
  (RGB16-blue color))
(define-instance ((blue BGR8) color)
  (BGR8-blue color))
(define-instance ((blue BGR16) color)
  (BGR16-blue color))


(struct HSV8 (hue saturation value [size #:auto])
  #:auto-value 8)
(struct HSV16 (hue saturation value [size #:auto])
  #:auto-value 16)
(define HSV HSV8)

(define-generic (hue color))
(define-instance ((hue HSV8) color)
  (HSV8-hue color))
(define-instance ((hue HSV16) color)
  (HSV16-hue color))

(define-instance ((size HSV8) color)
  (HSV8-size color))
(define-instance ((size HSV16) color)
  (HSV16-size color))

(define-generic (saturation color))
(define-instance ((saturation HSV8) color)
  (HSV8-saturation color))
(define-instance ((saturation HSV16) color)
  (HSV16-saturation color))

(define-generic (value color))
(define-instance ((value HSV8) color)
  (HSV8-value color))
(define-instance ((value HSV16) color)
  (HSV16-value color))



(struct HSB8 (hue saturation brightness [size #:auto])
  #:auto-value 8)
(struct HSB16 (hue saturation brightness [size #:auto])
  #:auto-value 16)
(define HSB HSB8)

(define-instance ((hue HSB8) color)
  (HSB8-hue color))
(define-instance ((hue HSB16) color)
  (HSB16-hue color))

(define-instance ((size HSB8) color)
  (HSB8-size color))
(define-instance ((size HSB16) color)
  (HSB16-size color))

(define-instance ((saturation HSB8) color)
  (HSB8-saturation color))
(define-instance ((saturation HSB16) color)
  (HSB16-saturation color))

(define-generic (brightness color))
(define-instance ((brightness HSB8) color)
  (HSB8-brightness color))
(define-instance ((brightness HSB16) color)
  (HSB16-brightness color))



(struct Gray8 (gray [size #:auto])
  #:auto-value 8)
(struct Gray16 (gray [size #:auto])
  #:auto-value 16)
(define Gray Gray8)

(define-generic (gray color))
(define-instance ((gray GRAY8) color)
  (Gray8-gray color))
(define-instance ((gray GRAY16) color)
  (Gray16-gray color))

(define-instance ((size GRAY8) color)
  (Gray8-size color))
(define-instance ((size GRAY16) color)
  (Gray16-size color))

