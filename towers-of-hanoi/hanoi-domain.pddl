(define

    (domain hanoi)

    (:requirements :typing :fluents :negative-preconditions)

    (:types 
        disc - target
        peg - target
    )

    (:predicates
        (disc_on_target ?disc - disc ?target - target)
        (smaller ?disc - disc ?target - target)
        (is_top ?target - target)
    )

    (:action move_disc_to_target
        :parameters (?disc - disc ?source - target ?dest - target)

        :precondition 
            (and 
                (is_top ?disc)
                (is_top ?dest)
                (disc_on_target ?disc ?source)
                (smaller ?disc ?dest)
            )

        :effect 
            (and 
                (is_top ?disc)
                (is_top ?source)
                (not (is_top ?dest))
                (not (disc_on_target ?disc ?source))
                (disc_on_target ?disc ?dest)
            )
    )

)
