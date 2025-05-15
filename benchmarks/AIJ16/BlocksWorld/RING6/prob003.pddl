(define
(planprog RING6-PFILE3)
(:domain blocksworld)
(:objects b1 b2 b3 b4 )
(:init
(arm-empty)
(on b1 b2)
(on-table b2)
(on b3 b1)
(on-table b4)
(clear b3)
(clear b4)

)
(:init-app n0)
(:transitions
(n0 n1 (:goal (and (on b2 b4) (on b3 b2) (on b4 b1) )))
(n1 n2 (:goal (and (on b1 b2) (on b4 b1) )))
(n2 n3 (:goal (and (on b1 b2) (on b2 b3) (on b4 b1) )))
(n3 n4 (:goal (and (on b4 b1) )))
(n4 n5 (:goal (and (on b2 b3) (on b3 b4) (on b4 b1) )))
(n5 n0 (:goal (and (on b3 b2) (on b4 b1) )))
)
)
