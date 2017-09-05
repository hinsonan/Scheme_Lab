# Scheme_Lab

Scheme Tutorial 

Section 1: Getting Started in Racket
1.1. Before doing anything else we need to create a common environment to work in.   Just below the title bar is a drop-down menu item Language with Choose Language as an option (ctl or apple + L) .  Choose Advanced Student and enable tracing. You may also choose to make the language case sensitive.
 
1.2. Now look for a pair of windows. The bottom window says, "Welcome to DrRacket." That is the interactions window. This is where you can test statements to see what they will do. Try it out - in the interactions window, type
 
  	(+ 3 5)
 
 This should add 3 to 5. In Scheme, + is a function. To call a function in Scheme (similar to a method in Java), you place the name of the function and its arguments, separated by spaces, inside parentheses. In Java and C++, function calls look something like this:

  	function(arg1, arg2, arg3)


 In Scheme, function calls look like this:
 
  	(function arg1 arg2 arg3)
 
1.3.  In the top window, change your program in some way. For example, re-type it to evaluate the expression:

     77*356 + 88/3
 
1.4. Evaluate the following expression:

     3 / 7 * (4 + 3 + 2 + 6) / 4 * (5 - 2)
Section 2: Basic Scheme Primitives
 
2.1.  In the interactions window, enter the following:
 
  	(car '(apple orange pineapple))
  	(cdr '(apple orange pineapple))
  	(car (apple orange pineapple))
 
  What do car and cdr do? Why is the single quote necessary?
 
2.2. Write sequences of cars and cdrs that will pick the symbol pear out of the following expressions:
 
  	(apple orange pear grapefruit)
  	(((apple) (orange) (pear) (grapefruit)))
  	(apple (orange) ((pear)) (((grapefruit))))

2.3. Execute the following statements. What do the functions cons, append, and list do?
 
  	;This is a comment.  Comments begin with a semicolon

  	(cons 'x '(1 2))        ;appends x to front of list
  	(cons '(1 5) '(2 3))    ;appends (1 5) to front of list (2 3), as a list
  	(append '(1) '(2 3))    ;appends 1 to list (2 3)
  	(append '(1 5) '(2 3))  ;appends 1 5 to list 2 3
  	(list '1 '2 '3 '(4 5))  ;creates list with elements 1,2,3,(4 5)
2.4. Execute the following code. What do length and reverse do?
 
  	(length '(plato socrates aristotle))         	; length of list
  	(reverse '(plato socrates aristotle))       	; reverses list
  	(remove 'socrates '(plato socrates aristotle))  ; removes element 
  	(member 'raphael '(plato
    socrates aristotle))   ; returns false  (#f)
    
Section 3: Saving your code
Entering your code interactively is not a good idea for creating large programs because they do not persist when we quit Scheme. We want to write code, save it, run it to add our definitions to the environment. Then we can use the interpreter. Here's how to do this.
 
3.1. Before starting you may want to create a folder to hold your work for Scheme.

3.2. Start typing in some Scheme code in the definitions window at the top of the screen. Use any of the above examples that you wish. When finished, save your program by going to the File menu, and choosing Save Definitions.

3.3. Run your program by clicking on the clicking on the Run button or Cmd-T. You should generally use this approach for entering and running Scheme code, but entering code directly into the interactions window is good for testing out quick ideas.  You can also use a text editor such as “NotePad” to create Scheme programs and load them into the definitions window
 
3.4.  Here is a Scheme program to enter, save, and run.
 
    (define (flatten seq )   
    (cond  ( (null? seq) '())
    ( (list? (car seq) )
    (append (flatten (car seq) ) (flatten (cdr seq)))) 	
    (else (cons (car seq) (flatten (cdr seq)) ) ) ) )

Execute the function by executing the following commands in the interactions window to test the definition of the flatten function.
 
    (flatten ‘(1 2 3 4 5) )
    (flatten ‘(1 2 3 4 (5) ) )
    (flatten ‘(1 2 3 4 (5 (6) ) ) )
 
What does flatten do?
Section 4: Conditionals
Scheme has a number of different predicates for testing equality.
 
1.  Try this code:
 
        (equal? '(hi there) '(hi there))
        (equal? '(hi there) '(bye now))
        (equal? 3 3)
        (equal? 3 3)
        (equal? 3 3.0)
        (equal? 3 (/ 6 2))
        (= '(hi there) '(hi there))
        (= '(hi there) '(bye now))
        (= 3 3)
        (= 3 (+ 2 1))
        (= 3 3.0)
        (= 3 (/ 6 2))
 
What kind of responses do you get?
How are equal? and = different?

2. Enter the following code:
 
  	 (if (= 8 3)  9   10)
 
Modify the condition following if to get a different value to return.

3. Enter the following code:
 
        (cond ((= 16 3) (+ 3 8))
              ((= 16 8) 12)
              (else (* 6 3)))	
 
Can you modify the 16 in the above code with some other value to change the return value? What does the cond function do?
Section 5: Defining Functions
1. In a new Scheme file or in the definitions window, enter in the following code, save it, and then run it.
 
  	  (lambda (x)  (+ x 1))
 
What does Scheme return? The lambda function returns a function without a name. In this case, you have defined a function that takes a parameter and adds 1 to it. Functions are also called procedures.

2. A function without a name is useless, as it is immediately garbage collected. Try this instead:
 
        (define add-one
        (lambda (x)
        (+ x 1)))
 
Save this code, run it, then type (add-one 5) in the interactions window. The define statement created a pointer, called add-one, which points to the function you just created.

3.  Naming unnamed functions (lambda functions) is OK and perhaps historically correct, but from now on we want to use an alternative function definition syntax.
 
        (define (add-one x) (+ x 1))
  	
4.  Now try this out:

        (define another-add-one add-one)
        (another-add-one 5)

        (define (aao x) (add-one x))

Explain what you just did.
Section 6: Recursion
1. Enter and load the following function. What does it do? Why?


        (define (mystery L)
            (if (null? L)
                L
                (append (mystery (cdr L)) (list (car L)))))
 
What does the mystery function do?  You may want to “Debug” the program and watch its step by step progression.

Note that there is no return statement here, as you would find in other languages. How is the return value determined in the above function?
 
2.  Modify the program as follows:
 
            (define (mystery L)
              (if (null? L) 	
        L
        (begin
        (display L)
        (append (mystery (cdr L)) (list (car L))))))
 
What does begin do? What does display do?

3. Write a recursive function, keep-first-n, that returns a list of the first n elements in a list. You may assume that there are at least n elements. Example:


        >(keep-first-n 3 '(a b c d e f g h i))
            (a b c)
 
 
4. Write a recursive function, even-sum, that computes the sum of the even numbers in a list. Example:


        >(even-sum ‘(1 2 3 4 5 6) )
        12
        >(even-sum ‘(1 3 5 7) )
        0



