(define (planprog ZTRAVEL-1-2)
(:domain zeno-travel)
(:objects
plane1 - aircraft
person1 - person
person2 - person
city0 - city
city1 - city
city2 - city
fl0 - flevel
fl1 - flevel
fl2 - flevel
fl3 - flevel
fl4 - flevel
fl5 - flevel
fl6 - flevel
)

(:init
(at plane1 city0)
(fuel-level plane1 fl0)
(at person1 city0)
(at person2 city0)
(next fl0 fl1)
(next fl1 fl2)
(next fl2 fl3)
(next fl3 fl4)
(next fl4 fl5)
(next fl5 fl6)

)

(:init-app n0)
(:transitions
	(n0  n1  (:goal (and (at person2 city2))))
	(n1  n2  (:goal (and (at person2 city0))))
	(n2  n3  (:goal (and (at person2 city2))))
	(n3  n4  (:goal (and (at plane1 city0)(at person1 city1))))
	(n4  n5  (:goal (and (at person2 city0))))
	(n5  n6  (:goal (and (at person1 city0))))
	(n6  n7  (:goal (and (at person2 city0))))
	(n7  n8  (:goal (and (at person2 city0))))
	(n8  n9  (:goal (and (at person1 city0)(at person2 city1))))
	(n9  n10  (:goal (and (at person1 city1))))
	(n10  n11  (:goal (and (at person2 city1))))
	(n11  n12  (:goal (and (at person2 city2))))
	(n12  n13  (:goal (and (at person2 city0))))
	(n13  n14  (:goal (and (at person2 city0))))
	(n14  n15  (:goal (and (at person2 city0))))
	(n15  n16  (:goal (and (at person2 city2))))
	(n16  n17  (:goal (and (at person2 city0))))
	(n17  n18  (:goal (and (at person2 city1))))
	(n18  n19  (:goal (and (at person2 city2))))
	(n19  n20  (:goal (and (at person2 city0))))
	(n20  n21  (:goal (and (at person1 city0))))
	(n21  n22  (:goal (and (at person2 city2))))
	(n22  n23  (:goal (and (at person2 city2))))
	(n23  n24  (:goal (and (at person2 city0))))
	(n24  n25  (:goal (and (at person1 city2))))
	(n25  n24  (:goal (and (at person2 city2))))
	(n24  n23  (:goal (and (at person2 city1))))
	(n23  n22  (:goal (and (at person2 city2))))
	(n22  n21  (:goal (and (at person1 city2))))
	(n21  n20  (:goal (and (at person2 city2))))
	(n20  n19  (:goal (and (at person2 city1))))
	(n19  n18  (:goal (and (at person2 city1))))
	(n18  n17  (:goal (and (at person2 city2))))
	(n17  n16  (:goal (and (at person2 city1))))
	(n16  n15  (:goal (and (at person1 city0)(at person2 city1))))
	(n15  n14  (:goal (and (at person2 city1))))
	(n14  n13  (:goal (and (at person1 city0))))
	(n13  n12  (:goal (and (at person1 city2))))
	(n12  n11  (:goal (and (at person2 city2))))
	(n11  n10  (:goal (and (at person2 city1))))
	(n10  n9  (:goal (and (at person2 city1))))
	(n9  n8  (:goal (and (at person1 city2))))
	(n8  n7  (:goal (and (at person2 city0))))
	(n7  n6  (:goal (and (at person2 city1))))
	(n6  n5  (:goal (and (at person2 city2))))
	(n5  n4  (:goal (and (at person1 city0))))
	(n4  n3  (:goal (and (at person2 city1))))
	(n3  n2  (:goal (and (at person1 city0))))
	(n2  n1  (:goal (and (at person2 city1))))
	(n1  n0  (:goal (and (at person2 city2))))
)
)
