(define (planprog ZTRAVEL-5-10)
(:domain zeno-travel)
(:objects
plane1 - aircraft
plane2 - aircraft
plane3 - aircraft
plane4 - aircraft
plane5 - aircraft
person1 - person
person2 - person
person3 - person
person4 - person
person5 - person
person6 - person
person7 - person
person8 - person
person9 - person
person10 - person
city0 - city
city1 - city
city2 - city
city3 - city
city4 - city
city5 - city
city6 - city
city7 - city
city8 - city
city9 - city
city10 - city
city11 - city
city12 - city
city13 - city
city14 - city
city15 - city
city16 - city
city17 - city
city18 - city
city19 - city
city20 - city
city21 - city
city22 - city
city23 - city
city24 - city
fl0 - flevel
fl1 - flevel
fl2 - flevel
fl3 - flevel
)

(:init
(at plane1 city4)
(fuel-level plane1 fl0)
(at plane2 city0)
(fuel-level plane2 fl0)
(at plane3 city1)
(fuel-level plane3 fl0)
(at plane4 city9)
(fuel-level plane4 fl0)
(at plane5 city12)
(fuel-level plane5 fl0)
(at person1 city4)
(at person2 city21)
(at person3 city13)
(at person4 city23)
(at person5 city2)
(at person6 city15)
(at person7 city4)
(at person8 city15)
(at person9 city11)
(at person10 city20)
(next fl0 fl1)
(next fl1 fl2)
(next fl2 fl3)

)

(:init-app n0)
(:transitions
	(n0  n1  (:goal (and (at plane1 city1)(at plane5 city18)(at person1 city14)(at person2 city11)(at person3 city16)(at person4 city5)(at person5 city1)(at person6 city17)(at person7 city22)(at person8 city13)(at person9 city8)(at person10 city15))))
	(n0  n2  (:goal (and (at plane4 city0)(at plane5 city8)(at person1 city19)(at person2 city18)(at person3 city23)(at person4 city23)(at person5 city5)(at person6 city15)(at person7 city13)(at person8 city4)(at person9 city22))))
	(n0  n3  (:goal (and (at plane3 city21)(at person1 city21)(at person2 city19)(at person3 city21)(at person4 city1)(at person5 city18)(at person6 city4)(at person7 city6)(at person8 city21)(at person9 city6)(at person10 city3))))
	(n1  n0  (:goal (and (at plane3 city16)(at person1 city22)(at person2 city12)(at person3 city0)(at person4 city6)(at person5 city20)(at person6 city0)(at person7 city17)(at person9 city12)(at person10 city7))))
	(n1  n2  (:goal (and (at plane1 city14)(at person1 city12)(at person2 city8)(at person3 city12)(at person4 city1)(at person5 city24)(at person6 city4)(at person7 city18)(at person8 city7)(at person9 city17)(at person10 city4))))
	(n1  n3  (:goal (and (at plane2 city13)(at plane5 city6)(at person1 city5)(at person2 city10)(at person3 city7)(at person4 city11)(at person5 city23)(at person6 city0)(at person7 city16)(at person8 city3)(at person9 city8)(at person10 city13))))
	(n2  n0  (:goal (and (at plane2 city4)(at person1 city13)(at person2 city11)(at person3 city16)(at person4 city0)(at person5 city2)(at person6 city2)(at person7 city8)(at person10 city14))))
	(n2  n1  (:goal (and (at person1 city4)(at person2 city8)(at person3 city3)(at person4 city0)(at person5 city23)(at person6 city12)(at person7 city12)(at person8 city18)(at person9 city1)(at person10 city15))))
	(n2  n3  (:goal (and (at plane2 city17)(at plane3 city23)(at person1 city16)(at person2 city19)(at person3 city21)(at person4 city15)(at person5 city5)(at person6 city2)(at person7 city17)(at person8 city19)(at person9 city15)(at person10 city5))))
	(n3  n0  (:goal (and (at plane3 city13)(at plane5 city23)(at person1 city23)(at person2 city3)(at person3 city8)(at person4 city7)(at person5 city23)(at person6 city0)(at person7 city12)(at person8 city15)(at person9 city18)(at person10 city21))))
	(n3  n1  (:goal (and (at plane1 city15)(at plane2 city3)(at plane4 city0)(at plane5 city5)(at person1 city4)(at person2 city10)(at person3 city11)(at person4 city11)(at person5 city5)(at person6 city21)(at person7 city15)(at person8 city10)(at person9 city17)(at person10 city19))))
	(n3  n2  (:goal (and (at plane2 city13)(at person1 city15)(at person2 city5)(at person3 city22)(at person4 city7)(at person5 city20)(at person6 city19)(at person7 city6)(at person8 city9)(at person9 city24)(at person10 city9))))
)
)
