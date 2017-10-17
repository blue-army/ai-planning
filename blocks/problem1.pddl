;; This is the 3-block instance of the 4-action blocks world problem.

(define (problem fourblocks)
(:domain blocks)
  
(:objects
	A B C - block
	
)

(:init
(ontable C)
(clear C)
(on A B)
(clear A)
(ontable B)
(handempty)

)

(:goal (and (on B C) (on C A))))

