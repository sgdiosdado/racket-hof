#lang racket

; agregaAlFinal: Recibe un elemento y regresa una función que recibe una lista a la cual anexar el elemento dado.
; Devuelve la lista final
(define (agregaAlFinal el)
  (define (agrega l)
    (append l
    (cond
      [(not (pair? el)) (cons el '())]
      [else el]
      ))
    )
  agrega
  )

; empareja: A partir de una lista devuelve todas los pares posibles
(define (empareja l)
  (map (lambda (x)
         (map (lambda (y) (list x y) ) l)) l)
  )
  
  
  #lang racket

; encadena dos funciones g f, de tal modo que queden así (f g)
(define compon
  (lambda (f g x)
    (f (g x))))

; regresa verdadero o falso dependiendo de si encuentra un número impar en una lista de listas
(define (impares? l)
  (if (> (count odd? (apply append l)) 0) #t #f))
