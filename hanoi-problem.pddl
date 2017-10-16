(
    define (problem hanoi_3)
    
    (:domain hanoi)
    
    (:objects
        A B C - disc
        P1 P2 P3 - peg
    )

    (:init
        (disc_on_target A B)
        (disc_on_target B C)
        (disc_on_target C P1)
        (smaller A B)
        (smaller A P1)
        (smaller A P2)
        (smaller A P3)
        (smaller B C)
        (smaller B P1)
        (smaller B P2)
        (smaller B P3)
        (smaller C P1)
        (smaller C P2)
        (smaller C P3)
        (is_top A)
        (is_top P2)
        (is_top P3)
    )

    (:goal
        (and
            (disc_on_target A B)
            (disc_on_target B C)
            (disc_on_target C P3)
            (is_top A)
            (is_top P1)
            (is_top P2)
        )
    )
)