#lang racket

;Упражнение 1.16.
;Напишите процедуру, которая развивается в виде итеративного процесса и реализует возведение в
;степень за логарифмическое число шагов, как fast-expt. (Указание: используя наблюдение, что
;(b^n/2)^2 = (b^2)^n/2
;, храните, помимо значения степени n и основания b, дополнительную перемен-
;ную состояния a, и определите переход между состояниями так, чтобы произведение ab^n
;от шага к шагу не менялось. Вначале значение a берется равным 1, а ответ получается как значение a в
;момент окончания процесса. В общем случае метод определения инварианта (invariant quantity),
;который не изменяется при переходе между шагами, является мощным способом размышления о
;построении итеративных алгоритмов.)

(define (square x)
  (* x x))

(define (expt b n)
  (display n)
  (if (= n 0)
      1
      (* b (expt b (- n 1)))))

(expt 2 8)

(define (expt-iter b n)
  (define (iter acc n)
    (display n)
    (if (= n 0)
        acc
        (iter (* acc b) (- n 1))))
  (iter 1 n))

(expt-iter 2 8)

(define (expt-fast b n)
  (display n)
  (cond ((= n 0) 1)
        ((even? n) (square (expt-fast b (/ n 2))))
        (else (* b (expt-fast b (- n 1))))))

(expt-fast 2 8)

(define (expt-iter-fast b n)
  (define (iter acc b n)
    (display n)
    (cond ((= n 0) acc)
          ((even? n) (iter acc (square b) (/ n 2)))
          (else (iter (* acc b) b (- n 1)))))
  (iter 1 b n))

(expt-iter-fast 2 8)
