(define
    (domain bubbles)

    (:requirements :typing :fluents :negative-preconditions :durative-actions :duration-inequalities :continuous-effects)

    (:types
        bath
        faucet
    )

    (:predicates
        (closed ?faucet - faucet)
        (full ?bath - bath)
    )

    (:functions 
        (level)
        (rate)
        (capacity)
    )

    (:durative-action fill-bath
        :parameters (?bath - bath ?faucet - faucet)
        :duration (<= ?duration 10000)
        :condition (and 
            (at start (closed ?faucet))
            (over all (not (closed ?faucet)))
            (over all (<= (level) (capacity)))
        )
        :effect (and 
            (at start (not (closed ?faucet))) 
            (at end (closed ?faucet))
            (increase (level) (* #t (rate)))
        )
    )

    (:action checkfull
        :parameters (?b - bath)
        :precondition 
                (>= (level) (- (capacity) 0.01))
        :effect 
            (full ?b)
    )
)