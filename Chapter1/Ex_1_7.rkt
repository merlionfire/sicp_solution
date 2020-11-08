#lang sicp

;;Exercise 1.7: e good-enough? test used in computing
;;square roots will not be very effective for finding the square
;;roots of very small numbers. Also, in real computers, arithmetic
;;operations are almost always performed with limited
;;precision. is makes our test inadequate for very large
;;numbers. Explain these statements, with examples showing
;;how the test fails for small and large numbers. An alternative
;;strategy for implementing good-enough? is to watch
;;how guess changes from one iteration to the next and to
;;stop when the change is a very small fraction of the guess.
;;Design a square-root procedure that uses this kind of end
;;test. Does this work beer for small and large numbers?

(define ( square x ) ( * x x ) )

( define ( abs x )
   ( cond ( ( < x 0 ) ( - x ) )
          ( else x )
   )
)
                    
( define ( average x y ) ( / ( + x y ) 2 ) )

( define ( improve guess x )
   ( average ( / x guess ) guess ) )

(define (good-enough? x y )
  ( < ( abs ( - y ( square x ) ) )  0.001 )
)

( define ( sqrt-iter guess x )
   (if  ( good-enough? guess x )
             guess
             ( sqrt-iter ( improve guess x ) x )
    )
) 

