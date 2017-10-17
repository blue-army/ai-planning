(define 
    (domain shopping)

    (:requirements :fluents :typing)

    (:types item location shopper)

    (:predicates (at ?s - shopper ?l - location)
                (stored ?i - item ?l - location)
                (bought ?s - shopper ?i - item)
    )

    (:functions (cost ?i - item)
                (foodValue ?i - item) (entertainmentValue ?i - item)
                (travelCost ?l1 ?l2 - location) 
                (cash ?s - shopper) (food ?s - shopper) (fun ?s - shopper))

    ;; TODO define actions here!

)