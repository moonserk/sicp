#lang racket

;Упражнение 2.18.
;Определите процедуру reverse, которая принимает список как аргумент и возвращает список,
;состоящий из тех же элементов в обратном порядке:
;(reverse (list 1 4 9 16 25))
;(25 16 9 4 1)

(define (reverse li)
  (if (null? li)
      li
      (append (reverse (cdr li)) (list (car li)))))

(reverse (list 1 2 3 4 5))