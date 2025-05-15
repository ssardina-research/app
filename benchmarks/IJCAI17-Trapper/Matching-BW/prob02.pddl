(define (planprog matching-bw-typed-n3)
(:domain matching-bw-typed)
(:objects h1 h2 - hand 
b1 b2 b3  - block)

(:init

 (empty h1)
 (empty h2)
 (hand-positive h1)
 (hand-negative h2)
 (solid b1)
 (block-positive b1)
 (on-table b1)
 (solid b2)
 (block-negative b2)
 (on-table b2)
 (solid b3)
 (block-negative b3)
 (on b3 b1)
 (clear b2)
 (clear b3)
)

(:init-app n0)
(:transitions
	(n0  n1  (:goal (and (on b1 b3) (on b3 b2))))
	(n1  n2  (:goal (and (on b2 b1))))
	(n2  n3  (:goal (and (on b3 b2))))
	(n3  n0  (:goal (and (on b3 b1))))
)
)
