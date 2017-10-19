;; POPF spots that it can satisfy the cold water condition by adding a tiny spot of cold water
;; after the bath is filled!

;; But a better plan would use both faucets in parallel...

(define (problem bath1)
(:domain bath)

(:objects bigBath - bath   hot cold - faucet)

(:init (= (rate hot) 4) (= (rate cold) 3) 
    (= (maxDepth bigBath) 20) (= (depth bigBath) 0) 
    (closed hot) (closed cold) (belongsto hot bigbath) (belongsto cold bigbath))
    
(:goal (and (containsWaterFrom hot bigbath) (containswaterfrom cold bigbath) 
                (full bigbath) (bubbleBathAdded bigbath))))