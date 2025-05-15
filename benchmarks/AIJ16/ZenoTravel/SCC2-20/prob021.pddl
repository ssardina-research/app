(define (planprog ZTRAVEL-5-46)
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
person39 - person
person40 - person
person41 - person
person42 - person
person43 - person
person44 - person
person45 - person
person46 - person
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
(at plane1 city22)
(fuel-level plane1 fl0)
(at plane2 city2)
(fuel-level plane2 fl0)
(at plane3 city19)
(fuel-level plane3 fl0)
(at plane4 city3)
(fuel-level plane4 fl0)
(at plane5 city6)
(fuel-level plane5 fl0)
(at person1 city9)
(at person2 city19)
(at person3 city24)
(at person4 city3)
(at person5 city10)
(at person6 city19)
(at person7 city5)
(at person8 city19)
(at person9 city1)
(at person10 city17)
(at person11 city18)
(at person12 city19)
(at person13 city15)
(at person14 city22)
(at person15 city7)
(at person16 city6)
(at person17 city2)
(at person18 city5)
(at person19 city15)
(at person20 city22)
(at person21 city22)
(at person22 city16)
(at person23 city10)
(at person24 city10)
(at person25 city9)
(at person26 city2)
(at person27 city11)
(at person28 city5)
(at person29 city17)
(at person30 city2)
(at person31 city12)
(at person32 city6)
(at person33 city4)
(at person34 city6)
(at person35 city14)
(at person36 city14)
(at person37 city1)
(at person38 city4)
(at person39 city19)
(at person40 city21)
(at person41 city5)
(at person42 city13)
(at person43 city15)
(at person44 city3)
(at person45 city23)
(at person46 city9)
(next fl0 fl1)
(next fl1 fl2)
(next fl2 fl3)

)

(:init-app n0)
(:transitions
	(n0  n1  (:goal (and (at plane2 city14)(at plane5 city17)(at person1 city15)(at person2 city6)(at person3 city2)(at person4 city20)(at person5 city7)(at person6 city19)(at person7 city22)(at person8 city15)(at person9 city23)(at person10 city6)(at person11 city23)(at person12 city21)(at person13 city22)(at person14 city6)(at person15 city23)(at person16 city9)(at person17 city20)(at person18 city24)(at person19 city17)(at person20 city1)(at person21 city8)(at person22 city1)(at person23 city4)(at person24 city22)(at person26 city12)(at person27 city19)(at person28 city19)(at person29 city5)(at person30 city3)(at person31 city14)(at person32 city4)(at person33 city4)(at person34 city17)(at person35 city14)(at person36 city2)(at person37 city1)(at person39 city12)(at person40 city14)(at person41 city18)(at person42 city24)(at person43 city4)(at person45 city5)(at person46 city8))))
	(n0  n2  (:goal (and (at plane1 city24)(at plane5 city18)(at person1 city6)(at person2 city0)(at person3 city23)(at person4 city11)(at person5 city15)(at person6 city14)(at person7 city15)(at person8 city9)(at person9 city17)(at person10 city1)(at person12 city17)(at person13 city1)(at person14 city22)(at person15 city9)(at person16 city0)(at person17 city6)(at person18 city6)(at person19 city4)(at person20 city11)(at person21 city13)(at person22 city23)(at person23 city21)(at person24 city9)(at person25 city16)(at person26 city20)(at person27 city23)(at person28 city10)(at person29 city15)(at person30 city17)(at person31 city13)(at person32 city10)(at person33 city8)(at person34 city4)(at person35 city11)(at person36 city19)(at person37 city18)(at person38 city24)(at person39 city21)(at person40 city2)(at person41 city18)(at person42 city8)(at person43 city16)(at person44 city18)(at person46 city8))))
	(n1  n0  (:goal (and (at plane1 city2)(at plane4 city19)(at person1 city4)(at person2 city3)(at person3 city12)(at person4 city7)(at person5 city11)(at person6 city15)(at person7 city12)(at person8 city2)(at person9 city22)(at person10 city6)(at person11 city19)(at person12 city23)(at person13 city4)(at person14 city17)(at person15 city1)(at person16 city21)(at person17 city9)(at person18 city22)(at person19 city1)(at person20 city4)(at person21 city21)(at person22 city12)(at person23 city5)(at person24 city11)(at person25 city6)(at person26 city9)(at person27 city10)(at person28 city12)(at person29 city22)(at person30 city24)(at person31 city12)(at person32 city14)(at person33 city9)(at person34 city11)(at person35 city1)(at person36 city16)(at person37 city21)(at person38 city3)(at person39 city15)(at person40 city5)(at person41 city3)(at person42 city4)(at person43 city7)(at person44 city17)(at person45 city2)(at person46 city12))))
	(n1  n2  (:goal (and (at plane1 city4)(at plane2 city2)(at plane3 city17)(at person1 city22)(at person2 city0)(at person3 city12)(at person4 city6)(at person5 city23)(at person6 city7)(at person7 city19)(at person8 city11)(at person9 city8)(at person10 city23)(at person11 city12)(at person12 city24)(at person13 city13)(at person15 city21)(at person16 city0)(at person17 city5)(at person18 city5)(at person19 city17)(at person20 city1)(at person21 city23)(at person22 city4)(at person23 city8)(at person24 city4)(at person25 city3)(at person26 city4)(at person27 city1)(at person28 city2)(at person29 city6)(at person30 city10)(at person31 city24)(at person32 city18)(at person33 city18)(at person35 city8)(at person36 city2)(at person37 city3)(at person38 city4)(at person39 city19)(at person40 city5)(at person41 city13)(at person42 city3)(at person43 city1)(at person44 city20)(at person45 city20)(at person46 city0))))
	(n2  n0  (:goal (and (at plane2 city19)(at plane5 city14)(at person1 city19)(at person2 city21)(at person3 city10)(at person4 city18)(at person5 city14)(at person6 city3)(at person7 city11)(at person8 city11)(at person9 city8)(at person10 city3)(at person11 city23)(at person12 city19)(at person13 city10)(at person14 city2)(at person15 city0)(at person16 city6)(at person17 city14)(at person18 city12)(at person19 city22)(at person21 city22)(at person22 city21)(at person23 city3)(at person24 city5)(at person25 city2)(at person26 city9)(at person27 city2)(at person28 city20)(at person29 city3)(at person30 city22)(at person31 city17)(at person32 city6)(at person33 city13)(at person34 city21)(at person35 city2)(at person37 city24)(at person38 city6)(at person39 city2)(at person40 city19)(at person41 city12)(at person42 city3)(at person43 city13)(at person44 city1)(at person45 city21)(at person46 city23))))
	(n2  n1  (:goal (and (at plane1 city0)(at plane4 city5)(at person1 city5)(at person2 city19)(at person3 city21)(at person4 city1)(at person5 city6)(at person6 city15)(at person7 city10)(at person8 city12)(at person9 city22)(at person10 city23)(at person11 city16)(at person12 city2)(at person14 city5)(at person15 city0)(at person16 city20)(at person17 city6)(at person18 city16)(at person19 city2)(at person20 city23)(at person21 city24)(at person22 city18)(at person23 city20)(at person24 city21)(at person25 city24)(at person26 city1)(at person27 city20)(at person28 city8)(at person29 city18)(at person30 city14)(at person31 city13)(at person32 city20)(at person33 city6)(at person34 city17)(at person35 city5)(at person36 city2)(at person37 city22)(at person38 city1)(at person39 city3)(at person40 city24)(at person41 city13)(at person42 city12)(at person43 city23)(at person44 city12)(at person45 city9)(at person46 city14))))
)
)
