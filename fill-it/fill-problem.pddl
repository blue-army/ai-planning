(define 
    (problem e1)

    (:domain fill-it)

    (:objects 
        cup - glass  
        keg - tap
    )

    (:init 
        (= (rate keg) 4)
        (= (capacity cup) 20)
        (= (level cup) 0) 
        (closed keg)
    )
        
    (:goal 
        (and 
            ;(full cup); <---- this single goal is sufficient to execute correctly
            (>= (level cup) (- (capacity cup) 0.01)); <---- this seemingly identical goal will NOT produce the expected plan
        )
    )
)