#lang racket

;Упражнение 2.22.
;Хьюго Дум пытается переписать первую из процедур square-list из упражнения 2.21 так,
;чтобы она работала как итеративный процесс:
(define (square x)
  (* x x))

(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons (square (car things))
                    answer))))
  (iter items null))

;К сожалению, такое определение square-list выдает список результатов в порядке, обратном
;желаемому. Почему?
;Затем Хьюго пытается исправить ошибку, обменяв аргументы cons:
(define (square-list-2 items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons answer
                    (square (car things))))))
  (iter items null))
;И так программа тоже не работает. Объясните это.

(square-list (list 1 2 3 4 5))

(square-list-2 (list 1 2 3 4 5))

;В первом случае в аккамулятор answer записывается число потом создается пара с новым числои и
;акамулятором в котором уже имеется переменная (cons 2 '(1)) (cons 3 '(2 1)) и т. д.

;Во втором случае к аккамулятору консится число но в аккамуляторе в конце листа имеется
;конец листа (null), (cons '((null)1 null) 2) (cons '(((null) 1 null) 2))
;(cons '((((null)1 null) 2) 3)) и т. д.
