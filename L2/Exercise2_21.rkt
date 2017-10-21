#lang racket

;Упражнение 2.21.
;Процедура square-list принимает в качестве аргумента список чисел и возвращает список
;квадратов этих чисел.
;(square-list (list 1 2 3 4))
;(1 4 9 16)
;Перед Вами два различных определения square-list. Закончите их, вставив пропущенные вы-
;ражения:
;(define (square-list items)
;  (if (null? items)
;  nil
;  (cons [??] [??])))
;(define (square-list items)
;  (map [??] [??]))

(define (square-list items)
  (if (null? items)
      null
      (cons (* (car items) (car items)) (square-list (cdr items)))))

(define (square-list-m items)
  (map (λ (x) (* x x)) items))

(square-list (list 1 2 3 4))
(square-list-m (list 1 2 3 4))