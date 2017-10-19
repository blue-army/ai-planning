(define 
    (problem bath1)

    (:domain bath)

    (:objects 
        tub - bath  
        hot cold - faucet
    )

    (:init 
        (= (rate) 4)
        (= (capacity) 20)
        (= (level) 0) 
        (closed hot)
        (closed cold)
    )
        
    (:goal 
        (and 
            ;(full tub)
            (> (level) (capacity))
        )
    )
)