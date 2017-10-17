(define

    (domain hello-colleagues)

    (:requirements :strips :typing :fluents :negative-preconditions)

    (:types colleague)

    (:predicates 
        (greeted ?c - colleague)
        (greeted_everyone_else)
    )

    (:functions
        (greet_count)
        (greet_max)
    )

    (:action hello
        :parameters (?c - colleague)

        :precondition 
            (and 
                (not (greeted ?c))
        )

        :effect 
            (and 
                (greeted ?c)
                (increase (greet_count) 1)
            )
    )

    (:action hello-everyone-else
        :parameters ()
        
        :precondition 
            (and
                (= (greet_count) (greet_max))
                (not (greeted_everyone_else))
            )

        :effect
            (and
                (greeted_everyone_else)
            )
    )
)