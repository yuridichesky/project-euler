;; Project Euler
;;
;; http://projecteuler.net/index.php?section=problems&id=9
;; 
;; Problem 9
;; 25 January 2002
;;
;; A Pythagorean triplet is a set of three natural numbers, a<b<c, for which,
;; a² + b² = c²
;;
;; For example, 3² + 4² = 9 + 16 = 25 = 5².
;;
;; There exists exactly one Pythagorean triplet for which a + b + c = 1000.
;; Find the product abc.
;;
;; Answer: 31875000
;;
;; Euclid formula to compute Pythagorean triple found here:
;;   http://en.wikipedia.org/wiki/Pythagorean_triple


(defun p9 ()
  (block xxx
         (loop for m from 2 do
               (loop for n from 1 to m do 
                     (let ((a (- (* m m) (* n n)))
                           (b (* 2 m n))
                           (c (+ (* m m) (* n n))))
                       (if (= 1000 (+ a b c))
                         (return-from xxx (* a b c))))))))


;; end of file
;; vim: ts=4 sw=4 et
