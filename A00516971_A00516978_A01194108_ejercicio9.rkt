#lang racket

; A00516971 - Sergio Gabriel Diosdado Castelazo
; A00516978 - Iñaki Janeiro Olague
; A01194108 - Sergio Eduardo Vega Guzmán

; filtra: Elimna de la lista (1er argumento) todos los elementos que no cumplan con un argumento unario (2do argumento).
(define  (filtra lista operador)
  (cond [(null? lista) '()]
        [(operador (car lista)) (cons (car lista) (filtra (cdr lista) operador))]
        [else (filtra (cdr lista) operador)]))

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

; compon: encadena dos funciones g f, de tal modo que queden así (f g)
(define compon
  (lambda (f g x)
    (f (g x))))

; impares: Elimina todos los elementos que no son impares de una lista de sublistas
(define impares
  (lambda (lista)
    (map
     (lambda (x)
        (apply append
               (map
                (lambda (y)
                  (if (odd? y)
                      (list y)
                      '()
                      )) x
       )))
    lista)))

; impares?: Regresa verdadero o falso dependiendo de si encuentra un número impar en una lista de listas
(define (impares? l)
  (if (> (count odd? (apply append l)) 0) #t #f))

; empareja: A partir de una lista devuelve todas los pares posibles
(define (empareja l)
  (map (lambda (x)
         (map (lambda (y) (list x y) ) l)) l)
  )