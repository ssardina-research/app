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
city4 - city
fl0 - flevel
fl1 - flevel
fl2 - maxlevel
)

(:init
(at plane1 city0)
(fuel-level plane1 fl2)
(at plane2 city0)
(fuel-level plane2 fl2)
(at person1 city4)
(at person2 city0)
(at person3 city4)
(at person4 city0)
(at person5 city1)
(next fl0 fl1)
(next fl1 fl2)
(fuel-station city0)

)

(:init-app n0)
(:transitions
	(n0  n1  (:goal (and (at person4 city0) (at person2 city1) (at person1 city0) (at person5 city2))))
	(n0  n2  (:goal (and (at person2 city3) (at person3 city2))))
	(n0  n3  (:goal (and (at person2 city3))))
	(n0  n4  (:goal (and (at person3 city1))))
	(n0  n5  (:goal (and (at person3 city3) (at person5 city3) (at person4 city4))))
	(n0  n6  (:goal (and (at person1 city0) (at person5 city0) (at person2 city1) (at person4 city4))))
	(n0  n7  (:goal (and (at person3 city4))))
	(n1  n0  (:goal (and (at person5 city0) (at person4 city4))))
	(n1  n2  (:goal (and (at person1 city1))))
	(n1  n3  (:goal (and (at person1 city2) (at person3 city4))))
	(n1  n4  (:goal (and (at person3 city2) (at person4 city1) (at person5 city2) (at person1 city3))))
	(n1  n5  (:goal (and (at person2 city2) (at person3 city0) (at person1 city0))))
	(n1  n6  (:goal (and (at person1 city4) (at person3 city1) (at person4 city0) (at person2 city3))))
	(n1  n7  (:goal (and (at person3 city2) (at person2 city0) (at person5 city4))))
	(n2  n0  (:goal (and (at person1 city3) (at person5 city4) (at person4 city3))))
	(n2  n1  (:goal (and (at person3 city3))))
	(n2  n3  (:goal (and (at person5 city1) (at person1 city1))))
	(n2  n4  (:goal (and (at person2 city1) (at person5 city0))))
	(n2  n5  (:goal (and (at person3 city3) (at person5 city0) (at person4 city1))))
	(n2  n6  (:goal (and (at person1 city1) (at person5 city2))))
	(n2  n7  (:goal (and (at person5 city2) (at person2 city4))))
	(n3  n0  (:goal (and (at person2 city2) (at person3 city1) (at person4 city4))))
	(n3  n1  (:goal (and (at person1 city4))))
	(n3  n2  (:goal (and (at person5 city4) (at person2 city1))))
	(n3  n4  (:goal (and (at person4 city3) (at person2 city0))))
	(n3  n5  (:goal (and (at person1 city2) (at person5 city1))))
	(n3  n6  (:goal (and (at person3 city2) (at person5 city4) (at person4 city2) (at person2 city2))))
	(n3  n7  (:goal (and (at person3 city3))))
	(n4  n0  (:goal (and (at person5 city4) (at person1 city4) (at person2 city1) (at person3 city0))))
	(n4  n1  (:goal (and (at person5 city3) (at person3 city0) (at person2 city3))))
	(n4  n2  (:goal (and (at person4 city2) (at person2 city3) (at person1 city4) (at person3 city1))))
	(n4  n3  (:goal (and (at person2 city2) (at person1 city3))))
	(n4  n5  (:goal (and (at person1 city4) (at person3 city0) (at person4 city1) (at person2 city3))))
	(n4  n6  (:goal (and (at person5 city0) (at person3 city1) (at person4 city4))))
	(n4  n7  (:goal (and (at person2 city0) (at person3 city0) (at person1 city4) (at person4 city2))))
	(n5  n0  (:goal (and (at person5 city0) (at person1 city4))))
	(n5  n1  (:goal (and (at person1 city0) (at person4 city4) (at person3 city1) (at person2 city3))))
	(n5  n2  (:goal (and (at person4 city4) (at person2 city2))))
	(n5  n3  (:goal (and (at person2 city1) (at person5 city0) (at person4 city3))))
	(n5  n4  (:goal (and (at person1 city2) (at person3 city1) (at person4 city3) (at person5 city0))))
	(n5  n6  (:goal (and (at person1 city4) (at person2 city0) (at person4 city0))))
	(n5  n7  (:goal (and (at person4 city0) (at person1 city0) (at person5 city3) (at person2 city4))))
	(n6  n0  (:goal (and (at person1 city0) (at person3 city2) (at person2 city1))))
	(n6  n1  (:goal (and (at person3 city0))))
	(n6  n2  (:goal (and (at person5 city0) (at person3 city1) (at person1 city4))))
	(n6  n3  (:goal (and (at person3 city2) (at person5 city2) (at person1 city1) (at person2 city1))))
	(n6  n4  (:goal (and (at person2 city1) (at person4 city1) (at person5 city1))))
	(n6  n5  (:goal (and (at person3 city3) (at person2 city3))))
	(n6  n7  (:goal (and (at person4 city4) (at person3 city3) (at person1 city3) (at person5 city0))))
	(n7  n0  (:goal (and (at person4 city4))))
	(n7  n1  (:goal (and (at person5 city0) (at person1 city1) (at person3 city1) (at person2 city1))))
	(n7  n2  (:goal (and (at person1 city1) (at person2 city2) (at person3 city0) (at person5 city4))))
	(n7  n3  (:goal (and (at person4 city2))))
	(n7  n4  (:goal (and (at person3 city2) (at person5 city1) (at person2 city2) (at person1 city1))))
	(n7  n5  (:goal (and (at person4 city1) (at person1 city0) (at person5 city4))))
	(n7  n6  (:goal (and (at person3 city3) (at person5 city2) (at person4 city3) (at person1 city4))))
)
)
