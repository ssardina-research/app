(define (planprog bw-typed-n5)
(:domain blocksworld)
(:objects 
b1 b2 b3 b4 b5  - block)

(:init
(handempty)
 (ontable b1)
 (stai_on b2 b4)
 (stai_on b3 b2)
 (stai_on b4 b5)
 (stai_on b5 b1)
 (clear b3)
)

(:init-app n0)
(:transitions
	(n0  n1  (:goal (and (on b1 b2))))
	(n1  n2  (:goal (and (on b4 b5))))
	(n2  n3  (:goal (and (on b3 b4))))
	(n3  n4  (:goal (and (on b2 b3))))
)
)
