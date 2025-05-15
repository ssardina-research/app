(define
(planprog RING6-PFILE1)
(:domain blocksworld)
(:objects b1 b2 )
(:init
(arm-empty)
(on b1 b2)
(on-table b2)
(clear b1)

)
(:init-app n0)
(:transitions
(n0 n1 (:goal (and (on b1 b2) )))
(n1 n2 (:goal (and (on b2 b1) )))
(n2 n3 (:goal (and (on b1 b2) )))
(n3 n4 (:goal (and  )))
(n4 n5 (:goal (and (on b1 b2) )))
(n5 n0 (:goal (and (on b2 b1) )))
)
)
