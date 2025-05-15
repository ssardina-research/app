(define (planprog ZTRAVEL-5-26)
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
person23 - person
person24 - person
person25 - person
person26 - person
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
(at plane2 city24)
(fuel-level plane2 fl0)
(at plane3 city10)
(fuel-level plane3 fl0)
(at plane4 city18)
(fuel-level plane4 fl0)
(at plane5 city0)
(fuel-level plane5 fl0)
(at person1 city2)
(at person2 city14)
(at person3 city3)
(at person4 city21)
(at person5 city17)
(at person6 city12)
(at person7 city7)
(at person8 city8)
(at person9 city17)
(at person10 city4)
(at person11 city19)
(at person12 city20)
(at person13 city2)
(at person14 city22)
(at person15 city10)
(at person16 city21)
(at person17 city0)
(at person18 city5)
(at person19 city13)
(at person20 city16)
(at person21 city0)
(at person22 city7)
(at person23 city8)
(at person24 city16)
(at person25 city7)
(at person26 city0)
(next fl0 fl1)
(next fl1 fl2)
(next fl2 fl3)

)

(:init-app n0)
(:transitions
	(n0  n1  (:goal (and (at plane3 city10)(at plane4 city19)(at person1 city10)(at person3 city5)(at person4 city24)(at person5 city3)(at person6 city19)(at person7 city18)(at person8 city8)(at person9 city14)(at person10 city0)(at person11 city20)(at person12 city8)(at person13 city7)(at person14 city7)(at person15 city4)(at person17 city10)(at person18 city19)(at person19 city15)(at person20 city11)(at person21 city19)(at person22 city14)(at person23 city9)(at person24 city23)(at person25 city11)(at person26 city9))))
	(n0  n2  (:goal (and (at person1 city12)(at person2 city9)(at person3 city24)(at person4 city19)(at person5 city15)(at person6 city9)(at person7 city11)(at person8 city7)(at person9 city6)(at person10 city6)(at person11 city16)(at person12 city10)(at person13 city19)(at person14 city11)(at person16 city13)(at person17 city16)(at person18 city17)(at person19 city0)(at person20 city0)(at person21 city14)(at person22 city1)(at person23 city5)(at person24 city3)(at person25 city22)(at person26 city19))))
	(n1  n0  (:goal (and (at plane1 city20)(at plane4 city22)(at person1 city20)(at person2 city14)(at person3 city4)(at person4 city1)(at person5 city21)(at person6 city13)(at person7 city12)(at person8 city14)(at person10 city2)(at person11 city24)(at person12 city22)(at person13 city23)(at person14 city19)(at person15 city22)(at person16 city0)(at person17 city23)(at person18 city0)(at person19 city11)(at person20 city16)(at person21 city23)(at person22 city16)(at person23 city12)(at person24 city1)(at person25 city19)(at person26 city19))))
	(n1  n2  (:goal (and (at plane1 city14)(at plane2 city8)(at plane3 city23)(at person1 city18)(at person2 city10)(at person3 city20)(at person4 city12)(at person5 city10)(at person6 city15)(at person7 city4)(at person8 city21)(at person9 city15)(at person10 city4)(at person11 city22)(at person12 city8)(at person13 city10)(at person14 city22)(at person15 city5)(at person16 city11)(at person17 city0)(at person18 city10)(at person19 city17)(at person20 city2)(at person21 city12)(at person22 city17)(at person23 city22)(at person24 city19)(at person25 city19)(at person26 city19))))
	(n2  n0  (:goal (and (at plane1 city1)(at plane2 city10)(at plane3 city20)(at plane4 city5)(at plane5 city9)(at person1 city15)(at person2 city12)(at person4 city13)(at person5 city5)(at person6 city13)(at person7 city6)(at person8 city13)(at person9 city13)(at person10 city8)(at person11 city10)(at person12 city13)(at person13 city19)(at person14 city19)(at person15 city4)(at person16 city0)(at person17 city2)(at person18 city13)(at person19 city3)(at person20 city23)(at person21 city18)(at person22 city19)(at person23 city22)(at person24 city2)(at person25 city13)(at person26 city23))))
	(n2  n1  (:goal (and (at plane3 city12)(at plane5 city5)(at person1 city24)(at person2 city22)(at person3 city2)(at person4 city4)(at person5 city23)(at person6 city10)(at person8 city20)(at person9 city1)(at person10 city7)(at person11 city2)(at person12 city14)(at person13 city15)(at person14 city21)(at person15 city6)(at person16 city1)(at person17 city2)(at person18 city8)(at person19 city14)(at person20 city6)(at person21 city22)(at person22 city2)(at person23 city23)(at person24 city9)(at person25 city24)(at person26 city4))))
)
)
