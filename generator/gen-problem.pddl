(define (problem run-generator)
    (:domain generator)
    (:objects generator1 - generator tank1 tank2 - tank)
    (:init     (= (fuel-level generator1)  60)
        (= (refuel-rate generator1)  2)
        (= (capacity generator1)  60)
           (= (fuel-reserve tank1)  20)
        (= (fuel-reserve tank2)  20)          
     )  
     (:goal (generator-ran))) 
