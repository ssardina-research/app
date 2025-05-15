(define
(planprog RND3-23-PFILE4)
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
(n0 n1 (:goal (and (on b2 b1) )))
(n1 n2 (:goal (and (holding b2) )))
(n2 n3 (:goal (and (on-table b2) )))
(n0 n2 (:goal (and (holding b1) )))
(n2 n0 (:goal (and (on-table b1) (on-table b2)) ))
(n3 n2 (:goal (and (on-table b2) )))
(n1 n3 (:goal (and (on-table b1) )))
(n0 n3 (:goal (and (on b2 b1) )))
)
)
