(define (planprog ZTRAVEL-5-18)
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
(at plane1 city17)
(fuel-level plane1 fl0)
(at plane2 city0)
(fuel-level plane2 fl0)
(at plane3 city24)
(fuel-level plane3 fl0)
(at plane4 city6)
(fuel-level plane4 fl0)
(at plane5 city1)
(fuel-level plane5 fl0)
(at person1 city10)
(at person2 city19)
(at person3 city11)
(at person4 city18)
(at person5 city17)
(at person6 city24)
(at person7 city7)
(at person8 city23)
(at person9 city14)
(at person10 city10)
(at person11 city14)
(at person12 city5)
(at person13 city8)
(at person14 city8)
(at person15 city6)
(at person16 city1)
(at person17 city22)
(at person18 city18)
(next fl0 fl1)
(next fl1 fl2)
(next fl2 fl3)

)

(:init-app n0)
(:transitions
	(n0  n1  (:goal (and (at plane2 city13)(at plane3 city16)(at person1 city15)(at person2 city13)(at person3 city23)(at person4 city20)(at person5 city8)(at person6 city11)(at person7 city2)(at person8 city4)(at person9 city13)(at person10 city16)(at person11 city8)(at person12 city11)(at person13 city7)(at person14 city24)(at person15 city3)(at person16 city6)(at person17 city4)(at person18 city4))))
	(n0  n2  (:goal (and (at plane1 city8)(at plane2 city2)(at plane5 city24)(at person1 city3)(at person2 city13)(at person4 city4)(at person5 city3)(at person6 city18)(at person7 city10)(at person8 city9)(at person9 city3)(at person10 city19)(at person11 city10)(at person12 city15)(at person13 city11)(at person14 city6)(at person15 city7)(at person16 city8)(at person17 city12)(at person18 city15))))
	(n0  n3  (:goal (and (at plane2 city21)(at plane5 city13)(at person1 city16)(at person2 city5)(at person3 city23)(at person4 city2)(at person5 city24)(at person6 city3)(at person7 city4)(at person8 city0)(at person9 city12)(at person10 city24)(at person11 city22)(at person13 city13)(at person14 city19)(at person16 city5)(at person17 city9)(at person18 city2))))
	(n1  n0  (:goal (and (at plane4 city0)(at person1 city0)(at person2 city2)(at person3 city22)(at person5 city18)(at person6 city19)(at person7 city18)(at person8 city15)(at person9 city14)(at person10 city13)(at person11 city0)(at person12 city21)(at person13 city24)(at person14 city12)(at person16 city20)(at person17 city9)(at person18 city5))))
	(n1  n2  (:goal (and (at plane1 city4)(at plane3 city12)(at person1 city2)(at person2 city9)(at person3 city11)(at person4 city7)(at person5 city3)(at person6 city2)(at person7 city2)(at person8 city21)(at person9 city3)(at person10 city18)(at person11 city9)(at person12 city9)(at person13 city14)(at person14 city3)(at person15 city13)(at person16 city10)(at person17 city12)(at person18 city20))))
	(n1  n3  (:goal (and (at person1 city6)(at person2 city11)(at person3 city14)(at person4 city15)(at person5 city8)(at person6 city18)(at person7 city23)(at person8 city22)(at person9 city5)(at person10 city22)(at person11 city5)(at person12 city16)(at person13 city22)(at person14 city17)(at person15 city12)(at person16 city19)(at person17 city24)(at person18 city12))))
	(n2  n0  (:goal (and (at person1 city13)(at person2 city21)(at person3 city24)(at person4 city1)(at person5 city1)(at person6 city16)(at person7 city1)(at person8 city13)(at person9 city6)(at person10 city9)(at person11 city17)(at person12 city6)(at person13 city1)(at person14 city15)(at person15 city24)(at person16 city21)(at person17 city22)(at person18 city4))))
	(n2  n1  (:goal (and (at plane1 city21)(at plane3 city7)(at plane4 city21)(at person1 city14)(at person2 city22)(at person3 city15)(at person4 city12)(at person5 city20)(at person6 city18)(at person7 city18)(at person8 city24)(at person9 city6)(at person10 city19)(at person11 city17)(at person13 city22)(at person14 city12)(at person15 city15)(at person16 city22)(at person17 city23)(at person18 city4))))
	(n2  n3  (:goal (and (at plane1 city11)(at plane5 city5)(at person1 city17)(at person2 city16)(at person3 city4)(at person4 city3)(at person5 city12)(at person6 city18)(at person7 city18)(at person8 city13)(at person9 city9)(at person10 city19)(at person11 city10)(at person12 city3)(at person13 city12)(at person14 city23)(at person15 city12)(at person16 city12)(at person17 city15)(at person18 city23))))
	(n3  n0  (:goal (and (at plane1 city19)(at plane3 city0)(at plane4 city6)(at person1 city2)(at person2 city16)(at person3 city18)(at person4 city0)(at person5 city11)(at person6 city18)(at person8 city0)(at person9 city7)(at person10 city15)(at person11 city10)(at person12 city14)(at person13 city0)(at person14 city10)(at person15 city23)(at person16 city6)(at person17 city0))))
	(n3  n1  (:goal (and (at plane2 city24)(at plane3 city9)(at plane4 city1)(at person1 city24)(at person2 city21)(at person3 city7)(at person4 city9)(at person5 city5)(at person6 city4)(at person7 city2)(at person8 city23)(at person9 city0)(at person10 city1)(at person11 city16)(at person12 city12)(at person13 city19)(at person14 city12)(at person15 city19)(at person16 city3)(at person17 city4)(at person18 city15))))
	(n3  n2  (:goal (and (at plane1 city1)(at plane3 city8)(at plane5 city7)(at person1 city8)(at person2 city1)(at person3 city22)(at person4 city20)(at person5 city19)(at person6 city9)(at person7 city10)(at person8 city11)(at person9 city15)(at person10 city6)(at person11 city15)(at person12 city11)(at person13 city6)(at person14 city17)(at person15 city6)(at person16 city17)(at person17 city17)(at person18 city0))))
)
)
