(define
    (domain fill-it)

    (:requirements :typing :fluents :negative-preconditions :durative-actions :duration-inequalities :continuous-effects)

    (:types
        glass
        tap
    )

    (:predicates
        (closed ?tap - tap)
        (full ?glass - glass)
    )

    (:functions 
        (level ?glass - glass)
        (capacity ?glass - glass)
        (rate ?tap - tap)
    )

    (:durative-action fill-it
        :parameters (?glass - glass ?tap - tap)
        :duration (<= ?duration 10000)
        :condition (and 
            (at start (closed ?tap))
            (over all (not (closed ?tap)))
            ;(over all (<= (level) (capacity))) ; <--- needed? 
        )
        :effect (and 
            (at start (not (closed ?tap))) 
            (at end (closed ?tap))
            (increase (level ?glass) (* #t (rate ?tap)))
        )
    )

    (:action checkfull
        :parameters (?glass - glass)
        :precondition 
            (>= (level ?glass) (- (capacity ?glass) 0.01))
        :effect 
            (full ?glass)
    )
)