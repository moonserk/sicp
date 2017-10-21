#lang racket

;Упражнение 2.17.
;Определите процедуру last-pair, которая возвращает список, содержащий только последний
;элемент данного (непустого) списка.
;(last-pair (list 23 72 149 34))
;(34)

(define (last-pair list)
  (if (null? (cdr list))
      (car list)
      (last-pair (cdr list))))

(last-pair (list 1 2 3 4 5))