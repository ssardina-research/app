(define (planprog tricky-ring-pfle4)
(:domain logistics-strips)
(:objects a0 a1 - airplane
          c0 c1 c2 - city
          t0 t1 t2 - truck
          l00 l01 l10 l11 l20 l21 - location
          p0 p1 p2 p3 p4 p5 p6 p7 p8 - package
)

(:init 
(in-city  l00 c0)
(in-city  l01 c0)
(in-city  l10 c1)
(in-city  l11 c1)
(in-city  l20 c2)
(in-city  l21 c2)
(at t0 l00)
(at t1 l11)
(at t2 l21)
(at p0 l01)
(at p1 l11)
(at p2 l11)
(CONNECTED l00 l10)
(CONNECTED l10 l00)
(CONNECTED l00 l20)
(at a0 l10)
(at a1 l00)
(at p3 l01)
(at p4 l01)
(at p5 l01)
(at p6 l01)
(at p7 l01)
(at p8 l01)
)

(:init-app n0)
(:transitions
(n0 n1 (:goal (and (at p0 l21) (at p1 l21) (at p3 l21) (at p4 l21) (at p5 l21) (at p6 l21) (at p7 l21) (at p8 l21)) ))
(n1 n2 (:goal (at p2 l01) ))
(n2 n1 (:goal (at p2 l11) ))
)
)



