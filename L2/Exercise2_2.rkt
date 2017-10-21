#lang racket

;Упражнение 2.2.
;Рассмотрим задачу представления отрезков прямой на плоскости. Каждый отрезок представляется
;как пара точек: начало и конец. Определите конструктор make-segment и селекторы startsegment
;и end-segment, которые определяют представление отрезков в терминах точек. Далее,
;точку можно представить как пару чисел: координата x и координата y. Соответственно, напиши-
;те конструктор make-point и селекторы x-point и y-point, которые определяют такое пред-
;ставление. Наконец, используя свои селекторы и конструктор, напишите процедуру midpointsegment,
;которая принимает отрезок в качестве аргумента и возвращает его середину (точку,
;координаты которой являются средним координат концов отрезка). Чтобы опробовать эти проце-
;дуры, Вам потребуется способ печатать координаты точек:
;(define (print-point p)
; (newline)
; (display "(")
; (display (x-point p))
; (display ",")
; (display (y-point p))
; (display ")"))

(define (make-segment a b)
  (cons a b))

(define (start-segment a)
  (car a))

(define (end-segment b)
  (cdr b))

(define (make-point x y)
  (cons x y))

(define (x-point x)
  (car x))

(define (y-point y)
  (cdr y))

(define (midpoint-segment seg)
  (cons (/ (+ (x-point (start-segment seg)) (x-point (end-segment seg))) 2)
        (/ (+ (y-point (start-segment seg)) (y-point (end-segment seg))) 2)))

(define (print-point p)
   (newline)
   (display "(")
   (display (x-point p))
   (display ",")
   (display (y-point p))
   (display ")"))

;(print-point (midpoint-segment (make-segment (make-point 0 0) (make-point 2 2))))

(provide make-segment make-point midpoint-segment)
