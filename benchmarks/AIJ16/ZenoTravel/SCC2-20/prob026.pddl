(define (planprog ZTRAVEL-5-22)
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
person15 - person
person16 - person
person17 - person
person18 - person
person19 - person
person20 - person
person21 - person
person22 - person
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
(at plane1 city18)
(fuel-level plane1 fl0)
(at plane2 city6)
(fuel-level plane2 fl0)
(at plane3 city3)
(fuel-level plane3 fl0)
(at plane4 city24)
(fuel-level plane4 fl0)
(at plane5 city23)
(fuel-level plane5 fl0)
(at person1 city23)
(at person2 city11)
(at person3 city2)
(at person4 city2)
(at person5 city12)
(at person6 city1)
(at person7 city21)
(at person8 city19)
(at person9 city14)
(at person10 city17)
(at person11 city8)
(at person12 city20)
(at person13 city14)
(at person14 city18)
(at person15 city24)
(at person16 city6)
(at person17 city18)
(at person18 city3)
(at person19 city19)
(at person20 city14)
(at person21 city18)
(at person22 city6)
(next fl0 fl1)
(next fl1 fl2)
(next fl2 fl3)

)

(:init-app n0)
(:transitions
	(n0  n1  (:goal (and (at plane4 city19)(at person1 city6)(at person2 city10)(at person4 city16)(at person5 city9)(at person6 city18)(at person7 city14)(at person8 city24)(at person9 city7)(at person10 city24)(at person11 city2)(at person12 city16)(at person13 city10)(at person14 city21)(at person15 city4)(at person16 city9)(at person17 city18)(at person18 city17)(at person19 city0)(at person20 city6)(at person21 city14)(at person22 city6))))
	(n0  n2  (:goal (and (at plane2 city15)(at person1 city11)(at person2 city18)(at person3 city21)(at person4 city7)(at person5 city1)(at person6 city24)(at person7 city12)(at person8 city7)(at person9 city2)(at person10 city19)(at person11 city17)(at person12 city24)(at person13 city24)(at person14 city4)(at person15 city2)(at person16 city3)(at person17 city9)(at person18 city16)(at person19 city22)(at person20 city14)(at person21 city15)(at person22 city11))))
	(n0  n3  (:goal (and (at plane5 city18)(at person1 city13)(at person2 city8)(at person3 city20)(at person4 city19)(at person5 city20)(at person6 city7)(at person7 city15)(at person8 city9)(at person9 city22)(at person10 city17)(at person11 city20)(at person12 city23)(at person13 city7)(at person14 city1)(at person15 city24)(at person16 city8)(at person17 city7)(at person18 city0)(at person19 city19)(at person20 city5)(at person21 city12)(at person22 city23))))
	(n1  n0  (:goal (and (at plane5 city0)(at person1 city24)(at person3 city10)(at person4 city2)(at person5 city23)(at person6 city20)(at person7 city24)(at person8 city0)(at person9 city14)(at person10 city10)(at person11 city10)(at person12 city20)(at person13 city4)(at person14 city4)(at person15 city2)(at person16 city23)(at person17 city4)(at person18 city11)(at person19 city0)(at person20 city22)(at person21 city17)(at person22 city17))))
	(n1  n2  (:goal (and (at person1 city12)(at person2 city18)(at person3 city7)(at person4 city4)(at person5 city6)(at person6 city6)(at person7 city15)(at person8 city18)(at person9 city8)(at person10 city24)(at person11 city8)(at person12 city8)(at person14 city0)(at person15 city17)(at person16 city3)(at person17 city20)(at person18 city19)(at person19 city8)(at person20 city10)(at person21 city22)(at person22 city2))))
	(n1  n3  (:goal (and (at plane2 city2)(at plane3 city10)(at plane5 city15)(at person1 city7)(at person2 city12)(at person3 city23)(at person4 city10)(at person5 city17)(at person6 city6)(at person8 city9)(at person9 city8)(at person10 city0)(at person11 city18)(at person12 city19)(at person13 city12)(at person14 city24)(at person15 city18)(at person16 city20)(at person17 city10)(at person18 city16)(at person19 city6)(at person20 city5)(at person21 city22)(at person22 city10))))
	(n2  n0  (:goal (and (at plane2 city19)(at plane3 city19)(at plane4 city3)(at person1 city20)(at person2 city16)(at person3 city19)(at person4 city23)(at person5 city15)(at person6 city14)(at person7 city8)(at person8 city16)(at person9 city6)(at person10 city16)(at person11 city20)(at person12 city1)(at person13 city23)(at person14 city14)(at person15 city15)(at person16 city21)(at person17 city16)(at person18 city16)(at person19 city18)(at person20 city7)(at person21 city3)(at person22 city9))))
	(n2  n1  (:goal (and (at plane1 city1)(at person1 city13)(at person2 city8)(at person3 city20)(at person4 city19)(at person5 city12)(at person6 city7)(at person7 city19)(at person8 city23)(at person9 city13)(at person10 city12)(at person11 city12)(at person12 city2)(at person13 city12)(at person14 city1)(at person15 city19)(at person16 city16)(at person17 city24)(at person18 city22)(at person19 city10)(at person20 city18)(at person21 city4)(at person22 city17))))
	(n2  n3  (:goal (and (at plane4 city12)(at person1 city13)(at person2 city17)(at person3 city3)(at person4 city16)(at person5 city6)(at person6 city3)(at person7 city22)(at person8 city13)(at person9 city6)(at person10 city0)(at person11 city8)(at person12 city18)(at person13 city18)(at person14 city19)(at person15 city22)(at person16 city16)(at person17 city16)(at person18 city12)(at person19 city8)(at person20 city21)(at person21 city0)(at person22 city23))))
	(n3  n0  (:goal (and (at person1 city4)(at person2 city23)(at person3 city2)(at person4 city16)(at person6 city15)(at person7 city23)(at person8 city5)(at person9 city1)(at person10 city2)(at person11 city7)(at person12 city21)(at person13 city2)(at person14 city14)(at person15 city5)(at person16 city22)(at person17 city12)(at person18 city20)(at person19 city1)(at person20 city16)(at person21 city9)(at person22 city16))))
	(n3  n1  (:goal (and (at plane1 city17)(at plane2 city2)(at person1 city20)(at person2 city18)(at person3 city23)(at person5 city11)(at person6 city11)(at person7 city14)(at person8 city0)(at person9 city24)(at person10 city19)(at person11 city13)(at person12 city1)(at person13 city3)(at person14 city1)(at person15 city13)(at person16 city14)(at person17 city11)(at person18 city7)(at person19 city11)(at person20 city13)(at person21 city20)(at person22 city23))))
	(n3  n2  (:goal (and (at plane5 city1)(at person1 city15)(at person2 city17)(at person3 city19)(at person4 city13)(at person5 city8)(at person6 city7)(at person7 city23)(at person8 city7)(at person9 city7)(at person10 city13)(at person11 city21)(at person12 city6)(at person13 city19)(at person14 city19)(at person15 city10)(at person16 city24)(at person17 city8)(at person18 city18)(at person19 city9)(at person20 city11)(at person21 city6)(at person22 city0))))
)
)
