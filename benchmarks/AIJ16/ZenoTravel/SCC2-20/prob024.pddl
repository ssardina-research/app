(define (planprog ZTRAVEL-5-14)
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
person11 - person
person12 - person
person13 - person
person14 - person
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
(at plane1 city6)
(fuel-level plane1 fl0)
(at plane2 city21)
(fuel-level plane2 fl0)
(at plane3 city12)
(fuel-level plane3 fl0)
(at plane4 city20)
(fuel-level plane4 fl0)
(at plane5 city9)
(fuel-level plane5 fl0)
(at person1 city3)
(at person2 city3)
(at person3 city23)
(at person4 city19)
(at person5 city1)
(at person6 city20)
(at person7 city10)
(at person8 city16)
(at person9 city5)
(at person10 city11)
(at person11 city22)
(at person12 city6)
(at person13 city11)
(at person14 city8)
(next fl0 fl1)
(next fl1 fl2)
(next fl2 fl3)

)

(:init-app n0)
(:transitions
	(n0  n1  (:goal (and (at plane5 city4)(at person1 city6)(at person2 city13)(at person3 city13)(at person4 city17)(at person5 city15)(at person6 city16)(at person7 city2)(at person8 city5)(at person9 city20)(at person10 city22)(at person11 city7)(at person12 city24)(at person13 city5)(at person14 city24))))
	(n0  n2  (:goal (and (at plane2 city24)(at person1 city22)(at person2 city10)(at person3 city14)(at person4 city16)(at person5 city8)(at person6 city23)(at person7 city12)(at person8 city3)(at person9 city1)(at person10 city20)(at person11 city7)(at person12 city11)(at person13 city5)(at person14 city10))))
	(n0  n3  (:goal (and (at plane3 city18)(at person2 city17)(at person3 city23)(at person4 city0)(at person5 city21)(at person7 city16)(at person8 city2)(at person9 city24)(at person10 city7)(at person12 city11)(at person13 city3)(at person14 city14))))
	(n1  n0  (:goal (and (at plane1 city21)(at plane2 city11)(at person1 city20)(at person2 city15)(at person3 city21)(at person4 city18)(at person5 city8)(at person6 city8)(at person7 city21)(at person8 city22)(at person9 city15)(at person10 city6)(at person11 city24)(at person12 city4)(at person13 city11)(at person14 city11))))
	(n1  n2  (:goal (and (at plane1 city8)(at plane5 city4)(at person1 city19)(at person2 city24)(at person3 city21)(at person4 city16)(at person5 city15)(at person6 city1)(at person7 city8)(at person8 city17)(at person9 city7)(at person10 city2)(at person11 city5)(at person12 city12)(at person13 city3)(at person14 city13))))
	(n1  n3  (:goal (and (at plane1 city24)(at plane3 city15)(at person1 city11)(at person2 city18)(at person3 city15)(at person4 city1)(at person5 city24)(at person6 city10)(at person7 city22)(at person8 city18)(at person9 city7)(at person10 city3)(at person11 city9)(at person12 city8)(at person13 city13)(at person14 city12))))
	(n2  n0  (:goal (and (at plane3 city13)(at person1 city24)(at person2 city16)(at person4 city8)(at person5 city8)(at person6 city19)(at person7 city5)(at person8 city9)(at person9 city9)(at person10 city15)(at person11 city2)(at person12 city11)(at person13 city16)(at person14 city20))))
	(n2  n1  (:goal (and (at plane2 city10)(at plane3 city0)(at person1 city12)(at person2 city12)(at person3 city23)(at person4 city21)(at person5 city2)(at person6 city20)(at person7 city24)(at person8 city13)(at person9 city19)(at person10 city0)(at person11 city7)(at person12 city23)(at person13 city16)(at person14 city9))))
	(n2  n3  (:goal (and (at plane1 city11)(at plane2 city9)(at plane5 city7)(at person1 city17)(at person2 city11)(at person3 city9)(at person4 city24)(at person5 city18)(at person6 city18)(at person7 city2)(at person8 city9)(at person10 city0)(at person11 city24)(at person12 city4)(at person13 city17)(at person14 city0))))
	(n3  n0  (:goal (and (at plane1 city1)(at plane2 city7)(at plane5 city0)(at person1 city20)(at person2 city10)(at person3 city20)(at person4 city18)(at person5 city9)(at person6 city8)(at person7 city14)(at person8 city12)(at person9 city8)(at person10 city0)(at person11 city18)(at person12 city15)(at person13 city6)(at person14 city5))))
	(n3  n1  (:goal (and (at plane3 city10)(at plane4 city6)(at person1 city5)(at person2 city5)(at person3 city24)(at person4 city5)(at person5 city5)(at person6 city23)(at person7 city21)(at person8 city22)(at person9 city17)(at person10 city4)(at person12 city17)(at person13 city15)(at person14 city3))))
	(n3  n2  (:goal (and (at plane1 city3)(at plane2 city11)(at person1 city24)(at person2 city15)(at person3 city13)(at person4 city17)(at person5 city15)(at person6 city10)(at person7 city17)(at person8 city4)(at person9 city20)(at person10 city6)(at person11 city2)(at person12 city15)(at person14 city1))))
)
)
