(define 
    (domain shopping)

    (:requirements :fluents :typing :negative-preconditions)

    (:types 
        item
        location
        shopper
    )

    (:predicates 
        (at ?shopper - shopper ?location - location)
        (stored ?item - item ?location - location)
        (bought ?shopper - shopper ?item - item)
    )

    (:functions
        (cost ?item - item)
        (foodValue ?item - item)
        (entertainmentValue ?item - item)
        (travelCost ?from ?to - location) 
        (cash ?shopper - shopper)
        (food ?shopper - shopper)
        (fun ?shopper - shopper))

    (:action travel
         :parameters (?person - shopper ?from - location ?to - location)

         :precondition 
            (and 
                (at ?person ?from)
                (<= (travelCost ?from ?to) (cash ?person))
            )

         :effect 
            (and 
                (at ?person ?to)
                (decrease (cash ?person) (travelCost ?from ?to))
            )
    )

    (:action consume
         :parameters (?shopper - shopper ?location - location ?item - item)

         :precondition 
            (and 
                (at ?shopper ?location)
                (stored ?item ?location)
                (not (bought ?shopper ?item))
                (>= (cash ?shopper) (cost ?item))
            )

         :effect 
            (and 
                (not (stored ?item ?location))
                (bought ?shopper ?item)
                (decrease (cash ?shopper) (cost ?item))
                (increase (food ?shopper) (foodValue ?item))
                (increase (fun ?shopper) (entertainmentValue ?item))
            )
    )

)