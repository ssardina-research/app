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
(at plane2 city0)
(fuel-level plane2 fl2)
(at person1 city2)
(at person2 city2)
(at person3 city2)
(next fl0 fl1)
(next fl1 fl2)
(fuel-station city0)

)

(:init-app n0)
(:transitions
	(n0  n1  (:goal (and (fuel-level plane1 fl1))))
	(n1  n2  (:goal (and (in person1 plane1) (at plane1 city1))))
	(n2  n3  (:goal (and (at person1 city0) (at plane2 city0))))
	(n3  n4  (:goal (and (at person2 city0) (at person3 city2))))
	(n4  n5  (:goal (and (in person2 plane2) (in person3 plane1))))
	(n5  n6  (:goal (and (at person1 city0))))
	(n6  n7  (:goal (and (at person2 city0) (at plane2 city1))))
	(n7  n8  (:goal (and (at person2 city0) (at person3 city2))))
	(n8  n9  (:goal (and (fuel-level plane2 fl2))))
	(n9  n10  (:goal (and (at person3 city1) (at plane1 city1))))
	(n10  n11  (:goal (and (fuel-level plane2 fl0))))
	(n7  n6  (:goal (and (at person2 city0) (at plane1 city0))))
	(n6  n8  (:goal (and (at person2 city0) (at plane1 city2))))
	(n3  n6  (:goal (and (at person3 city1) (at plane2 city1))))
	(n7  n1  (:goal (and (at person2 city0) (at plane2 city2))))
	(n11  n2  (:goal (and (at person1 city1) (at plane2 city0))))
	(n9  n3  (:goal (and (at person2 city2) (at person3 city0))))
	(n4  n11  (:goal (and (in person2 plane2) (at person3 city2))))
	(n9  n7  (:goal (and (at person2 city1))))
	(n5  n7  (:goal (and (in person1 plane1) (at plane1 city1))))
	(n1  n3  (:goal (and (at plane1 city0))))
	(n2  n11  (:goal (and (in person2 plane2) (in person3 plane1))))
	(n3  n5  (:goal (and (at plane1 city0) (at plane2 city1))))
	(n4  n10  (:goal (and (in person2 plane1) (in person3 plane2))))
	(n1  n7  (:goal (and (at person1 city0) (at person3 city0))))
	(n4  n2  (:goal (and (at person2 city2) (at plane1 city2))))
	(n2  n5  (:goal (and (at person3 city2) (at plane1 city2))))
	(n0  n5  (:goal (and (at person3 city1) (at plane2 city0))))
	(n2  n9  (:goal (and (at person2 city1) (in person3 plane1))))
	(n4  n6  (:goal (and (at person1 city1) (at plane2 city2))))
	(n10  n0  (:goal (and (at person3 city1) (at plane1 city1))))
	(n3  n0  (:goal (and (at person2 city1) (at plane1 city2))))
	(n8  n2  (:goal (and (at person3 city1) (at plane2 city0))))
	(n1  n8  (:goal (and (at person1 city1) (at person3 city0))))
	(n0  n9  (:goal (and (in person1 plane1) (in person2 plane1))))
	(n7  n0  (:goal (and (at person2 city0) (at person3 city2))))
	(n3  n9  (:goal (and (at person1 city1) (at person3 city0))))
	(n5  n10  (:goal (and (in person3 plane1) (at plane2 city2))))
	(n11  n3  (:goal (and (at plane1 city2))))
	(n7  n11  (:goal (and (at person1 city0) (at plane1 city1))))
	(n7  n5  (:goal (and (at person2 city0) (at plane2 city1))))
	(n6  n4  (:goal (and (at person1 city2) (in person2 plane2))))
	(n1  n10  (:goal (and (in person1 plane2))))
	(n9  n5  (:goal (and (in person1 plane2) (in person3 plane2))))
)
)
