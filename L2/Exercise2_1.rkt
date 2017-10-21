#lang racket

;Упражнение 2.1.
;Определите улучшенную версию mul-rat, которая принимала бы как положительные, так и
;отрицательные аргументы. Make-rat должна нормализовывать знак так, чтобы в случае, если
;рациональное число положительно, то и его числитель, и знаменатель были бы положительны, а
;если оно отрицательно, то чтобы только его числитель был отрицателен.

(define (make-rat n d)
  (if (or (< n 0) (< d 0)) (cons (- (mod n)) (mod d))
      (cons (mod n) (mod d))))

(define (mod x)
  (if (< x 0) (- x)
      x))

(define (numer x) (car x))

(define (denom x) (cdr x))

(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))

(define (mul-rat x y)
  (make-rat (* (numer x) (denom y))
            (* (denom y) (numer x))))
