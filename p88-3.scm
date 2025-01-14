;; 2010-03-15
;; 2010-04-21
;;
;; Yuri Arapov <yuridichesky@gmail.com>
;;
;; http://projecteuler.net/index.php?section=problems&id=88
;;
;; Problem 88
;; 04 February 2005
;;
;; A natural number, N, that can be written as the sum and product of a given
;; set of at least two natural numbers, {a1, a2, ... , ak} is called a
;; product-sum number: N = a1 + a2 + ... + ak = a1 x a2 x ... x ak.
;;
;; For example, 6 = 1 + 2 + 3 = 1 x 2 x 3.
;;
;; For a given set of size, k, we shall call the smallest N with this property
;; a minimal product-sum number. The minimal product-sum numbers for sets of
;; size, k = 2, 3, 4, 5, and 6 are as follows.
;;
;; k=2:  4 = 2 x 2                 = 2 + 2
;; k=3:  6 = 1 x 2 x 3             = 1 + 2 + 3
;; k=4:  8 = 1 x 1 x 2 x 4         = 1 + 1 + 2 + 4
;; k=5:  8 = 1 x 1 x 2 x 2 x 2     = 1 + 1 + 2 + 2 + 2
;; k=6: 12 = 1 x 1 x 1 x 1 x 2 x 6 = 1 + 1 + 1 + 1 + 2 + 6
;;
;; Hence for 2 <= k <= 6, the sum of all the minimal product-sum numbers is
;; 4+6+8+12= 30; note that 8 is only counted once in the sum.
;;
;; In fact, as the complete set of minimal product-sum numbers for 2 <= k <= 12 is 
;; {4, 6, 8, 12, 15, 16}, the sum is 61.
;;
;; What is the sum of all the minimal product-sum numbers for 2 <= k <= 12000?
;;
;; Answer: 7587457
;;

(load "uniq.scm")

(load "png.scm")
(define *png* (make-primes-generator))


;; Factorize number n: return list of the primes which product gives n.
;;
(define (factorize n)

  (define (divisor? d n) (zero? (remainder n d)))

  (let loop ((p (*png* 'first))
             (n n)
             (res '()))
    (cond ((= 1 n) res)
          ((divisor? p n) (loop p (/ n p) (cons p res)))
          (else
            (loop (*png* 'next) n res)))))


(define (refactor s)
  (cond 
    ((null? s) '())
    ((null? (cdr s)) '())
    (else
      (let loop ((head '())
                 (e (car s))
                 (tail (cdr s))
                 (res '()))
        (cond 
          ((null? tail) res)
          (else
            (loop (append head (list e))
                  (car tail)
                  (cdr tail)
                  (append res (list (append head
                                            (list (* e (car tail)))
                                            (cdr tail)))))))))))


(define (number->factors n)
  (define (pack s)
    (let ((x (refactor s)))
      (append x (apply append (map pack x)))))
  (let ((f (factorize n)))
    (append (list f) (pack f))))

;; end of file
;; vim: sw=4 ts=4
