(define (planprog ZTRAVEL-2-5)
(:domain zeno-travel)
(:objects
plane1 - aircraft
plane2 - aircraft
person1 - person
person2 - person
person3 - person
person4 - person
person5 - person
city0 - city
city1 - city
city2 - city
city3 - city
fl0 - flevel
fl1 - flevel
fl2 - maxlevel
)

(:init
(at plane1 city0)
(fuel-level plane1 fl2)
(at plane2 city1)
(fuel-level plane2 fl2)
(at person1 city1)
(at person2 city1)
(at person3 city2)
(at person4 city3)
(at person5 city1)
(next fl0 fl1)
(next fl1 fl2)
(fuel-station city0)

)

(:init-app n0)
(:transitions
	(n0  n1  (:goal (and (at person2 city1) (at person4 city3))))
	(n1  n2  (:goal (and (at plane1 city3) (at person1 city3))))
	(n2  n3  (:goal (and (at person2 city2))))
	(n3  n4  (:goal (and (at plane2 city3) (at person1 city1))))
	(n4  n5  (:goal (and (at person1 city3) (at person5 city3))))
	(n0  n6  (:goal (and (at person4 city1))))
	(n1  n6  (:goal (and (at person2 city2))))
	(n2  n6  (:goal (and (at person3 city2))))
	(n3  n6  (:goal (and (at person5 city2))))
	(n4  n6  (:goal (and (at person1 city0))))
	(n5  n6  (:goal (and (at person3 city3))))
)
)
