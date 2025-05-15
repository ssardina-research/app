(define (planprog ZTRAVEL-5-30)
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
person27 - person
person28 - person
person29 - person
person30 - person
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
(at plane1 city0)
(fuel-level plane1 fl0)
(at plane2 city17)
(fuel-level plane2 fl0)
(at plane3 city19)
(fuel-level plane3 fl0)
(at plane4 city21)
(fuel-level plane4 fl0)
(at plane5 city5)
(fuel-level plane5 fl0)
(at person1 city12)
(at person2 city15)
(at person3 city19)
(at person4 city15)
(at person5 city14)
(at person6 city23)
(at person7 city24)
(at person8 city22)
(at person9 city14)
(at person10 city7)
(at person11 city12)
(at person12 city10)
(at person13 city6)
(at person14 city24)
(at person15 city17)
(at person16 city11)
(at person17 city10)
(at person18 city15)
(at person19 city16)
(at person20 city19)
(at person21 city18)
(at person22 city21)
(at person23 city8)
(at person24 city9)
(at person25 city21)
(at person26 city13)
(at person27 city21)
(at person28 city23)
(at person29 city12)
(at person30 city23)
(next fl0 fl1)
(next fl1 fl2)
(next fl2 fl3)

)

(:init-app n0)
(:transitions
	(n0  n1  (:goal (and (at plane3 city24)(at plane4 city16)(at person1 city1)(at person2 city5)(at person3 city5)(at person4 city21)(at person5 city14)(at person7 city17)(at person8 city6)(at person9 city0)(at person10 city6)(at person11 city5)(at person12 city19)(at person13 city0)(at person14 city13)(at person15 city20)(at person16 city6)(at person17 city12)(at person18 city4)(at person19 city19)(at person20 city13)(at person21 city8)(at person22 city7)(at person23 city20)(at person24 city16)(at person25 city5)(at person26 city23)(at person27 city17)(at person28 city14)(at person29 city20)(at person30 city18))))
	(n0  n2  (:goal (and (at plane4 city24)(at plane5 city4)(at person1 city3)(at person2 city2)(at person3 city20)(at person4 city20)(at person5 city23)(at person6 city0)(at person7 city20)(at person8 city11)(at person9 city18)(at person10 city2)(at person11 city11)(at person12 city1)(at person13 city6)(at person14 city16)(at person15 city19)(at person16 city5)(at person17 city13)(at person18 city24)(at person19 city18)(at person20 city15)(at person21 city6)(at person22 city6)(at person23 city2)(at person24 city3)(at person25 city16)(at person26 city12)(at person27 city3)(at person28 city21)(at person29 city0)(at person30 city0))))
	(n0  n3  (:goal (and (at plane4 city22)(at plane5 city17)(at person1 city10)(at person2 city9)(at person3 city4)(at person5 city15)(at person6 city9)(at person7 city2)(at person8 city2)(at person9 city19)(at person10 city23)(at person11 city18)(at person12 city8)(at person13 city18)(at person14 city19)(at person15 city9)(at person16 city8)(at person17 city4)(at person18 city18)(at person19 city6)(at person20 city9)(at person21 city6)(at person22 city14)(at person23 city24)(at person24 city13)(at person25 city3)(at person26 city3)(at person27 city9)(at person28 city23)(at person29 city17)(at person30 city3))))
	(n1  n0  (:goal (and (at plane4 city23)(at plane5 city22)(at person1 city5)(at person2 city16)(at person3 city15)(at person4 city13)(at person5 city9)(at person6 city9)(at person7 city9)(at person8 city18)(at person9 city1)(at person10 city18)(at person11 city7)(at person12 city23)(at person13 city5)(at person14 city16)(at person15 city23)(at person16 city22)(at person17 city8)(at person18 city17)(at person19 city20)(at person20 city9)(at person21 city20)(at person22 city18)(at person23 city7)(at person24 city13)(at person25 city21)(at person26 city23)(at person27 city23)(at person28 city19)(at person29 city10)(at person30 city24))))
	(n1  n2  (:goal (and (at person1 city8)(at person2 city23)(at person3 city20)(at person4 city10)(at person5 city22)(at person6 city24)(at person7 city1)(at person8 city3)(at person9 city7)(at person10 city21)(at person11 city1)(at person12 city4)(at person13 city2)(at person14 city0)(at person15 city16)(at person16 city15)(at person17 city1)(at person18 city2)(at person19 city12)(at person20 city6)(at person21 city16)(at person22 city6)(at person23 city8)(at person24 city8)(at person25 city12)(at person26 city10)(at person27 city8)(at person28 city18)(at person29 city0)(at person30 city19))))
	(n1  n3  (:goal (and (at person1 city19)(at person2 city4)(at person3 city20)(at person4 city7)(at person5 city19)(at person6 city20)(at person7 city11)(at person9 city3)(at person10 city16)(at person12 city9)(at person14 city3)(at person15 city8)(at person16 city20)(at person17 city13)(at person18 city1)(at person19 city17)(at person20 city6)(at person21 city24)(at person22 city17)(at person23 city23)(at person24 city23)(at person25 city17)(at person26 city4)(at person27 city24)(at person28 city22)(at person29 city20)(at person30 city17))))
	(n2  n0  (:goal (and (at plane1 city1)(at plane2 city0)(at plane3 city1)(at plane4 city24)(at plane5 city19)(at person1 city10)(at person2 city12)(at person4 city16)(at person5 city0)(at person6 city20)(at person7 city16)(at person8 city1)(at person9 city17)(at person10 city1)(at person11 city9)(at person12 city16)(at person13 city13)(at person14 city21)(at person15 city17)(at person16 city17)(at person17 city12)(at person18 city1)(at person19 city17)(at person20 city1)(at person21 city5)(at person22 city18)(at person23 city10)(at person24 city2)(at person26 city7)(at person27 city8)(at person28 city1)(at person29 city7)(at person30 city1))))
	(n2  n1  (:goal (and (at person1 city5)(at person2 city0)(at person3 city11)(at person4 city1)(at person5 city11)(at person6 city0)(at person7 city11)(at person8 city12)(at person9 city2)(at person10 city5)(at person13 city19)(at person14 city15)(at person17 city13)(at person18 city14)(at person19 city18)(at person20 city15)(at person21 city22)(at person22 city21)(at person23 city8)(at person24 city22)(at person25 city5)(at person26 city0)(at person27 city13)(at person28 city22)(at person29 city1)(at person30 city19))))
	(n2  n3  (:goal (and (at plane3 city16)(at plane4 city11)(at person1 city0)(at person2 city1)(at person3 city15)(at person4 city2)(at person5 city20)(at person6 city1)(at person7 city21)(at person8 city20)(at person9 city7)(at person10 city9)(at person11 city17)(at person12 city6)(at person13 city22)(at person14 city5)(at person15 city18)(at person16 city12)(at person17 city23)(at person18 city11)(at person19 city13)(at person20 city16)(at person21 city11)(at person22 city12)(at person23 city5)(at person24 city10)(at person25 city5)(at person26 city13)(at person27 city12)(at person28 city1)(at person29 city4)(at person30 city18))))
	(n3  n0  (:goal (and (at person2 city3)(at person3 city21)(at person4 city9)(at person5 city24)(at person6 city0)(at person7 city7)(at person8 city22)(at person9 city17)(at person10 city18)(at person11 city20)(at person12 city14)(at person13 city1)(at person14 city5)(at person15 city9)(at person16 city1)(at person17 city22)(at person18 city23)(at person19 city14)(at person20 city17)(at person21 city8)(at person22 city0)(at person24 city4)(at person25 city19)(at person26 city6)(at person27 city20)(at person28 city18)(at person29 city4)(at person30 city5))))
	(n3  n1  (:goal (and (at plane4 city13)(at person1 city17)(at person2 city23)(at person4 city16)(at person5 city11)(at person6 city17)(at person7 city15)(at person8 city5)(at person9 city19)(at person10 city24)(at person11 city6)(at person12 city16)(at person13 city17)(at person14 city2)(at person15 city20)(at person16 city11)(at person18 city24)(at person20 city17)(at person21 city10)(at person22 city21)(at person23 city1)(at person24 city6)(at person25 city5)(at person26 city15)(at person27 city19)(at person28 city5)(at person29 city1)(at person30 city24))))
	(n3  n2  (:goal (and (at person1 city12)(at person2 city21)(at person3 city4)(at person4 city4)(at person5 city23)(at person6 city20)(at person7 city4)(at person8 city1)(at person9 city17)(at person10 city19)(at person11 city19)(at person12 city15)(at person13 city20)(at person14 city1)(at person15 city16)(at person16 city19)(at person17 city24)(at person18 city14)(at person19 city19)(at person20 city21)(at person21 city14)(at person22 city11)(at person23 city9)(at person24 city18)(at person25 city10)(at person26 city6)(at person27 city12)(at person28 city14)(at person29 city22)(at person30 city0))))
)
)
