(define 
    (domain hello)

    (:requirements :typing :fluents )

    (:predicates
        (said_hello)
    )

    (:action Hello-World
        :parameters ()
        :precondition ()
        :effect (and 
            (said_hello)
        )
        )
)