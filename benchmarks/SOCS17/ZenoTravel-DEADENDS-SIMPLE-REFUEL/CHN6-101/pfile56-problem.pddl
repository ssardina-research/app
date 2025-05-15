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
	(n0  n1  (:goal (and (at plane2 city2))))
	(n1  n2  (:goal (and (at plane1 city3) (at plane2 city2))))
	(n2  n3  (:goal (and (at person5 city1))))
	(n3  n4  (:goal (and (at plane1 city1))))
	(n4  n5  (:goal (and (at person3 city1) (at person4 city3))))
	(n5  n6  (:goal (and (at person4 city2))))
	(n6  n7  (:goal (and (at person5 city3))))
	(n7  n8  (:goal (and (at person3 city2) (at person1 city2))))
	(n8  n9  (:goal (and (at plane1 city1) (at person2 city1))))
	(n9  n10  (:goal (and (at person3 city2) (at person1 city2))))
	(n10  n11  (:goal (and (at person5 city3) (at person2 city1))))
	(n11  n12  (:goal (and (at plane1 city1))))
	(n12  n13  (:goal (and (at plane1 city1))))
	(n13  n14  (:goal (and (at plane2 city3) (at person4 city2))))
	(n14  n15  (:goal (and (at person1 city2) (at person4 city1))))
	(n15  n16  (:goal (and (at person3 city1) (at person5 city1))))
	(n16  n17  (:goal (and (at person1 city2))))
	(n17  n18  (:goal (and (at person3 city3) (at plane2 city3))))
	(n18  n19  (:goal (and (at plane1 city1))))
	(n19  n20  (:goal (and (at plane2 city2) (at person5 city2))))
	(n20  n21  (:goal (and (at person3 city3) (at person1 city2))))
	(n21  n22  (:goal (and (at person1 city1) (at plane1 city2))))
	(n22  n23  (:goal (and (at person3 city2))))
	(n23  n24  (:goal (and (at person5 city3))))
	(n24  n25  (:goal (and (at person2 city1))))
	(n25  n26  (:goal (and (at person3 city3))))
	(n26  n27  (:goal (and (at person2 city3) (at plane2 city1))))
	(n27  n28  (:goal (and (at person5 city2))))
	(n28  n29  (:goal (and (at person5 city3) (at person2 city1))))
	(n29  n30  (:goal (and (at person3 city1))))
	(n30  n31  (:goal (and (at person3 city2))))
	(n31  n32  (:goal (and (at person4 city1) (at plane2 city2))))
	(n32  n33  (:goal (and (at person2 city1))))
	(n33  n34  (:goal (and (at person4 city3) (at person3 city1))))
	(n34  n35  (:goal (and (at plane1 city2) (at person3 city1))))
	(n35  n36  (:goal (and (at person1 city2))))
	(n36  n37  (:goal (and (at person4 city2))))
	(n37  n38  (:goal (and (at plane2 city3) (at person5 city2))))
	(n38  n39  (:goal (and (at plane2 city1) (at person1 city2))))
	(n39  n40  (:goal (and (at person2 city2) (at plane2 city1))))
	(n40  n41  (:goal (and (at person4 city2) (at person2 city1))))
	(n41  n42  (:goal (and (at person1 city3))))
	(n42  n43  (:goal (and (at person5 city1))))
	(n43  n44  (:goal (and (at person1 city3) (at plane2 city1))))
	(n44  n45  (:goal (and (at person4 city3) (at person2 city2))))
	(n45  n46  (:goal (and (at person4 city2))))
	(n46  n47  (:goal (and (at person5 city3) (at person3 city1))))
	(n47  n48  (:goal (and (at person5 city3))))
	(n48  n49  (:goal (and (at plane1 city1) (at person5 city3))))
	(n49  n50  (:goal (and (at plane2 city2) (at plane1 city1))))
	(n50  n51  (:goal (and (at person4 city3))))
	(n51  n52  (:goal (and (at plane2 city1) (at person3 city1))))
	(n52  n53  (:goal (and (at person1 city1) (at person4 city1))))
	(n53  n54  (:goal (and (at person3 city2))))
	(n54  n55  (:goal (and (at person5 city3))))
	(n55  n56  (:goal (and (at person2 city2) (at plane1 city2))))
)
)
