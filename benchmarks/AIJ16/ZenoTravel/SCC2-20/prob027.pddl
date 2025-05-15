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
(at plane1 city4)
(fuel-level plane1 fl0)
(at plane2 city16)
(fuel-level plane2 fl0)
(at plane3 city17)
(fuel-level plane3 fl0)
(at plane4 city7)
(fuel-level plane4 fl0)
(at plane5 city12)
(fuel-level plane5 fl0)
(at person1 city10)
(at person2 city15)
(at person3 city0)
(at person4 city7)
(at person5 city6)
(at person6 city13)
(at person7 city12)
(at person8 city4)
(at person9 city22)
(at person10 city7)
(at person11 city15)
(at person12 city22)
(at person13 city15)
(at person14 city20)
(at person15 city5)
(at person16 city1)
(at person17 city2)
(at person18 city15)
(at person19 city5)
(at person20 city1)
(at person21 city18)
(at person22 city14)
(at person23 city19)
(at person24 city22)
(at person25 city0)
(at person26 city7)
(next fl0 fl1)
(next fl1 fl2)
(next fl2 fl3)

)

(:init-app n0)
(:transitions
	(n0  n1  (:goal (and (at person1 city21)(at person2 city11)(at person3 city5)(at person4 city12)(at person5 city21)(at person6 city21)(at person7 city3)(at person8 city0)(at person9 city3)(at person10 city22)(at person11 city3)(at person12 city2)(at person13 city15)(at person14 city15)(at person15 city10)(at person16 city17)(at person17 city17)(at person18 city17)(at person19 city11)(at person20 city19)(at person21 city14)(at person22 city20)(at person23 city20)(at person24 city6)(at person25 city24)(at person26 city15))))
	(n0  n2  (:goal (and (at plane5 city0)(at person1 city9)(at person2 city17)(at person3 city20)(at person4 city14)(at person5 city24)(at person6 city22)(at person7 city8)(at person8 city22)(at person9 city7)(at person10 city7)(at person11 city20)(at person12 city21)(at person13 city23)(at person14 city18)(at person15 city16)(at person16 city8)(at person17 city20)(at person18 city7)(at person19 city10)(at person20 city1)(at person21 city12)(at person22 city14)(at person24 city7)(at person25 city3)(at person26 city16))))
	(n0  n3  (:goal (and (at plane2 city10)(at plane5 city18)(at person1 city13)(at person2 city14)(at person3 city19)(at person4 city24)(at person5 city12)(at person6 city2)(at person7 city3)(at person8 city12)(at person9 city15)(at person10 city17)(at person11 city18)(at person12 city13)(at person13 city2)(at person14 city7)(at person15 city3)(at person16 city1)(at person17 city19)(at person18 city5)(at person19 city19)(at person20 city14)(at person21 city2)(at person22 city24)(at person23 city19)(at person24 city11)(at person25 city4)(at person26 city8))))
	(n1  n0  (:goal (and (at plane5 city7)(at person1 city23)(at person2 city9)(at person3 city9)(at person4 city16)(at person5 city24)(at person6 city14)(at person7 city18)(at person8 city15)(at person9 city24)(at person10 city16)(at person11 city4)(at person12 city10)(at person13 city2)(at person15 city18)(at person16 city18)(at person17 city21)(at person18 city7)(at person19 city24)(at person20 city2)(at person21 city24)(at person22 city10)(at person23 city12)(at person24 city19)(at person25 city1)(at person26 city20))))
	(n1  n2  (:goal (and (at person2 city21)(at person3 city18)(at person4 city7)(at person5 city2)(at person6 city20)(at person7 city23)(at person8 city10)(at person9 city17)(at person10 city7)(at person11 city19)(at person12 city18)(at person13 city20)(at person14 city18)(at person15 city16)(at person16 city7)(at person17 city0)(at person18 city5)(at person20 city19)(at person21 city23)(at person22 city1)(at person23 city23)(at person24 city6)(at person26 city20))))
	(n1  n3  (:goal (and (at plane2 city19)(at plane3 city3)(at plane4 city0)(at plane5 city12)(at person1 city10)(at person2 city14)(at person3 city8)(at person4 city9)(at person5 city9)(at person6 city10)(at person7 city6)(at person8 city10)(at person9 city22)(at person10 city3)(at person11 city8)(at person12 city3)(at person13 city18)(at person14 city8)(at person15 city16)(at person16 city19)(at person17 city24)(at person18 city17)(at person19 city22)(at person20 city22)(at person21 city20)(at person22 city5)(at person23 city0)(at person24 city24)(at person25 city21)(at person26 city6))))
	(n2  n0  (:goal (and (at plane2 city10)(at person1 city17)(at person2 city21)(at person3 city23)(at person4 city8)(at person5 city4)(at person6 city1)(at person7 city8)(at person8 city7)(at person9 city6)(at person10 city6)(at person11 city3)(at person12 city0)(at person13 city20)(at person14 city17)(at person15 city13)(at person16 city2)(at person17 city11)(at person18 city4)(at person19 city2)(at person20 city22)(at person23 city6)(at person24 city13)(at person25 city2)(at person26 city7))))
	(n2  n1  (:goal (and (at plane3 city16)(at plane4 city18)(at person1 city15)(at person2 city5)(at person3 city15)(at person4 city8)(at person5 city17)(at person6 city2)(at person7 city23)(at person8 city22)(at person9 city14)(at person10 city20)(at person11 city1)(at person12 city3)(at person13 city19)(at person14 city20)(at person15 city16)(at person16 city8)(at person17 city6)(at person18 city22)(at person19 city14)(at person20 city0)(at person21 city22)(at person22 city14)(at person23 city8)(at person24 city24)(at person25 city22)(at person26 city21))))
	(n2  n3  (:goal (and (at person1 city5)(at person2 city1)(at person3 city14)(at person4 city21)(at person5 city6)(at person6 city10)(at person7 city24)(at person8 city24)(at person9 city21)(at person10 city20)(at person11 city2)(at person12 city16)(at person13 city22)(at person14 city10)(at person15 city6)(at person16 city0)(at person17 city20)(at person18 city11)(at person19 city4)(at person20 city8)(at person21 city19)(at person22 city11)(at person23 city20)(at person24 city11)(at person25 city3)(at person26 city24))))
	(n3  n0  (:goal (and (at plane1 city3)(at plane3 city9)(at plane4 city6)(at person1 city8)(at person2 city20)(at person3 city12)(at person4 city18)(at person5 city19)(at person6 city20)(at person7 city13)(at person8 city12)(at person9 city7)(at person10 city3)(at person11 city13)(at person12 city6)(at person13 city19)(at person14 city14)(at person15 city23)(at person16 city2)(at person17 city23)(at person18 city3)(at person19 city1)(at person20 city5)(at person21 city1)(at person22 city8)(at person23 city20)(at person24 city8)(at person25 city19)(at person26 city18))))
	(n3  n1  (:goal (and (at plane1 city5)(at plane3 city9)(at plane5 city7)(at person1 city19)(at person2 city13)(at person3 city17)(at person4 city15)(at person5 city8)(at person6 city20)(at person7 city0)(at person8 city16)(at person9 city19)(at person10 city0)(at person11 city4)(at person12 city6)(at person13 city7)(at person14 city15)(at person15 city18)(at person16 city15)(at person17 city21)(at person18 city10)(at person19 city18)(at person20 city14)(at person21 city9)(at person22 city4)(at person23 city13)(at person24 city8)(at person25 city12)(at person26 city8))))
	(n3  n2  (:goal (and (at plane1 city2)(at plane3 city14)(at person1 city8)(at person2 city20)(at person3 city12)(at person4 city19)(at person5 city9)(at person6 city10)(at person7 city18)(at person8 city1)(at person9 city0)(at person10 city6)(at person11 city19)(at person12 city2)(at person13 city18)(at person14 city1)(at person15 city0)(at person16 city11)(at person17 city5)(at person18 city6)(at person19 city13)(at person20 city15)(at person21 city2)(at person22 city24)(at person23 city0)(at person24 city0)(at person25 city23)(at person26 city5))))
)
)
