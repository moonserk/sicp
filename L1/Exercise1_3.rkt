#lang racket

;Упражнение 1.3.
;Определите процедуру, которая принимает в качестве аргументов три числа и возвращает сумму
;квадратов двух больших из них.

(define (square x)
  (* x x))
(define (sum-of-square a b)
  (+ (square a) (square b)))

(define (sum-big-square a b c)
  (cond ((and (> a c) (> b c)) (sum-of-square a b))
        ((and (> a b) (> c b)) (sum-of-square a c))
        ((and (> b a) (> c a)) (sum-of-square b c))))