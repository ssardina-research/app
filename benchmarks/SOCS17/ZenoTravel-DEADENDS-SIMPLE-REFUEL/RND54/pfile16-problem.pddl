(define (planprog ZTRAVEL-3-5)
(:domain zeno-travel)
(:objects
plane1 - aircraft
plane2 - aircraft
plane3 - aircraft
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
(at plane1 city2)
(fuel-level plane1 fl2)
(at plane2 city1)
(fuel-level plane2 fl2)
(at plane3 city1)
(fuel-level plane3 fl2)
(at person1 city0)
(at person2 city2)
(at person3 city1)
(at person4 city3)
(at person5 city0)
(next fl0 fl1)
(next fl1 fl2)
(fuel-station city0)

)

(:init-app n0)
(:transitions
	(n0  n1  (:goal (and (at person2 city0))))
	(n1  n2  (:goal (and (at person1 city1))))
	(n2  n3  (:goal (and (at person2 city2) (at person1 city1))))
	(n3  n4  (:goal (and (at person2 city1) (at person1 city2))))
	(n4  n5  (:goal (and (at person2 city0))))
	(n5  n6  (:goal (and (at person2 city0) (at person1 city0))))
	(n6  n7  (:goal (and (at person2 city1) (at person1 city1))))
	(n7  n8  (:goal (and (at person1 city2) (at person2 city0))))
	(n8  n9  (:goal (and (at person2 city2) (at person1 city2))))
	(n9  n10  (:goal (and (at person2 city0) (at person1 city0))))
	(n10  n11  (:goal (and (at person2 city2) (at person1 city3))))
	(n11  n12  (:goal (and (at person2 city3))))
	(n12  n13  (:goal (and (at person1 city0) (at person2 city2))))
	(n7  n4  (:goal (and (at person1 city2) (at person2 city2))))
	(n1  n4  (:goal (and (at person1 city0))))
	(n9  n13  (:goal (and (at person2 city3) (at person1 city2))))
	(n5  n7  (:goal (and (at person2 city1) (at person1 city1))))
	(n10  n9  (:goal (and (at person2 city1) (at person1 city0))))
	(n0  n3  (:goal (and (at person1 city1))))
	(n5  n0  (:goal (and (at person2 city1) (at person1 city3))))
	(n2  n8  (:goal (and (at person2 city3))))
	(n8  n5  (:goal (and (at person2 city1) (at person1 city1))))
	(n2  n6  (:goal (and (at person1 city1))))
	(n13  n5  (:goal (and (at person2 city1) (at person1 city2))))
	(n9  n1  (:goal (and (at person2 city3))))
	(n2  n1  (:goal (and (at person1 city0))))
	(n3  n0  (:goal (and (at person2 city3) (at person1 city2))))
	(n4  n10  (:goal (and (at person1 city0) (at person2 city0))))
	(n7  n2  (:goal (and (at person1 city1) (at person2 city0))))
	(n6  n10  (:goal (and (at person2 city0) (at person1 city3))))
	(n9  n8  (:goal (and (at person2 city3) (at person1 city2))))
	(n9  n7  (:goal (and (at person2 city0))))
	(n5  n11  (:goal (and (at person2 city1) (at person1 city0))))
	(n2  n13  (:goal (and (at person2 city2))))
	(n7  n0  (:goal (and (at person2 city3) (at person1 city3))))
	(n12  n5  (:goal (and (at person1 city1))))
	(n9  n3  (:goal (and (at person1 city2) (at person2 city1))))
	(n6  n3  (:goal (and (at person2 city0))))
	(n12  n2  (:goal (and (at person1 city2) (at person2 city3))))
	(n5  n10  (:goal (and (at person1 city0) (at person2 city1))))
	(n11  n0  (:goal (and (at person1 city3) (at person2 city0))))
	(n8  n3  (:goal (and (at person1 city0) (at person2 city0))))
	(n11  n8  (:goal (and (at person2 city0))))
	(n10  n2  (:goal (and (at person2 city0) (at person1 city0))))
	(n9  n6  (:goal (and (at person1 city3) (at person2 city3))))
	(n8  n11  (:goal (and (at person1 city2) (at person2 city1))))
	(n4  n7  (:goal (and (at person2 city1) (at person1 city2))))
	(n3  n12  (:goal (and (at person1 city1))))
	(n3  n6  (:goal (and (at person2 city3))))
	(n12  n11  (:goal (and (at person1 city1) (at person2 city2))))
)
)
