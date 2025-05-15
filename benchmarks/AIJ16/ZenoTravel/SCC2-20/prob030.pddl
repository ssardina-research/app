(define (planprog ZTRAVEL-5-38)
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
person35 - person
person36 - person
person37 - person
person38 - person
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
(at plane1 city3)
(fuel-level plane1 fl0)
(at plane2 city10)
(fuel-level plane2 fl0)
(at plane3 city21)
(fuel-level plane3 fl0)
(at plane4 city18)
(fuel-level plane4 fl0)
(at plane5 city8)
(fuel-level plane5 fl0)
(at person1 city14)
(at person2 city14)
(at person3 city4)
(at person4 city23)
(at person5 city22)
(at person6 city2)
(at person7 city19)
(at person8 city1)
(at person9 city9)
(at person10 city7)
(at person11 city5)
(at person12 city8)
(at person13 city21)
(at person14 city21)
(at person15 city13)
(at person16 city10)
(at person17 city4)
(at person18 city7)
(at person19 city10)
(at person20 city3)
(at person21 city9)
(at person22 city8)
(at person23 city14)
(at person24 city19)
(at person25 city6)
(at person26 city4)
(at person27 city24)
(at person28 city6)
(at person29 city13)
(at person30 city20)
(at person31 city19)
(at person32 city0)
(at person33 city2)
(at person34 city5)
(at person35 city9)
(at person36 city10)
(at person37 city12)
(at person38 city8)
(next fl0 fl1)
(next fl1 fl2)
(next fl2 fl3)

)

(:init-app n0)
(:transitions
	(n0  n1  (:goal (and (at plane2 city23)(at person1 city2)(at person2 city1)(at person3 city18)(at person4 city8)(at person5 city14)(at person6 city23)(at person7 city6)(at person8 city21)(at person9 city1)(at person10 city6)(at person11 city5)(at person12 city20)(at person13 city15)(at person14 city4)(at person15 city1)(at person16 city2)(at person17 city11)(at person18 city18)(at person19 city8)(at person20 city22)(at person21 city20)(at person22 city16)(at person23 city7)(at person24 city3)(at person25 city15)(at person26 city17)(at person27 city16)(at person28 city24)(at person29 city4)(at person30 city18)(at person31 city7)(at person32 city21)(at person33 city13)(at person34 city24)(at person36 city22)(at person37 city22)(at person38 city19))))
	(n0  n2  (:goal (and (at person1 city19)(at person2 city23)(at person3 city21)(at person4 city1)(at person5 city23)(at person6 city13)(at person7 city13)(at person8 city23)(at person9 city4)(at person10 city13)(at person11 city11)(at person12 city16)(at person13 city13)(at person14 city7)(at person15 city8)(at person16 city21)(at person17 city3)(at person18 city14)(at person19 city10)(at person20 city15)(at person21 city1)(at person22 city12)(at person23 city0)(at person24 city23)(at person25 city7)(at person26 city7)(at person27 city3)(at person28 city3)(at person29 city7)(at person30 city10)(at person31 city17)(at person32 city23)(at person33 city1)(at person34 city23)(at person35 city14)(at person36 city23)(at person37 city14)(at person38 city24))))
	(n0  n3  (:goal (and (at plane4 city12)(at plane5 city12)(at person1 city7)(at person2 city11)(at person3 city6)(at person4 city18)(at person5 city17)(at person6 city10)(at person7 city3)(at person8 city20)(at person9 city19)(at person10 city5)(at person11 city18)(at person12 city24)(at person13 city10)(at person14 city15)(at person15 city11)(at person16 city11)(at person17 city20)(at person18 city16)(at person19 city15)(at person20 city14)(at person21 city10)(at person22 city8)(at person23 city1)(at person24 city23)(at person25 city0)(at person26 city14)(at person27 city22)(at person28 city0)(at person29 city3)(at person30 city20)(at person31 city18)(at person32 city2)(at person33 city11)(at person34 city24)(at person35 city11)(at person36 city15)(at person37 city19)(at person38 city3))))
	(n1  n0  (:goal (and (at plane3 city19)(at person1 city1)(at person2 city23)(at person3 city22)(at person4 city11)(at person5 city22)(at person6 city8)(at person7 city20)(at person8 city13)(at person9 city4)(at person10 city2)(at person11 city19)(at person12 city14)(at person13 city20)(at person14 city3)(at person15 city17)(at person16 city12)(at person17 city23)(at person18 city17)(at person19 city23)(at person20 city21)(at person21 city7)(at person22 city9)(at person23 city16)(at person24 city22)(at person25 city19)(at person26 city6)(at person28 city0)(at person29 city6)(at person30 city20)(at person31 city17)(at person32 city0)(at person33 city17)(at person34 city16)(at person35 city7)(at person36 city13)(at person37 city18)(at person38 city18))))
	(n1  n2  (:goal (and (at plane2 city5)(at plane3 city10)(at plane5 city22)(at person1 city21)(at person2 city23)(at person3 city0)(at person4 city20)(at person5 city23)(at person6 city1)(at person7 city9)(at person8 city19)(at person9 city23)(at person10 city23)(at person11 city2)(at person12 city6)(at person13 city15)(at person14 city11)(at person15 city11)(at person16 city16)(at person17 city21)(at person18 city24)(at person19 city9)(at person20 city8)(at person21 city6)(at person22 city7)(at person23 city11)(at person24 city11)(at person25 city20)(at person26 city14)(at person27 city3)(at person28 city11)(at person29 city7)(at person30 city18)(at person31 city8)(at person32 city22)(at person33 city10)(at person34 city21)(at person35 city2)(at person36 city0)(at person37 city19)(at person38 city16))))
	(n1  n3  (:goal (and (at plane3 city19)(at plane4 city19)(at plane5 city6)(at person1 city8)(at person2 city2)(at person3 city22)(at person4 city16)(at person5 city3)(at person6 city18)(at person7 city18)(at person8 city5)(at person9 city7)(at person10 city15)(at person11 city20)(at person12 city15)(at person13 city15)(at person14 city15)(at person15 city15)(at person16 city18)(at person17 city20)(at person18 city3)(at person19 city17)(at person20 city6)(at person21 city13)(at person22 city8)(at person23 city10)(at person24 city17)(at person25 city7)(at person26 city5)(at person27 city24)(at person28 city21)(at person29 city8)(at person30 city13)(at person32 city10)(at person33 city14)(at person34 city20)(at person35 city18)(at person36 city14)(at person37 city24)(at person38 city19))))
	(n2  n0  (:goal (and (at plane3 city12)(at person1 city7)(at person2 city9)(at person3 city6)(at person4 city16)(at person5 city4)(at person6 city1)(at person7 city6)(at person8 city5)(at person9 city13)(at person10 city23)(at person11 city8)(at person12 city15)(at person13 city21)(at person14 city3)(at person15 city6)(at person16 city16)(at person17 city15)(at person18 city0)(at person19 city12)(at person20 city21)(at person22 city15)(at person23 city17)(at person24 city19)(at person25 city2)(at person26 city14)(at person27 city5)(at person28 city0)(at person29 city20)(at person30 city9)(at person31 city20)(at person32 city12)(at person33 city18)(at person34 city20)(at person35 city9)(at person36 city16)(at person37 city15)(at person38 city13))))
	(n2  n1  (:goal (and (at person1 city2)(at person2 city13)(at person3 city18)(at person4 city0)(at person5 city0)(at person6 city10)(at person7 city1)(at person8 city1)(at person9 city22)(at person10 city4)(at person11 city13)(at person12 city8)(at person13 city21)(at person14 city8)(at person15 city15)(at person16 city11)(at person17 city15)(at person18 city19)(at person19 city20)(at person20 city19)(at person21 city20)(at person22 city0)(at person23 city4)(at person24 city18)(at person25 city4)(at person26 city9)(at person27 city11)(at person28 city19)(at person29 city24)(at person30 city24)(at person31 city18)(at person32 city7)(at person33 city5)(at person34 city6)(at person35 city10)(at person36 city18)(at person37 city16)(at person38 city5))))
	(n2  n3  (:goal (and (at plane5 city10)(at person1 city9)(at person2 city17)(at person3 city21)(at person4 city0)(at person5 city12)(at person6 city5)(at person7 city20)(at person8 city21)(at person9 city3)(at person10 city24)(at person11 city22)(at person12 city23)(at person13 city19)(at person14 city9)(at person15 city17)(at person16 city19)(at person17 city2)(at person18 city20)(at person21 city11)(at person22 city13)(at person23 city12)(at person24 city20)(at person25 city21)(at person26 city6)(at person27 city18)(at person28 city1)(at person29 city13)(at person30 city7)(at person31 city12)(at person32 city14)(at person33 city5)(at person34 city6)(at person35 city20)(at person36 city7)(at person37 city0)(at person38 city17))))
	(n3  n0  (:goal (and (at plane2 city22)(at plane3 city14)(at person1 city5)(at person2 city23)(at person4 city2)(at person5 city7)(at person6 city17)(at person7 city0)(at person8 city13)(at person9 city15)(at person10 city11)(at person11 city0)(at person12 city14)(at person13 city5)(at person14 city23)(at person15 city23)(at person16 city15)(at person17 city22)(at person18 city17)(at person19 city0)(at person21 city21)(at person22 city7)(at person23 city23)(at person24 city14)(at person25 city8)(at person26 city24)(at person27 city21)(at person28 city13)(at person29 city16)(at person30 city7)(at person31 city9)(at person33 city7)(at person34 city20)(at person35 city18)(at person36 city8)(at person37 city7)(at person38 city16))))
	(n3  n1  (:goal (and (at plane4 city4)(at person1 city9)(at person2 city8)(at person3 city17)(at person4 city22)(at person5 city11)(at person6 city20)(at person7 city14)(at person8 city19)(at person9 city16)(at person10 city14)(at person11 city8)(at person12 city17)(at person13 city2)(at person14 city0)(at person15 city10)(at person16 city21)(at person17 city5)(at person18 city12)(at person19 city23)(at person20 city6)(at person21 city14)(at person22 city14)(at person24 city10)(at person25 city13)(at person26 city4)(at person27 city24)(at person28 city13)(at person29 city22)(at person30 city21)(at person31 city15)(at person32 city12)(at person33 city22)(at person34 city12)(at person35 city3)(at person36 city7)(at person38 city4))))
	(n3  n2  (:goal (and (at plane5 city2)(at person1 city5)(at person2 city10)(at person3 city10)(at person4 city13)(at person5 city1)(at person6 city15)(at person7 city2)(at person8 city9)(at person9 city4)(at person10 city4)(at person11 city15)(at person12 city15)(at person13 city20)(at person14 city10)(at person15 city14)(at person16 city3)(at person17 city18)(at person18 city11)(at person19 city11)(at person20 city23)(at person21 city5)(at person22 city20)(at person24 city17)(at person26 city15)(at person27 city6)(at person28 city24)(at person29 city9)(at person30 city16)(at person31 city17)(at person32 city20)(at person33 city9)(at person34 city20)(at person35 city17)(at person36 city1))))
)
)
