
;; This is the 3-block instance of the 4-action blocks world problem.

(define (problem fourblocks)
(:domain blocks)
  
(:objects
    A B C D E F G H I J - block
    H1 H2 - gripper
)

(:init
    (ontable A)
    (ontable B)
    (ontable I)
    (ontable J)
    (on C A)
    (on F C)
    (on D B)
    (on E J)
    (on H E)
    (on G H)

    (clear F)
    (clear D)
    (clear I)
    (clear G)

    (handempty H1)
    (handempty H2)
)

(:goal (and (on B C) (on C A))))

