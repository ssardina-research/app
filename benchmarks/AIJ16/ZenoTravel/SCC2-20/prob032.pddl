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
(at plane1 city14)
(fuel-level plane1 fl0)
(at plane2 city6)
(fuel-level plane2 fl0)
(at plane3 city7)
(fuel-level plane3 fl0)
(at plane4 city16)
(fuel-level plane4 fl0)
(at plane5 city0)
(fuel-level plane5 fl0)
(at person1 city1)
(at person2 city0)
(at person3 city6)
(at person4 city22)
(at person5 city9)
(at person6 city16)
(at person7 city5)
(at person8 city11)
(at person9 city16)
(at person10 city22)
(at person11 city23)
(at person12 city0)
(at person13 city14)
(at person14 city5)
(at person15 city15)
(at person16 city1)
(at person17 city23)
(at person18 city21)
(at person19 city3)
(at person20 city10)
(at person21 city24)
(at person22 city19)
(at person23 city13)
(at person24 city16)
(at person25 city9)
(at person26 city0)
(at person27 city24)
(at person28 city10)
(at person29 city9)
(at person30 city20)
(at person31 city11)
(at person32 city10)
(at person33 city16)
(at person34 city12)
(at person35 city21)
(at person36 city2)
(at person37 city22)
(at person38 city12)
(at person39 city9)
(at person40 city5)
(at person41 city22)
(at person42 city10)
(at person43 city19)
(at person44 city14)
(at person45 city24)
(at person46 city16)
(next fl0 fl1)
(next fl1 fl2)
(next fl2 fl3)

)

(:init-app n0)
(:transitions
	(n0  n1  (:goal (and (at person1 city14)(at person2 city12)(at person3 city19)(at person4 city20)(at person5 city13)(at person6 city15)(at person7 city21)(at person9 city9)(at person10 city11)(at person11 city5)(at person12 city5)(at person13 city12)(at person14 city2)(at person15 city2)(at person16 city8)(at person17 city13)(at person18 city15)(at person19 city5)(at person20 city21)(at person21 city24)(at person22 city4)(at person23 city2)(at person24 city6)(at person25 city15)(at person26 city10)(at person27 city22)(at person28 city24)(at person29 city1)(at person30 city17)(at person31 city21)(at person32 city2)(at person33 city24)(at person34 city4)(at person35 city15)(at person36 city19)(at person37 city7)(at person38 city24)(at person39 city15)(at person40 city12)(at person41 city2)(at person42 city15)(at person43 city7)(at person44 city15)(at person45 city16)(at person46 city13))))
	(n0  n2  (:goal (and (at plane2 city24)(at plane5 city19)(at person1 city20)(at person2 city12)(at person3 city21)(at person4 city8)(at person5 city20)(at person6 city4)(at person7 city13)(at person8 city18)(at person9 city13)(at person10 city8)(at person11 city0)(at person12 city9)(at person13 city0)(at person14 city18)(at person15 city22)(at person16 city0)(at person17 city22)(at person18 city14)(at person19 city4)(at person20 city5)(at person21 city4)(at person22 city19)(at person23 city13)(at person24 city18)(at person25 city13)(at person26 city3)(at person27 city11)(at person28 city4)(at person29 city20)(at person30 city1)(at person31 city2)(at person32 city21)(at person34 city17)(at person35 city0)(at person36 city11)(at person37 city6)(at person38 city24)(at person39 city8)(at person40 city22)(at person41 city24)(at person42 city15)(at person43 city6)(at person44 city20)(at person45 city3)(at person46 city1))))
	(n0  n3  (:goal (and (at person1 city2)(at person2 city15)(at person3 city2)(at person4 city24)(at person5 city19)(at person6 city2)(at person7 city14)(at person8 city17)(at person9 city18)(at person10 city24)(at person11 city1)(at person12 city12)(at person13 city24)(at person14 city13)(at person15 city23)(at person16 city1)(at person17 city16)(at person18 city19)(at person19 city0)(at person20 city21)(at person21 city6)(at person22 city14)(at person23 city19)(at person24 city6)(at person25 city4)(at person26 city13)(at person27 city14)(at person28 city24)(at person29 city23)(at person30 city16)(at person31 city21)(at person32 city14)(at person33 city13)(at person34 city19)(at person35 city6)(at person36 city20)(at person37 city11)(at person38 city20)(at person39 city15)(at person40 city12)(at person41 city14)(at person42 city20)(at person43 city19)(at person44 city11)(at person45 city8)(at person46 city9))))
	(n1  n0  (:goal (and (at plane2 city20)(at plane5 city23)(at person1 city6)(at person2 city21)(at person3 city6)(at person4 city15)(at person5 city18)(at person6 city12)(at person7 city3)(at person8 city10)(at person9 city9)(at person10 city8)(at person11 city10)(at person12 city5)(at person13 city24)(at person14 city8)(at person15 city18)(at person16 city18)(at person17 city24)(at person18 city4)(at person19 city5)(at person20 city17)(at person21 city4)(at person22 city9)(at person23 city8)(at person24 city15)(at person25 city10)(at person26 city16)(at person27 city11)(at person28 city10)(at person29 city15)(at person30 city10)(at person31 city3)(at person32 city1)(at person33 city1)(at person34 city9)(at person35 city16)(at person36 city15)(at person37 city20)(at person38 city8)(at person40 city24)(at person41 city21)(at person42 city15)(at person43 city12)(at person45 city22)(at person46 city12))))
	(n1  n2  (:goal (and (at plane3 city15)(at person1 city0)(at person2 city2)(at person3 city6)(at person4 city23)(at person5 city20)(at person6 city11)(at person7 city21)(at person8 city8)(at person9 city7)(at person10 city16)(at person11 city13)(at person12 city22)(at person13 city18)(at person14 city11)(at person15 city6)(at person16 city24)(at person17 city1)(at person18 city19)(at person20 city9)(at person21 city6)(at person22 city14)(at person23 city10)(at person24 city15)(at person25 city6)(at person26 city4)(at person27 city16)(at person28 city5)(at person29 city7)(at person30 city15)(at person31 city22)(at person32 city1)(at person33 city7)(at person34 city20)(at person36 city10)(at person37 city18)(at person38 city11)(at person39 city21)(at person40 city7)(at person41 city9)(at person42 city16)(at person43 city0)(at person44 city5)(at person45 city17)(at person46 city18))))
	(n1  n3  (:goal (and (at plane5 city15)(at person1 city1)(at person2 city24)(at person3 city22)(at person4 city12)(at person5 city23)(at person6 city18)(at person7 city10)(at person8 city13)(at person9 city4)(at person10 city22)(at person11 city0)(at person12 city1)(at person13 city22)(at person14 city10)(at person16 city17)(at person17 city13)(at person18 city0)(at person19 city15)(at person20 city24)(at person21 city4)(at person22 city22)(at person23 city20)(at person24 city16)(at person25 city24)(at person26 city8)(at person27 city7)(at person28 city5)(at person29 city23)(at person30 city16)(at person31 city23)(at person32 city23)(at person33 city15)(at person34 city21)(at person35 city3)(at person36 city10)(at person37 city11)(at person38 city16)(at person39 city13)(at person40 city7)(at person41 city21)(at person42 city4)(at person43 city9)(at person44 city7)(at person45 city8)(at person46 city22))))
	(n2  n0  (:goal (and (at plane1 city7)(at plane2 city18)(at plane4 city23)(at person1 city15)(at person2 city2)(at person3 city17)(at person4 city15)(at person5 city12)(at person6 city19)(at person7 city19)(at person8 city17)(at person9 city12)(at person10 city1)(at person11 city1)(at person12 city12)(at person13 city23)(at person14 city2)(at person15 city21)(at person16 city15)(at person17 city9)(at person18 city23)(at person19 city21)(at person20 city22)(at person21 city1)(at person22 city20)(at person23 city11)(at person24 city13)(at person25 city23)(at person26 city10)(at person27 city18)(at person28 city15)(at person29 city18)(at person30 city24)(at person31 city6)(at person32 city6)(at person33 city0)(at person34 city6)(at person35 city15)(at person36 city14)(at person37 city23)(at person38 city11)(at person39 city20)(at person40 city12)(at person41 city16)(at person42 city7)(at person43 city22)(at person44 city11)(at person45 city1)(at person46 city13))))
	(n2  n1  (:goal (and (at plane4 city16)(at person1 city5)(at person2 city14)(at person3 city13)(at person4 city5)(at person5 city11)(at person6 city7)(at person7 city2)(at person8 city19)(at person9 city23)(at person10 city18)(at person11 city22)(at person12 city21)(at person13 city22)(at person14 city21)(at person15 city17)(at person16 city24)(at person17 city19)(at person18 city2)(at person19 city19)(at person20 city2)(at person21 city13)(at person22 city4)(at person23 city20)(at person24 city22)(at person25 city4)(at person26 city2)(at person27 city17)(at person28 city24)(at person29 city12)(at person30 city8)(at person31 city11)(at person32 city1)(at person33 city19)(at person34 city2)(at person35 city6)(at person36 city19)(at person37 city22)(at person38 city17)(at person39 city24)(at person40 city15)(at person41 city11)(at person42 city7)(at person43 city0)(at person44 city14)(at person45 city20)(at person46 city12))))
	(n2  n3  (:goal (and (at plane1 city11)(at plane2 city0)(at plane5 city20)(at person1 city21)(at person2 city23)(at person3 city5)(at person4 city12)(at person5 city18)(at person6 city0)(at person7 city7)(at person8 city13)(at person9 city16)(at person10 city16)(at person11 city10)(at person12 city19)(at person13 city18)(at person14 city6)(at person15 city23)(at person16 city3)(at person17 city0)(at person18 city18)(at person19 city2)(at person20 city15)(at person21 city23)(at person22 city7)(at person23 city6)(at person24 city2)(at person25 city10)(at person26 city18)(at person27 city12)(at person28 city12)(at person29 city5)(at person30 city6)(at person31 city24)(at person32 city4)(at person33 city22)(at person34 city6)(at person35 city19)(at person36 city7)(at person37 city18)(at person38 city11)(at person39 city24)(at person40 city24)(at person41 city2)(at person42 city19)(at person43 city21)(at person44 city24)(at person45 city12)(at person46 city6))))
	(n3  n0  (:goal (and (at plane3 city14)(at plane4 city17)(at person1 city13)(at person2 city24)(at person3 city1)(at person4 city19)(at person5 city6)(at person6 city14)(at person7 city13)(at person9 city16)(at person10 city10)(at person11 city22)(at person12 city11)(at person13 city23)(at person14 city11)(at person15 city16)(at person16 city10)(at person17 city13)(at person18 city5)(at person19 city6)(at person20 city0)(at person21 city0)(at person22 city17)(at person23 city19)(at person24 city5)(at person25 city1)(at person26 city20)(at person27 city8)(at person28 city11)(at person29 city15)(at person30 city22)(at person31 city5)(at person32 city3)(at person33 city16)(at person34 city20)(at person35 city10)(at person36 city18)(at person37 city8)(at person38 city18)(at person39 city22)(at person40 city13)(at person41 city0)(at person42 city7)(at person43 city19)(at person44 city11)(at person45 city19)(at person46 city10))))
	(n3  n1  (:goal (and (at plane3 city14)(at person1 city14)(at person3 city24)(at person4 city8)(at person5 city19)(at person6 city3)(at person7 city14)(at person8 city7)(at person9 city19)(at person10 city7)(at person11 city18)(at person12 city8)(at person14 city9)(at person15 city9)(at person16 city13)(at person17 city4)(at person18 city8)(at person19 city4)(at person20 city21)(at person21 city24)(at person22 city11)(at person23 city23)(at person24 city4)(at person25 city3)(at person26 city16)(at person27 city10)(at person28 city16)(at person29 city12)(at person30 city3)(at person31 city18)(at person32 city20)(at person33 city24)(at person34 city2)(at person35 city15)(at person36 city5)(at person37 city3)(at person38 city23)(at person39 city21)(at person40 city19)(at person41 city22)(at person42 city24)(at person43 city8)(at person44 city10)(at person45 city12)(at person46 city0))))
	(n3  n2  (:goal (and (at plane2 city14)(at plane3 city16)(at person1 city9)(at person2 city7)(at person3 city7)(at person4 city13)(at person5 city2)(at person6 city22)(at person7 city8)(at person8 city0)(at person9 city9)(at person10 city12)(at person11 city17)(at person12 city12)(at person13 city7)(at person14 city12)(at person15 city4)(at person16 city10)(at person17 city16)(at person18 city8)(at person19 city11)(at person20 city0)(at person21 city15)(at person22 city0)(at person23 city10)(at person24 city13)(at person25 city20)(at person27 city12)(at person29 city9)(at person30 city7)(at person31 city22)(at person32 city13)(at person33 city13)(at person34 city5)(at person35 city2)(at person36 city7)(at person37 city17)(at person38 city17)(at person39 city5)(at person40 city17)(at person41 city15)(at person42 city16)(at person43 city7)(at person44 city20)(at person45 city19)(at person46 city8))))
)
)
