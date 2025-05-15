(define (planprog BW-rand-8)
(:domain blocksworld)
(:objects b1 b2 b3 b4 b5 b6 b7 b8 - block
ml0 ml1 - movabilitylevel
ml2 - maxmovabilitylevel)


(:init
(arm-empty)
(on b1 b4)
(on-table b2)
(on b3 b2)
(on-table b4)
(on b5 b8)
(on-table b6)
(on b7 b6)
(on b8 b1)
(clear b3)
(clear b5)
(clear b7)
(next-level ml0 ml1)
(next-level ml1 ml2)
(movability-level b1 ml2)
(movability-level b2 ml2)
(movability-level b3 ml2)
(movability-level b4 ml2)
(movability-level b5 ml2)
(movability-level b6 ml2)
(movability-level b7 ml2)
(movability-level b8 ml2)


)

(:init-app n0)
(:transitions
	(n0  n1  (:goal (and (on b2 b5))))
	(n1  n2  (:goal (and (on b6 b3))))
	(n2  n3  (:goal (and (on b2 b7) (on b3 b8))))
	(n3  n4  (:goal (and (on b1 b4))))
	(n4  n5  (:goal (and (on b1 b5) (on b6 b1))))
	(n5  n6  (:goal (and (on b4 b1) (on b1 b3))))
	(n6  n7  (:goal (and (on b8 b7))))
	(n7  n8  (:goal (and (on b5 b8))))
	(n8  n9  (:goal (and (on b8 b2))))
	(n9  n0  (:goal (and (on b6 b1))))
)
)
