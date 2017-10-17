(define 
    (problem say-helloworld)
    
    (:domain hello)

    (:init
        (not (said_hello))
    )

    (:goal 
        (said_hello)
    )
)