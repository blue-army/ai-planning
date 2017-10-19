(define (domain generator)
(:requirements :fluents :durative-actions :duration-inequalities
        :negative-preconditions :typing)
(:types generator tank)
(:predicates (generator-ran) (used ?t - tank))
(:functions (fuel-level ?t - generator) 
        (fuel-reserve ?t - tank) 
        (refuel-rate ?g - generator) 
    (capacity ?g - generator))

(:durative-action generate
 :parameters (?g - generator)
 :duration (= ?duration  100)         
 :condition (over all (>= (fuel-level ?g) 0))
 :effect (and (decrease (fuel-level ?g) (* #t 1))
          (at end (generator-ran))))

(:durative-action refuel
 :parameters (?g - generator ?t - tank)
 :duration (= ?duration (/ (fuel-reserve ?t) (refuel-rate ?g)) )         
 :condition (and 
        (at start (not (used ?t)))
         (over all (<= (fuel-level ?g) (capacity ?g))))
 :effect (and 
            (at start (used ?t))
        ;(decrease (capacity ?g) (* #t 0.5))
            (decrease (fuel-reserve ?t) (* #t (refuel-rate ?g)))
          (increase (fuel-level ?g) (* #t (refuel-rate ?g)))
          
          ))

)
