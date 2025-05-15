(define (planprog bw-typed-n5)
(:domain blocksworld)
(:objects 
b1 b2 b3 b4 b5  - block)

(:init
(handempty)
 (stai_on b1 b2)
 (ontable b2)
 (stai_on b3 b5)
 (stai_on b4 b3)
 (stai_on b5 b1)
 (clear b4)
)

(:init-app n0)
(:transitions
	(n0  n1  (:goal (and (on b4 b5))))
	(n1  n2  (:goal (and (on b3 b4))))
	(n2  n3  (:goal (and (on b2 b3))))
	(n3  n4  (:goal (and (on b1 b2))))
)
)
