(define 

    (domain office-delivery)

    (:requirements :durative-actions :typing)
    
    (:types robot room thing)
    
    (:predicates 
        (inroom ?x - robot ?y - room)
        (delivered ?y - thing ?q  - room)
        (loaded ?r - robot ?a - thing)
        (opendoor ?r - room)
        (incorridor ?r - robot)
        (occupied ?x - room) ;can't deliver to an empty room
        (located ?a - thing ?b - room)
        (atdoor ?r - robot ?x - room)
    )

    (:durative-action deliver
        :parameters (?r - robot ?thing - thing ?room - room)
        :duration (= ?duration 10)
        :condition 
            (and 
                (at start (loaded ?r ?thing)) 
                (over all (loaded ?r ?thing))
                (at start (inroom ?r ?room))
                (over all (inroom ?r ?room))
                (at start (occupied ?room))
            )

        :effect 
            (and 
                (at end (not (loaded ?r ?thing)))
                (at end (delivered ?thing ?room))
            )
    )

    (:durative-action collect
        :parameters (?r - robot ?a - thing ?b - room)
        :duration (= ?duration 10)
        
        :condition 
            (and 
                (at start (not (loaded ?r ?a)))
                (at start (inroom ?r ?b))
                (over all (inroom ?r ?b))
                (at start (located ?a ?b))
            )

        :effect 
            (and 
                (at start (not (located ?a ?b)))
                (at end (loaded ?r ?a))
            )
    )

    (:durative-action drive
        :parameters (?r - robot ?y - room)
        :duration (= ?duration 20)
        :condition 
            (and 
                (at start (incorridor ?r))
            )

        :effect 
            (and 
                (at end (atdoor ?r ?y))
                ;(forall (?z - room) (at start (not (atdoor ?r ?z))))
            )
    )

    (:durative-action goinroom
        :parameters (?r - robot ?y - room)
        :duration (= ?duration 2)
        :condition 
            (and (at start (incorridor ?r)) 
                (at start (atdoor ?r ?y)) 
                (at start (opendoor ?y)) 
                (over all (opendoor ?y))
            )

        :effect 
            (and 
                (at end (inroom ?r ?y)) 
                (at start (not (incorridor ?r))) 
                (at start (not (atdoor ?r ?y)))
            )
    )

    (:durative-action leaveroom
        :parameters (?r - robot ?y - room)
        :duration (= ?duration 2)
        :condition 
            (and 
                (at start (inroom ?r ?y))
                (at start (opendoor ?y))
                (over all (opendoor ?y))
            )

        :effect 
            (and 
                (at end (not (inroom ?r ?y)))
                (at start (incorridor ?r))
                (at start (not (inroom ?r ?y)))
            )
    )

    (:durative-action openthedoor
        :parameters (?r - robot ?y - room)
        :duration (= ?duration 2)
        :condition 
            (and 
                (at start (not (opendoor ?y)))
                (at start (atdoor ?r ?y))
                (over all (atdoor ?r ?y))
            )

        :effect 
            (and 
                (at end (opendoor ?y))
            )
    )
)