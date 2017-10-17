
;; This is the 4-action blocks world domain which does not refer to a table object and distinguishes actions for moving blocks to-from blocks and moving blocks to-from table

(define (domain blocks)

(:requirements :typing :fluents
:negative-preconditions)

(:types block gripper) ; we do not need a table type as we use a special ontable predicate

(:predicates
(on ?a ?b - block)
(clear ?a - block)
(holding ?a - block ?g - gripper)
(handempty ?g - gripper)
(ontable ?x - block)
)

(:action pickup ; this action is only for picking from table
:parameters (?x - block ?g - gripper)
:precondition (and (ontable ?x)
				(handempty ?g)
				(clear ?x)
			)
:effect (and (holding ?x ?g)
			 (not (handempty ?g))
			 (not (clear ?x))
			 (not (ontable ?x))
		)
)
(:action unstack ; only suitable for picking from block
:parameters (?x ?y - block ?g - gripper)
:precondition (and (on ?x ?y)
				(handempty ?g)
				(clear ?x)
			)
:effect (and (holding ?x ?g)
			 (not (handempty ?g))
			 (not (clear ?x))
			 (clear ?y)
			 (not (on ?x ?y))
		)
)

(:action putdown
:parameters (?x - block ?g - gripper)
:precondition (and (holding ?x ?g)
			)
:effect (and (ontable ?x)
			 (not (holding ?x ?g))
			 (handempty ?g)
			 (clear ?x)
		)
)

(:action stack
:parameters (?x ?y - block ?g - gripper)
:precondition (and (holding ?x ?g)
				(clear ?y)
			)
:effect (and (on ?x ?y)
			 (not (holding ?x ?g))
			 (handempty ?g)
			 (not (clear ?y))
			 (clear ?x)
		)
)
)