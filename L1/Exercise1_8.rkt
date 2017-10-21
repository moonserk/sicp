#lang racket

;Упражнение 1.8.
;Метод Ньютона для кубических корней основан на том, что если y является приближением к
;кубическому корню из x, то мы можем получить лучшее приближение по формуле
;x/y^2 + 2y
;_________
;    3
;С помощью этой формулы напишите процедуру вычисления кубического корня, подобную проце-
;дуре для квадратного корня. (В разделе 1.3.4 мы увидим, что можно реализовать общий метод
;Ньютона как абстракцию этих процедур для квадратного и кубического корня.)

(define (square x)
  (* x x))

(define (good-enough? guess x)
  (< (abs (- guess x)) 0.001))

(define (improve guess x)
  (/ (+ (/ x (square guess)) (* 2 guess))
     3))

(define  (average x y)
  (/ (+ x y) 2))

(define (sqrt-iter guess x)
  (if (good-enough? guess (improve guess x))
          guess
          (sqrt-iter (improve guess x)
                     x)))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(sqrt 16)