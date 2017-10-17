; deliver cup to a person in a room
(
    define (domain cup-delivery)
    
    (:requirements :typing)

    (:types cup person room)

    (:predicates 
        (ontable ?c - cup ?r - room) 
        (in ?r - room) 
        (handempty) 
        (holding ?c - cup)
        (inperson ?p - person ?r - room)
        (delivered ?c - cup ?p - person)
    )

    (:action pick-up
        
        :parameters 
            (?cup - cup ?room - room) 
        
        :precondition 
            (and
                (ontable ?cup ?room)
                (in ?room)
                (handempty)
            )

        :effect
            (and 
                (not (handempty))
                (not (ontable ?cup ?room))
                (holding ?cup)
            )
    )

    (:action move-carrying
        :parameters 
            (?from ?to - room ?cup - cup) 
        
        :precondition 
            (and
                (in ?from)
                (holding ?cup)
            )

        :effect
            (and 
                (in ?to)
            )
    )

    (:action deliver
        :parameters 
            (?where - room ?cup - cup ?person - person) 
        
        :precondition 
            (and
                (in ?where)
                (inperson ?person ?where)
                (holding ?cup)
            )

        :effect
            (and 
                (delivered ?cup ?person)
                (not (holding ?cup))
                (handempty)
            )
    )

)