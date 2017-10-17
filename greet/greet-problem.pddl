(define 
    (problem hello-colleagues) 

    (:domain hello-colleagues)

    (:objects
            angela emmanuel mark stefan paolo viktor - colleague
    )

    (:init
        (= (greet_count) 0)
        (= (greet_max) 2)
    )

    ; define as many `greeted` goals as you have neighbors
    (:goal 
            (and
                    (= (greet_count) (greet_max))
                    (greeted_everyone_else)
            )
    )
)