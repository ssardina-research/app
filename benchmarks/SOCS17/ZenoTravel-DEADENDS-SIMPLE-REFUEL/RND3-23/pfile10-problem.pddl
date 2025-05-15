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
(at plane1 city2)
(fuel-level plane1 fl2)
(at plane2 city2)
(fuel-level plane2 fl2)
(at person1 city1)
(at person2 city2)
(at person3 city1)
(next fl0 fl1)
(next fl1 fl2)
(fuel-station city0)

)

(:init-app n0)
(:transitions
	(n0  n1  (:goal (and (at person3 city0) (at plane1 city1))))
	(n1  n2  (:goal (and (in person1 plane2) (at person2 city2))))
	(n2  n3  (:goal (and (at person2 city0) (at plane1 city1))))
	(n3  n4  (:goal (and (in person1 plane1) (at person3 city0))))
	(n4  n5  (:goal (and (at person2 city0) (in person3 plane2))))
	(n5  n6  (:goal (and (at person2 city0) (at plane1 city1))))
	(n6  n7  (:goal (and (in person3 plane1) (at plane2 city0))))
	(n7  n8  (:goal (and (in person1 plane1) (at plane2 city2))))
	(n8  n9  (:goal (and (at person1 city2) (at plane2 city2))))
	(n9  n4  (:goal (and (at person3 city2))))
	(n2  n9  (:goal (and (at plane1 city1) (at plane2 city0))))
	(n2  n5  (:goal (and (in person2 plane2) (at plane2 city2))))
	(n6  n0  (:goal (and (at person1 city1) (at person3 city1))))
	(n0  n8  (:goal (and (at plane1 city0))))
	(n0  n4  (:goal (and (in person1 plane1) (in person3 plane2))))
	(n8  n5  (:goal (and (in person1 plane2) (at person2 city0))))
	(n4  n9  (:goal (and (in person1 plane1) (in person2 plane1))))
	(n4  n7  (:goal (and (at person1 city0) (at plane2 city1))))
	(n4  n2  (:goal (and (in person2 plane1))))
	(n1  n8  (:goal (and (at person2 city1) (at plane2 city2))))
	(n9  n3  (:goal (and (at person2 city1) (at plane1 city2))))
	(n0  n9  (:goal (and (at person2 city2) (at person3 city1))))
	(n7  n4  (:goal (and (at person3 city2) (at plane2 city2))))
	(n5  n2  (:goal (and (at person2 city1) (at plane1 city2))))
	(n6  n8  (:goal (and (at person1 city2) (at plane1 city1))))
	(n7  n0  (:goal (and (in person2 plane1) (at plane2 city0))))
	(n3  n2  (:goal (and (at person1 city2) (in person2 plane1))))
	(n6  n5  (:goal (and (at person2 city1) (at person3 city0))))
	(n5  n3  (:goal (and (at plane1 city0) (at plane2 city2))))
	(n2  n0  (:goal (and (in person3 plane1) (at plane2 city0))))
	(n4  n1  (:goal (and (at person3 city2) (at plane1 city1))))
	(n7  n1  (:goal (and (in person2 plane1) (at plane2 city0))))
	(n3  n9  (:goal (and (at person1 city1) (at person2 city2))))
	(n9  n2  (:goal (and (in person1 plane1) (at plane2 city0))))
)
)
