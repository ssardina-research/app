(define (planprog ZTRAVEL-5-34)
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
person31 - person
person32 - person
person33 - person
person34 - person
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
(at plane1 city19)
(fuel-level plane1 fl0)
(at plane2 city23)
(fuel-level plane2 fl0)
(at plane3 city19)
(fuel-level plane3 fl0)
(at plane4 city5)
(fuel-level plane4 fl0)
(at plane5 city22)
(fuel-level plane5 fl0)
(at person1 city5)
(at person2 city9)
(at person3 city12)
(at person4 city17)
(at person5 city3)
(at person6 city17)
(at person7 city5)
(at person8 city24)
(at person9 city22)
(at person10 city15)
(at person11 city22)
(at person12 city10)
(at person13 city10)
(at person14 city19)
(at person15 city14)
(at person16 city5)
(at person17 city24)
(at person18 city16)
(at person19 city6)
(at person20 city0)
(at person21 city16)
(at person22 city5)
(at person23 city22)
(at person24 city15)
(at person25 city18)
(at person26 city1)
(at person27 city24)
(at person28 city18)
(at person29 city14)
(at person30 city19)
(at person31 city19)
(at person32 city20)
(at person33 city5)
(at person34 city11)
(next fl0 fl1)
(next fl1 fl2)
(next fl2 fl3)

)

(:init-app n0)
(:transitions
	(n0  n1  (:goal (and (at plane3 city7)(at person1 city7)(at person2 city17)(at person3 city22)(at person4 city14)(at person5 city20)(at person6 city1)(at person7 city2)(at person8 city19)(at person9 city8)(at person10 city24)(at person11 city15)(at person12 city6)(at person13 city14)(at person14 city0)(at person15 city24)(at person16 city13)(at person17 city5)(at person18 city1)(at person19 city4)(at person20 city4)(at person21 city10)(at person22 city23)(at person23 city3)(at person24 city21)(at person25 city17)(at person26 city1)(at person27 city20)(at person28 city16)(at person29 city12)(at person30 city8)(at person31 city6)(at person32 city13)(at person33 city22)(at person34 city3))))
	(n0  n2  (:goal (and (at plane3 city5)(at plane5 city3)(at person1 city20)(at person2 city7)(at person3 city20)(at person4 city4)(at person5 city22)(at person6 city23)(at person7 city4)(at person8 city21)(at person9 city1)(at person10 city20)(at person11 city13)(at person12 city4)(at person13 city22)(at person14 city16)(at person15 city7)(at person16 city10)(at person17 city8)(at person18 city10)(at person19 city9)(at person20 city1)(at person21 city15)(at person22 city4)(at person23 city5)(at person24 city12)(at person25 city4)(at person26 city16)(at person27 city22)(at person28 city5)(at person29 city24)(at person30 city2)(at person31 city21)(at person32 city2)(at person33 city4)(at person34 city20))))
	(n0  n3  (:goal (and (at plane2 city4)(at person1 city0)(at person2 city24)(at person3 city13)(at person4 city17)(at person5 city1)(at person6 city13)(at person7 city5)(at person8 city10)(at person9 city11)(at person10 city8)(at person11 city24)(at person12 city22)(at person13 city21)(at person14 city7)(at person15 city2)(at person16 city13)(at person17 city19)(at person18 city21)(at person19 city18)(at person20 city3)(at person21 city16)(at person22 city13)(at person23 city24)(at person24 city3)(at person25 city14)(at person26 city6)(at person28 city22)(at person29 city17)(at person30 city21)(at person31 city8)(at person32 city4)(at person33 city7)(at person34 city6))))
	(n1  n0  (:goal (and (at plane2 city8)(at person1 city4)(at person2 city5)(at person3 city3)(at person4 city19)(at person5 city1)(at person6 city7)(at person7 city22)(at person8 city19)(at person9 city12)(at person10 city4)(at person11 city6)(at person12 city19)(at person13 city8)(at person14 city17)(at person15 city23)(at person16 city8)(at person17 city15)(at person18 city15)(at person19 city15)(at person20 city1)(at person21 city21)(at person23 city14)(at person24 city24)(at person25 city4)(at person26 city1)(at person27 city13)(at person28 city10)(at person29 city20)(at person30 city7)(at person32 city5)(at person33 city1)(at person34 city8))))
	(n1  n2  (:goal (and (at plane2 city11)(at person1 city24)(at person2 city12)(at person3 city14)(at person4 city22)(at person5 city2)(at person6 city1)(at person7 city13)(at person8 city1)(at person9 city5)(at person10 city2)(at person11 city12)(at person12 city3)(at person13 city18)(at person14 city9)(at person15 city12)(at person16 city22)(at person17 city20)(at person18 city5)(at person19 city18)(at person20 city2)(at person21 city0)(at person22 city5)(at person23 city15)(at person24 city17)(at person25 city14)(at person26 city5)(at person27 city4)(at person28 city19)(at person29 city6)(at person30 city5)(at person31 city13)(at person32 city7)(at person33 city23)(at person34 city1))))
	(n1  n3  (:goal (and (at plane1 city7)(at plane3 city6)(at plane4 city4)(at person1 city22)(at person2 city14)(at person3 city22)(at person4 city1)(at person5 city15)(at person6 city20)(at person7 city16)(at person8 city19)(at person9 city2)(at person10 city21)(at person11 city19)(at person12 city4)(at person13 city1)(at person15 city4)(at person16 city22)(at person17 city9)(at person18 city1)(at person20 city6)(at person21 city1)(at person22 city10)(at person23 city20)(at person24 city3)(at person25 city6)(at person26 city7)(at person27 city1)(at person28 city16)(at person29 city4)(at person30 city15)(at person31 city16)(at person32 city4)(at person33 city19)(at person34 city8))))
	(n2  n0  (:goal (and (at plane4 city1)(at person1 city9)(at person2 city20)(at person3 city10)(at person4 city12)(at person5 city6)(at person6 city5)(at person7 city24)(at person8 city11)(at person9 city15)(at person10 city5)(at person11 city13)(at person12 city19)(at person13 city0)(at person14 city18)(at person15 city17)(at person16 city22)(at person17 city3)(at person18 city15)(at person19 city0)(at person20 city14)(at person21 city10)(at person22 city17)(at person23 city6)(at person24 city14)(at person25 city4)(at person26 city14)(at person27 city23)(at person28 city2)(at person29 city17)(at person30 city5)(at person31 city8)(at person32 city9)(at person33 city4)(at person34 city3))))
	(n2  n1  (:goal (and (at plane2 city22)(at person1 city17)(at person2 city22)(at person3 city18)(at person4 city24)(at person5 city24)(at person6 city5)(at person7 city8)(at person8 city4)(at person9 city24)(at person10 city18)(at person11 city0)(at person12 city17)(at person13 city18)(at person14 city5)(at person15 city24)(at person16 city2)(at person17 city16)(at person18 city3)(at person20 city9)(at person21 city5)(at person22 city18)(at person23 city3)(at person24 city16)(at person25 city21)(at person26 city24)(at person27 city14)(at person28 city5)(at person29 city10)(at person30 city16)(at person31 city21)(at person32 city18)(at person33 city3)(at person34 city20))))
	(n2  n3  (:goal (and (at person1 city4)(at person2 city1)(at person3 city21)(at person4 city1)(at person5 city24)(at person6 city2)(at person7 city6)(at person9 city0)(at person10 city21)(at person11 city10)(at person12 city9)(at person13 city11)(at person14 city8)(at person15 city21)(at person16 city4)(at person17 city23)(at person18 city6)(at person19 city22)(at person20 city21)(at person21 city12)(at person22 city7)(at person23 city8)(at person24 city21)(at person25 city21)(at person26 city0)(at person27 city15)(at person28 city0)(at person29 city11)(at person30 city11)(at person31 city18)(at person32 city12)(at person33 city19)(at person34 city10))))
	(n3  n0  (:goal (and (at plane4 city7)(at person1 city19)(at person2 city5)(at person3 city11)(at person4 city19)(at person5 city23)(at person6 city17)(at person7 city15)(at person8 city21)(at person9 city8)(at person10 city24)(at person11 city4)(at person12 city23)(at person13 city11)(at person14 city5)(at person15 city3)(at person16 city1)(at person17 city9)(at person18 city9)(at person19 city20)(at person20 city12)(at person21 city5)(at person22 city20)(at person23 city19)(at person24 city7)(at person25 city12)(at person26 city9)(at person27 city12)(at person28 city2)(at person29 city1)(at person30 city13)(at person31 city18)(at person32 city10)(at person33 city20)(at person34 city10))))
	(n3  n1  (:goal (and (at plane5 city11)(at person1 city24)(at person2 city2)(at person3 city6)(at person4 city16)(at person5 city1)(at person6 city5)(at person7 city14)(at person8 city1)(at person9 city0)(at person10 city14)(at person11 city4)(at person12 city23)(at person13 city3)(at person14 city6)(at person15 city23)(at person16 city14)(at person17 city24)(at person18 city20)(at person20 city21)(at person21 city5)(at person22 city18)(at person23 city22)(at person24 city23)(at person25 city5)(at person26 city19)(at person27 city6)(at person28 city3)(at person29 city20)(at person30 city20)(at person31 city21)(at person32 city0)(at person33 city8)(at person34 city1))))
	(n3  n2  (:goal (and (at plane3 city12)(at plane5 city23)(at person1 city5)(at person2 city4)(at person3 city4)(at person4 city4)(at person6 city21)(at person7 city13)(at person8 city6)(at person9 city23)(at person10 city2)(at person11 city12)(at person12 city14)(at person13 city7)(at person14 city0)(at person15 city0)(at person16 city23)(at person17 city13)(at person18 city3)(at person19 city20)(at person20 city20)(at person21 city15)(at person22 city18)(at person23 city18)(at person24 city13)(at person25 city22)(at person26 city7)(at person27 city10)(at person28 city22)(at person29 city4)(at person30 city8)(at person31 city5)(at person32 city2)(at person33 city3)(at person34 city12))))
)
)
