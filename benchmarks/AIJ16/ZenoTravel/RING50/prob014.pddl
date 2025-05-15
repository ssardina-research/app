(define (planprog ZTRAVEL-3-8)
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
person6 - person
person7 - person
person8 - person
city0 - city
city1 - city
city2 - city
city3 - city
city4 - city
city5 - city
city6 - city
fl0 - flevel
fl1 - flevel
fl2 - flevel
fl3 - flevel
fl4 - flevel
fl5 - flevel
fl6 - flevel
)

(:init
(at plane1 city5)
(fuel-level plane1 fl0)
(at plane2 city4)
(fuel-level plane2 fl0)
(at plane3 city3)
(fuel-level plane3 fl0)
(at person1 city0)
(at person2 city5)
(at person3 city3)
(at person4 city1)
(at person5 city5)
(at person6 city6)
(at person7 city3)
(at person8 city6)
(next fl0 fl1)
(next fl1 fl2)
(next fl2 fl3)
(next fl3 fl4)
(next fl4 fl5)
(next fl5 fl6)

)

(:init-app n0)
(:transitions
	(n0  n1  (:goal (and (at plane1 city6)(at person1 city5))))
	(n1  n2  (:goal (and (at plane1 city2)(at person1 city3)(at person3 city0))))
	(n2  n3  (:goal (and (at plane2 city1))))
	(n3  n4  (:goal (and (at plane3 city4)(at person2 city5)(at person5 city3))))
	(n4  n5  (:goal (and (at person2 city0)(at person3 city1)(at person5 city4))))
	(n5  n6  (:goal (and (at plane3 city2)(at person1 city5)(at person3 city4))))
	(n6  n7  (:goal (and (at person4 city4)(at person6 city4)(at person8 city4))))
	(n7  n8  (:goal (and (at person6 city6)(at person7 city3))))
	(n8  n9  (:goal (and (at person8 city0))))
	(n9  n10  (:goal (and (at person2 city0)(at person8 city4))))
	(n10  n11  (:goal (and (at person5 city0)(at person6 city4))))
	(n11  n12  (:goal (and (at person6 city5)(at person8 city3))))
	(n12  n13  (:goal (and (at person8 city2))))
	(n13  n14  (:goal (and (at plane2 city3)(at person7 city4)(at person8 city1))))
	(n14  n15  (:goal (and (at plane1 city2)(at person1 city0))))
	(n15  n16  (:goal (and (at person1 city1)(at person3 city3))))
	(n16  n17  (:goal (and (at person3 city5)(at person5 city4))))
	(n17  n18  (:goal (and (at person1 city5)(at person4 city0)(at person6 city4)(at person7 city4))))
	(n18  n19  (:goal (and (at plane1 city0)(at person2 city3)(at person5 city2)(at person6 city5)(at person8 city4))))
	(n19  n20  (:goal (and (at person1 city4)(at person7 city6)(at person8 city5))))
	(n20  n21  (:goal (and (at plane3 city5)(at person1 city6)(at person7 city4)(at person8 city1))))
	(n21  n22  (:goal (and (at person2 city2)(at person3 city4))))
	(n22  n23  (:goal (and (at person2 city0)(at person8 city4))))
	(n23  n24  (:goal (and (at person8 city3))))
	(n24  n25  (:goal (and (at person1 city3)(at person4 city4))))
	(n25  n26  (:goal (and (at person2 city6))))
	(n26  n27  (:goal (and (at plane2 city2)(at person1 city1)(at person4 city5)(at person7 city1))))
	(n27  n28  (:goal (and (at person3 city6)(at person4 city4)(at person6 city4))))
	(n28  n29  (:goal (and (at person6 city3)(at person7 city3))))
	(n29  n30  (:goal (and (at person2 city4)(at person7 city5))))
	(n30  n31  (:goal (and (at person1 city4)(at person2 city4)(at person8 city3))))
	(n31  n32  (:goal (and (at person8 city1))))
	(n32  n33  (:goal (and (at person2 city0)(at person7 city1))))
	(n33  n34  (:goal (and (at person1 city6)(at person4 city0)(at person6 city4))))
	(n34  n35  (:goal (and (at person8 city1))))
	(n35  n36  (:goal (and (at person3 city0)(at person4 city0)(at person6 city3))))
	(n36  n37  (:goal (and (at person1 city4)(at person7 city0)(at person8 city6))))
	(n37  n38  (:goal (and (at person8 city2))))
	(n38  n39  (:goal (and (at person4 city2)(at person5 city5)(at person7 city0))))
	(n39  n40  (:goal (and (at person1 city2)(at person4 city6))))
	(n40  n41  (:goal (and (at person1 city3)(at person3 city1)(at person4 city2))))
	(n41  n42  (:goal (and (at person2 city4)(at person5 city2))))
	(n42  n43  (:goal (and (at person3 city6)(at person4 city6)(at person6 city0))))
	(n43  n44  (:goal (and (at person1 city3)(at person8 city3))))
	(n44  n45  (:goal (and (at plane2 city5)(at person2 city2)(at person4 city4))))
	(n45  n46  (:goal (and (at person6 city5)(at person7 city3))))
	(n46  n47  (:goal (and (at plane1 city3)(at person8 city3))))
	(n47  n48  (:goal (and (at person1 city4)(at person3 city4)(at person4 city2))))
	(n48  n49  (:goal (and (at person3 city1)(at person4 city5))))
	(n49  n0  (:goal (and (at person8 city0))))
)
)
