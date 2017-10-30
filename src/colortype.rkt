#lang racket/base

(require multimethod)
;;---------------
;;-----RGB Colors
(struct AbstractRGB ())
;; 8bit per channel RGB
(struct RGB8 AbstractRGB (red green blue [size #:auto])
  #:auto-value 8)
(struct BGR8 AbstractRGB (blue green red [size #:auto])
  #:auto-value 8)
;; 16bit per channel RGB
(struct RGB16 AbstractRGB (red green blue [size #:auto])
  #:auto-value 16)
(struct BGR16 AbstractRGB (blue green red [size #:auto])
  #:auto-value 16)
;; Alias to 8bit color
(struct RGB RGB8 ())
(struct BGR BGR8 ())

(define-generic (red color))
(define-instance ((red RGB8) color)
  (RGB8-red color))
(define-instance ((red RGB16) color)
  (RGB16-red color))

;;---------------
;;-----Gray Color
(struct AbstractGray ())
;; 8bit channel gray
(struct Gray8 AbstractGray (gray))
;; 16bit channel gray
(struct Gray16 AbstractGray (gray))
;; Alias to 8bit Gray
(struct Gray Gray8 (gray))
