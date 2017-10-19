(define

    (problem officedeliveryp0)

    (:domain office-delivery)
    
    (:objects
        kitchen postroom office1 office2 office3 - room
        hector romeo - robot 
        letter parcel coffee hamburger - thing
    )

    (:init
        (occupied office1)
        (occupied office2)
        (occupied office3)
        (located coffee kitchen)
        (located hamburger kitchen)
        (located letter postroom)
        (located parcel postroom)
        (opendoor kitchen)
        (inroom romeo kitchen)
        (incorridor hector)
    )

    (:goal 
        (and 
            (delivered coffee office1) 
            (delivered letter office2)
            (delivered hamburger office3)
            (delivered parcel office2)
    ))
)
