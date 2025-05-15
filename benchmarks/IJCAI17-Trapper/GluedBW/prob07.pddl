(define (planprog bw-typed-n7)
(:domain blocksworld)
(:objects 
b1 b2 b3 b4 b5 b6 b7  - block)

(:init
(handempty)
 (ontable b1)
 (stai_on b2 b7)
 (ontable b3)
 (stai_on b4 b6)
 (stai_on b5 b1)
 (stai_on b6 b2)
 (stai_on b7 b3)
 (clear b4)
 (clear b5)
)

(:init-app n0)
(:transitions
	(n0  n1  (:goal (and (on b6 b7))))
	(n1  n2  (:goal (and (on b5 b6))))
	(n2  n3  (:goal (and (on b4 b5))))
	(n3  n4  (:goal (and (on b3 b4))))
	(n4  n5  (:goal (and (on b2 b3))))
	(n5  n6  (:goal (and (on b1 b2))))
)
)
