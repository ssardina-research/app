(define (planprog ZTRAVEL-2-4)
(:domain zeno-travel)
(:objects
plane1 - aircraft
plane2 - aircraft
person1 - person
person2 - person
person3 - person
person4 - person
city0 - city
city1 - city
city2 - city
city3 - city
fl0 - flevel
fl1 - flevel
fl2 - maxlevel
)

(:init
(at plane1 city1)
(fuel-level plane1 fl2)
(at plane2 city1)
(fuel-level plane2 fl2)
(at person1 city2)
(at person2 city0)
(at person3 city2)
(at person4 city0)
(next fl0 fl1)
(next fl1 fl2)
(fuel-station city0)

)

(:init-app n0)
(:transitions
	(n0  n1  (:goal (and (at person1 city0) (at person2 city3) (at person3 city0))))
	(n1  n2  (:goal (and (at person3 city0))))
	(n2  n3  (:goal (and (at person4 city1))))
	(n3  n4  (:goal (and (at plane1 city0) (at plane2 city1) (at person4 city0))))
	(n4  n5  (:goal (and (at person1 city3) (at person4 city3))))
	(n5  n6  (:goal (and (at plane2 city3) (at person1 city2) (at person4 city0))))
	(n6  n7  (:goal (and (at person3 city0) (at person4 city0))))
	(n7  n8  (:goal (and (at person1 city3))))
	(n8  n9  (:goal (and (at person1 city2))))
	(n9  n10  (:goal (and (at person4 city2))))
	(n10  n11  (:goal (and (at person3 city1) (at person4 city3))))
	(n11  n12  (:goal (and (at person1 city3) (at person2 city0))))
	(n12  n13  (:goal (and (at plane2 city2))))
	(n13  n14  (:goal (and (at person2 city0) (at person3 city1))))
	(n14  n15  (:goal (and (at plane1 city2))))
	(n15  n16  (:goal (and (at plane1 city0) (at person1 city1) (at person3 city1))))
	(n16  n17  (:goal (and (at person4 city0))))
	(n17  n18  (:goal (and (at person1 city1))))
	(n18  n19  (:goal (and (at person3 city0))))
	(n19  n20  (:goal (and (at person1 city1) (at person3 city3))))
	(n20  n21  (:goal (and (at person4 city2))))
	(n21  n22  (:goal (and (at person3 city3))))
	(n22  n23  (:goal (and (at plane1 city3) (at person3 city1) (at person4 city0))))
	(n23  n24  (:goal (and (at person1 city1))))
	(n24  n25  (:goal (and (at plane2 city3) (at person3 city0))))
	(n25  n24  (:goal (and (at person4 city3))))
	(n24  n23  (:goal (and (at person4 city0))))
	(n23  n22  (:goal (and (at person3 city3))))
	(n22  n21  (:goal (and (at person1 city1) (at person2 city0))))
	(n21  n20  (:goal (and (at person1 city3) (at person3 city1))))
	(n20  n19  (:goal (and (at person2 city2) (at person3 city1))))
	(n19  n18  (:goal (and (at person4 city0))))
	(n18  n17  (:goal (and (at person1 city3))))
	(n17  n16  (:goal (and (at person4 city2))))
	(n16  n15  (:goal (and (at person1 city2))))
	(n15  n14  (:goal (and (at plane2 city2))))
	(n14  n13  (:goal (and (at person2 city3) (at person4 city0))))
	(n13  n12  (:goal (and (at person4 city0))))
	(n12  n11  (:goal (and (at person1 city1) (at person2 city0))))
	(n11  n10  (:goal (and (at plane1 city2))))
	(n10  n9  (:goal (and (at person2 city2) (at person4 city1))))
	(n9  n8  (:goal (and (at person3 city2) (at person4 city1))))
	(n8  n7  (:goal (and (at person4 city2))))
	(n7  n6  (:goal (and (at person1 city2) (at person2 city3) (at person4 city2))))
	(n6  n5  (:goal (and (at person2 city2) (at person4 city3))))
	(n5  n4  (:goal (and (at person4 city3))))
	(n4  n3  (:goal (and (at person2 city3) (at person3 city1))))
	(n3  n2  (:goal (and (at person4 city0))))
	(n2  n1  (:goal (and (at person1 city1))))
	(n1  n0  (:goal (and (at person3 city0) (at person4 city0))))
)
)
