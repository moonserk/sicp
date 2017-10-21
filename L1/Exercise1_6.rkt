#lang racket

;Упражнение 1.6.
;Лиза П. Хакер не понимает, почему if должна быть особой формой. «Почему нельзя просто
;определить ее как обычную процедуру с помощью cond?» — спрашивает она. Лизина подруга Ева
;Лу Атор утверждает, что, разумеется, можно, и определяет новую версию if:
;(define (new-if predicate then-clause else-clause)
;  (cond (predicate then-clause)
;        (else else-clause)))
;Ева показывает Лизе новую программу:
;
;(new-if (= 2 3) 0 5)
;5
;(new-if (= 1 1) 0 5)
;0
;Обрадованная Лиза переписывает через new-if программу вычисления квадратного корня:
;(define (sqrt-iter guess x)
;  (new-if (good-enough? guess x)
;          guess
;          (sqrt-iter (improve guess x)
;                     x)))
;Что получится, когда Лиза попытается использовать эту процедуру для вычисления квадратных
;корней? Объясните

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(new-if (= 2 3) 0 3)
(new-if (= 1 1) 0 1)

(define (square x)
  (* x x))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (improve guess x)
  (average guess (/ x guess)))

(define  (average x y)
  (/ (+ x y) 2))

(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x)
                     x)))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(sqrt 9)

;При использовании функции (new-if) происходит зацикливание программы
;скорее всего из за того что (cond) в от личае от (if) вначале вычисляет варианты,
;а потом применяет придекат.