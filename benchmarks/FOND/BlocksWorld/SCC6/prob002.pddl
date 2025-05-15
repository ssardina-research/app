(define
(planprog SCC6-PFILE2)
(:domain blocksworld)
(:objects b1 b2 b3 )
(:init
(arm-empty)
(on-table b1)
(on b2 b1)
(on-table b3)
(clear b2)
(clear b3)

)
(:init-app n0)
(:transitions
(n0 n1 (:goal (and (on b1 b3) (on b3 b2) )))
(n1 n2 (:goal (and (on b2 b3) )))
(n2 n0 (:goal (and (on b3 b2) )))
(n0 n2 (:goal (and (on b2 b3) )))
(n2 n1 (:goal (and (on b1 b2) (on b3 b1) )))
(n1 n0 (:goal (and (on b1 b2) (on b2 b3) )))
)
)
