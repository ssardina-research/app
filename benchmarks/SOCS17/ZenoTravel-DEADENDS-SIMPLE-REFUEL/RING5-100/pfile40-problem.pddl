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
(at person1 city2)
(at person2 city2)
(at person3 city2)
(next fl0 fl1)
(next fl1 fl2)
(fuel-station city0)

)

(:init-app n0)
(:transitions
	(n0  n1  (:goal (and (in person2 plane1) (in person3 plane1))))
	(n1  n2  (:goal (and (in person2 plane2) (in person3 plane2))))
	(n2  n3  (:goal (and (in person2 plane2) (at plane1 city2))))
	(n3  n4  (:goal (and (fuel-level plane2 fl2))))
	(n4  n5  (:goal (and (at plane1 city2) (at plane2 city2))))
	(n5  n6  (:goal (and (at person3 city0) (at plane1 city2))))
	(n6  n7  (:goal (and (at plane1 city2) (at plane2 city2))))
	(n7  n8  (:goal (and (in person1 plane1) (at plane1 city1))))
	(n8  n9  (:goal (and (at person2 city2) (at plane2 city0))))
	(n9  n10  (:goal (and (at person2 city2) (at plane2 city2))))
	(n10  n11  (:goal (and (at person2 city2) (in person3 plane1))))
	(n11  n12  (:goal (and (at person3 city0))))
	(n12  n13  (:goal (and (in person2 plane2) (at plane2 city1))))
	(n13  n14  (:goal (and (in person1 plane1) (at plane1 city0))))
	(n14  n15  (:goal (and (in person2 plane1) (at plane2 city1))))
	(n15  n16  (:goal (and (at person2 city0) (at plane2 city2))))
	(n16  n17  (:goal (and (at person2 city0) (at plane1 city0))))
	(n17  n18  (:goal (and (in person3 plane1) (at plane1 city0))))
	(n18  n19  (:goal (and (in person1 plane2) (at plane1 city2))))
	(n19  n20  (:goal (and (fuel-level plane1 fl0))))
	(n20  n21  (:goal (and (at person1 city0) (at person3 city1))))
	(n21  n22  (:goal (and (at plane1 city1))))
	(n22  n23  (:goal (and (in person1 plane2) (at person2 city0))))
	(n23  n24  (:goal (and (in person1 plane2) (at plane2 city0))))
	(n24  n25  (:goal (and (in person1 plane2) (at person2 city0))))
	(n25  n26  (:goal (and (at person3 city1) (at plane1 city2))))
	(n26  n27  (:goal (and (at person1 city1) (in person2 plane1))))
	(n27  n28  (:goal (and (fuel-level plane2 fl2))))
	(n28  n29  (:goal (and (in person2 plane2) (in person3 plane1))))
	(n29  n30  (:goal (and (at person1 city1) (in person2 plane2))))
	(n30  n31  (:goal (and (at person3 city2) (at plane1 city2))))
	(n31  n32  (:goal (and (at person1 city0) (at person3 city2))))
	(n32  n33  (:goal (and (at person3 city0) (at plane1 city0))))
	(n33  n34  (:goal (and (at person2 city0) (in person3 plane1))))
	(n34  n35  (:goal (and (in person1 plane2) (in person3 plane1))))
	(n35  n36  (:goal (and (in person2 plane1) (at plane2 city0))))
	(n36  n37  (:goal (and (in person1 plane2) (at person3 city1))))
	(n37  n38  (:goal (and (in person1 plane1) (at person3 city2))))
	(n38  n39  (:goal (and (at person1 city2) (at person2 city1))))
	(n39  n0  (:goal (and (fuel-level plane2 fl1))))
)
)
