(define (planprog ZTRAVEL-2-3)
(:domain zeno-travel)
(:objects
plane1 - aircraft
plane2 - aircraft
person1 - person
person2 - person
person3 - person
city0 - city
city1 - city
city2 - city
fl0 - flevel
fl1 - flevel
fl2 - maxlevel
)

(:init
(at plane1 city1)
(fuel-level plane1 fl2)
(at plane2 city0)
(fuel-level plane2 fl2)
(at person1 city1)
(at person2 city1)
(at person3 city0)
(next fl0 fl1)
(next fl1 fl2)
(fuel-station city0)

)

(:init-app n0)
(:transitions
	(n0  n1  (:goal (and (at person3 city2) (at plane1 city1))))
	(n1  n2  (:goal (and (at plane1 city2) (at plane2 city1))))
	(n2  n3  (:goal (and (in person1 plane2))))
	(n3  n2  (:goal (and (in person2 plane1) (at person3 city0))))
	(n2  n1  (:goal (and (in person2 plane2) (at plane1 city1))))
	(n1  n0  (:goal (and (at plane1 city2) (at plane2 city1))))
)
)
