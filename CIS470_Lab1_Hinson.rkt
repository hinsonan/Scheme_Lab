#lang racket
;1.1

;1.2 
(+ 3 5)

;1.3
(+(* 77 356) (/ 88 3))

;1.4
(* (/ (* (/ 3 7) (+ 4 3 2 6)) 4) (- 5 2))

;2.1
(car '(apple orange pineapple))
(cdr '(apple orange pineapple))
;(car (apple orange pineapple))
;car returns the first item in the list and cdr returns the whole list minus the first item
;The reason you need a single quote is so Scheme knows that is is defining a list in this case

;2.2
(caddr '(apple orange pear grapefruit))
(cadr(cdr(car '(((apple) (orange) (pear) (grapefruit))))))
(caaddr'(apple (orange) ((pear)) (((grapefruit)))))

;2.3
;This is a comment.  Comments begin with a semicolon
(cons 'x '(1 2))        ;appends x to front of list
(cons '(1 5) '(2 3))    ;appends (1 5) to front of list (2 3), as a list
(append '(1) '(2 3))    ;appends 1 to list (2 3)
(append '(1 5) '(2 3))  ;appends 1 5 to list 2 3
(list '1 '2 '3 '(4 5))  ;creates list with elements 1,2,3,(4 5)
;cons allows you to add a member to the front of a list.
;appends will place values in the front of a list that you want to append it to
;list creates a list with the values you give

;2.4
(length '(plato socrates aristotle))         	; length of list
(reverse '(plato socrates aristotle))       	; reverses list
(remove 'socrates '(plato socrates aristotle))  ; removes element
(member 'raphael '(plato socrates aristotle))   ; returns false  (#f)
;length gives an integer value for how many items in a list
;reverse takes the list and spits it out backwords

;3.1 folder and file made

;3.2
(+ 500 500)

;3.3 program is ran

;3.4
(define (flatten seq )   
  (cond  ( (null? seq) '())
         ( (list? (car seq) )
           (append (flatten (car seq) ) (flatten (cdr seq)))) 	
(else (cons (car seq) (flatten (cdr seq)) ) ) ) )

(flatten '(1 2 3 4 5) )
(flatten '(1 2 3 4 (5) ) )
(flatten '(1 2 3 4 (5 (6) ) ) )
;flatten takes out all the added () and makes the list just have the individual items


;4.1
(equal? '(hi there) '(hi there))
(equal? '(hi there) '(bye now))
(equal? 3 3)
(equal? 3 3)
(equal? 3 3.0)
(equal? 3 (/ 6 2))
;(= '(hi there) '(hi there))
;(= '(hi there) '(bye now))
(= 3 3)
(= 3 (+ 2 1))
(= 3 3.0)
(= 3 (/ 6 2))

; = is used to compare two numerical values and return true or false
; equal? can be used to compare strings and numbers. It checks whether the parameters represent the same object in memory
; It checks whether the parameters represent the same object in memory

;4.2
;(if (= 8 3)  9   10)
;Modify the condition following if to get a different value to return.
(if (>= 8 3)  9   10)

;4.3
(cond ((= 3 3) (+ 3 8))
      ((= 16 8) 12)
      (else (* 6 3)))
;the cond command idngores the other expressions when one of them is false 

;5.1
(lambda (x)  (+ x 1))

;this returns a nameless function

;5.2
(define add-one
  (lambda (x)
    (+ x 1)))

(add-one 5)

;5.3
;(define (add-one x) (+ x 1))

;5.4
(define another-add-one add-one)
  	(another-add-one 5)
;so what we have done is defined a new function called another-add-one
;then we passed in the add-one function as a parameter
;we then called the function another-add-one with 5 as the parameter
;then add-one was called with the value 5
(define (aao x) (add-one x))

;6.1
;(define (mystery L)
;      	(if (null? L)
 ;         	L
  ;        	(append (mystery (cdr L)) (list (car L)))))
;(mystery '(1 2 3))
;this function recursivly appends the cdr to the car and reverses the list
;the return value is determined if the list is null

;6.2
(define (mystery L)
   (if (null? L) 	
       L
       (begin
         (display L)
         (append (mystery (cdr L)) (list (car L))))))


(mystery '(1 2 3))

;begin allows you to view all the sequences when you are evaluating an expression

;6.3
(define (keep-first-n num L)  
  (if (equal? 0 num)
      '()
      (cons (car L)
            (keep-first-n (- num 1) (cdr L)))))

(keep-first-n 3 '(a b c d e f g h i))

;6.4
(define (even-sum l)
    (cond ((null? l) 0)
          ((even? (car l)) (+ (car l) (even-sum (cdr l))))
          (else (even-sum (cdr l)))))

(even-sum '(1 2 3 4 5 6) )

