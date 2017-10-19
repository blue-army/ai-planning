(define (domain bath)
(:requirements :fluents :typing :continuous-effects :durative-actions :duration-inequalities)
(:types faucet bath)

(:predicates (belongsTo ?f - faucet ?b - bath) (open ?f - faucet) (closed ?f - faucet) (full ?b - bath) (containsWaterFrom ?f - faucet ?b - bath) (bubbleBathAdded ?b - bath))

(:functions (rate ?f - faucet) (depth ?b - bath) (maxDepth ?b - bath) )

(:durative-action fillbath 
 :parameters (?f - faucet ?b - bath)
 :duration (<= ?duration 10000)
 :condition (and (at start (closed ?f)) (at start (belongsTo ?f ?b))
                (over all (open ?f)) (over all (<= (depth ?b) (maxDepth ?b))))
 :effect (and (at start (not (closed ?f))) (at start (open ?f)) (at end (not (open ?f)))
            (at end (closed ?f)) (at start (containsWaterFrom ?f ?b)) 
            (increase (depth ?b) (* #t (rate ?f)))))

(:action checkfull
:parameters (?b - bath)
:precondition (>= (depth ?b) (- (maxDepth ?b) 1))
:effect (full ?b))

(:action addBubbleBath 
 :parameters (?b - bath)
 :precondition (and (>= (depth ?b) (/ (maxDepth ?b) 2)) (<= (depth ?b) (/ (* 3 (maxDepth ?b)) 4)))
 :effect (and (bubbleBathAdded ?b))
)

)