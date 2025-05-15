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
(at plane1 city1)
(fuel-level plane1 fl0)
(at plane2 city11)
(fuel-level plane2 fl0)
(at plane3 city22)
(fuel-level plane3 fl0)
(at plane4 city11)
(fuel-level plane4 fl0)
(at plane5 city3)
(fuel-level plane5 fl0)
(at person1 city23)
(at person2 city23)
(at person3 city11)
(at person4 city22)
(at person5 city20)
(at person6 city4)
(at person7 city0)
(at person8 city18)
(at person9 city16)
(at person10 city9)
(at person11 city10)
(at person12 city15)
(at person13 city21)
(at person14 city4)
(at person15 city4)
(at person16 city8)
(at person17 city1)
(at person18 city22)
(at person19 city0)
(at person20 city23)
(at person21 city13)
(at person22 city1)
(at person23 city23)
(at person24 city14)
(at person25 city24)
(at person26 city10)
(at person27 city7)
(at person28 city7)
(at person29 city5)
(at person30 city5)
(at person31 city15)
(at person32 city9)
(at person33 city12)
(at person34 city7)
(at person35 city19)
(at person36 city17)
(at person37 city6)
(at person38 city11)
(next fl0 fl1)
(next fl1 fl2)
(next fl2 fl3)

)

(:init-app n0)
(:transitions
	(n0  n1  (:goal (and (at plane3 city24)(at person1 city16)(at person2 city22)(at person3 city10)(at person4 city9)(at person5 city4)(at person6 city0)(at person7 city8)(at person8 city20)(at person9 city18)(at person10 city23)(at person11 city15)(at person12 city15)(at person13 city18)(at person14 city12)(at person15 city10)(at person16 city23)(at person17 city11)(at person18 city16)(at person19 city10)(at person20 city7)(at person21 city5)(at person22 city6)(at person23 city5)(at person24 city23)(at person25 city1)(at person26 city24)(at person27 city1)(at person28 city16)(at person29 city16)(at person30 city17)(at person31 city4)(at person33 city7)(at person34 city5)(at person35 city24)(at person36 city17)(at person37 city10)(at person38 city11))))
	(n0  n2  (:goal (and (at plane3 city16)(at person1 city4)(at person2 city19)(at person3 city21)(at person4 city0)(at person5 city15)(at person6 city20)(at person7 city11)(at person8 city16)(at person9 city22)(at person10 city5)(at person11 city0)(at person12 city6)(at person13 city2)(at person14 city3)(at person15 city1)(at person16 city19)(at person17 city23)(at person18 city1)(at person19 city13)(at person20 city18)(at person21 city8)(at person22 city9)(at person23 city12)(at person24 city17)(at person25 city16)(at person26 city9)(at person27 city10)(at person28 city23)(at person29 city7)(at person30 city7)(at person31 city13)(at person32 city5)(at person33 city3)(at person34 city3)(at person36 city1)(at person37 city11)(at person38 city20))))
	(n1  n0  (:goal (and (at plane1 city6)(at plane3 city16)(at plane5 city18)(at person1 city19)(at person2 city15)(at person3 city22)(at person4 city5)(at person5 city6)(at person6 city9)(at person7 city19)(at person8 city14)(at person9 city9)(at person10 city16)(at person11 city11)(at person13 city8)(at person14 city24)(at person15 city9)(at person16 city2)(at person17 city13)(at person18 city18)(at person19 city24)(at person20 city13)(at person21 city1)(at person22 city10)(at person23 city7)(at person24 city16)(at person25 city16)(at person26 city6)(at person27 city8)(at person28 city23)(at person29 city9)(at person30 city8)(at person31 city21)(at person32 city19)(at person33 city17)(at person34 city13)(at person35 city12)(at person36 city20)(at person37 city23)(at person38 city15))))
	(n1  n2  (:goal (and (at plane2 city6)(at person1 city19)(at person2 city0)(at person3 city11)(at person4 city13)(at person5 city0)(at person6 city5)(at person7 city16)(at person8 city8)(at person9 city17)(at person10 city24)(at person11 city9)(at person13 city6)(at person16 city13)(at person17 city21)(at person18 city10)(at person19 city11)(at person20 city23)(at person21 city19)(at person22 city5)(at person23 city9)(at person24 city9)(at person25 city7)(at person26 city20)(at person27 city20)(at person28 city3)(at person29 city19)(at person30 city10)(at person31 city5)(at person32 city1)(at person33 city21)(at person34 city4)(at person35 city11)(at person36 city19)(at person37 city8)(at person38 city19))))
	(n2  n0  (:goal (and (at person1 city4)(at person2 city3)(at person3 city10)(at person4 city11)(at person5 city10)(at person6 city13)(at person7 city16)(at person8 city0)(at person9 city0)(at person10 city9)(at person11 city15)(at person12 city8)(at person14 city22)(at person15 city4)(at person16 city18)(at person17 city11)(at person18 city10)(at person19 city2)(at person20 city21)(at person21 city6)(at person22 city1)(at person23 city9)(at person24 city15)(at person25 city0)(at person26 city9)(at person27 city18)(at person28 city18)(at person29 city23)(at person30 city1)(at person31 city12)(at person32 city7)(at person33 city18)(at person34 city4)(at person35 city2)(at person36 city22)(at person37 city4)(at person38 city12))))
	(n2  n1  (:goal (and (at plane2 city0)(at plane4 city0)(at plane5 city11)(at person1 city22)(at person2 city7)(at person3 city22)(at person4 city23)(at person5 city21)(at person6 city16)(at person7 city11)(at person8 city17)(at person9 city14)(at person10 city10)(at person11 city23)(at person12 city16)(at person13 city22)(at person14 city12)(at person15 city12)(at person16 city5)(at person17 city14)(at person18 city9)(at person19 city20)(at person20 city0)(at person21 city5)(at person22 city7)(at person23 city14)(at person24 city16)(at person25 city16)(at person26 city22)(at person27 city22)(at person28 city0)(at person29 city14)(at person30 city22)(at person31 city4)(at person32 city8)(at person33 city16)(at person34 city1)(at person35 city10)(at person36 city16)(at person37 city10)(at person38 city3))))
)
)
