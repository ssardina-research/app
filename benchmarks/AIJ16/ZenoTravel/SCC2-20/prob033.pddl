(define (planprog ZTRAVEL-5-50)
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
person47 - person
person48 - person
person49 - person
person50 - person
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
(at plane2 city7)
(fuel-level plane2 fl0)
(at plane3 city0)
(fuel-level plane3 fl0)
(at plane4 city22)
(fuel-level plane4 fl0)
(at plane5 city24)
(fuel-level plane5 fl0)
(at person1 city10)
(at person2 city22)
(at person3 city9)
(at person4 city7)
(at person5 city17)
(at person6 city22)
(at person7 city9)
(at person8 city11)
(at person9 city14)
(at person10 city23)
(at person11 city21)
(at person12 city15)
(at person13 city23)
(at person14 city22)
(at person15 city9)
(at person16 city13)
(at person17 city14)
(at person18 city14)
(at person19 city2)
(at person20 city24)
(at person21 city4)
(at person22 city18)
(at person23 city21)
(at person24 city7)
(at person25 city21)
(at person26 city18)
(at person27 city6)
(at person28 city8)
(at person29 city12)
(at person30 city5)
(at person31 city6)
(at person32 city24)
(at person33 city8)
(at person34 city17)
(at person35 city10)
(at person36 city4)
(at person37 city21)
(at person38 city21)
(at person39 city14)
(at person40 city15)
(at person41 city22)
(at person42 city7)
(at person43 city10)
(at person44 city5)
(at person45 city14)
(at person46 city22)
(at person47 city17)
(at person48 city15)
(at person49 city3)
(at person50 city10)
(next fl0 fl1)
(next fl1 fl2)
(next fl2 fl3)

)

(:init-app n0)
(:transitions
	(n0  n1  (:goal (and (at plane3 city19)(at person1 city10)(at person2 city16)(at person3 city20)(at person4 city9)(at person5 city13)(at person7 city12)(at person8 city15)(at person9 city20)(at person10 city14)(at person11 city3)(at person12 city20)(at person13 city12)(at person14 city8)(at person15 city0)(at person16 city24)(at person17 city7)(at person18 city24)(at person19 city15)(at person20 city20)(at person21 city9)(at person22 city0)(at person23 city20)(at person24 city14)(at person25 city2)(at person26 city20)(at person27 city13)(at person28 city16)(at person29 city10)(at person30 city17)(at person31 city6)(at person33 city7)(at person34 city5)(at person35 city18)(at person36 city8)(at person37 city13)(at person38 city19)(at person39 city18)(at person40 city4)(at person41 city17)(at person42 city10)(at person43 city4)(at person44 city13)(at person45 city19)(at person46 city22)(at person47 city23)(at person48 city4)(at person49 city14)(at person50 city19))))
	(n0  n2  (:goal (and (at plane1 city21)(at person1 city8)(at person2 city5)(at person3 city22)(at person4 city4)(at person5 city3)(at person6 city8)(at person7 city0)(at person8 city13)(at person9 city11)(at person10 city23)(at person11 city23)(at person12 city17)(at person13 city0)(at person14 city15)(at person15 city3)(at person16 city12)(at person17 city0)(at person18 city11)(at person19 city21)(at person20 city3)(at person21 city13)(at person22 city22)(at person23 city22)(at person24 city2)(at person25 city3)(at person26 city6)(at person27 city13)(at person28 city9)(at person29 city5)(at person30 city12)(at person31 city6)(at person32 city19)(at person33 city8)(at person34 city19)(at person35 city6)(at person36 city22)(at person37 city1)(at person38 city20)(at person39 city16)(at person40 city1)(at person41 city22)(at person42 city5)(at person43 city15)(at person44 city5)(at person45 city14)(at person46 city21)(at person47 city14)(at person48 city17)(at person49 city18)(at person50 city13))))
	(n0  n3  (:goal (and (at person1 city23)(at person2 city1)(at person3 city21)(at person4 city11)(at person5 city12)(at person6 city7)(at person7 city20)(at person8 city9)(at person9 city20)(at person10 city19)(at person11 city0)(at person12 city13)(at person13 city0)(at person14 city16)(at person15 city6)(at person16 city12)(at person17 city0)(at person18 city16)(at person19 city4)(at person20 city2)(at person21 city16)(at person22 city2)(at person24 city4)(at person25 city6)(at person26 city17)(at person27 city14)(at person28 city14)(at person29 city3)(at person30 city7)(at person31 city23)(at person32 city24)(at person33 city11)(at person34 city7)(at person35 city22)(at person36 city19)(at person37 city6)(at person38 city2)(at person39 city18)(at person40 city0)(at person41 city17)(at person42 city20)(at person43 city23)(at person44 city1)(at person45 city21)(at person46 city14)(at person47 city19)(at person48 city11)(at person49 city5)(at person50 city8))))
	(n1  n0  (:goal (and (at person1 city22)(at person2 city1)(at person3 city23)(at person4 city10)(at person5 city16)(at person6 city4)(at person7 city12)(at person8 city2)(at person9 city4)(at person10 city22)(at person11 city9)(at person12 city18)(at person13 city15)(at person14 city24)(at person15 city14)(at person16 city20)(at person17 city3)(at person18 city11)(at person20 city22)(at person21 city9)(at person23 city20)(at person24 city18)(at person25 city13)(at person26 city20)(at person27 city17)(at person28 city12)(at person29 city15)(at person30 city20)(at person31 city1)(at person32 city7)(at person33 city14)(at person34 city20)(at person35 city11)(at person36 city3)(at person37 city2)(at person38 city18)(at person39 city6)(at person40 city19)(at person41 city4)(at person42 city21)(at person43 city14)(at person44 city22)(at person45 city20)(at person47 city2)(at person48 city8)(at person49 city4)(at person50 city10))))
	(n1  n2  (:goal (and (at plane1 city20)(at person1 city9)(at person2 city1)(at person3 city12)(at person4 city6)(at person5 city3)(at person6 city16)(at person7 city17)(at person8 city20)(at person9 city15)(at person10 city14)(at person11 city17)(at person12 city22)(at person13 city19)(at person14 city12)(at person15 city21)(at person16 city22)(at person17 city10)(at person18 city21)(at person19 city12)(at person20 city6)(at person21 city12)(at person22 city8)(at person23 city2)(at person24 city1)(at person25 city10)(at person26 city13)(at person27 city11)(at person28 city1)(at person29 city13)(at person30 city13)(at person31 city16)(at person32 city6)(at person33 city10)(at person34 city15)(at person35 city2)(at person36 city1)(at person37 city3)(at person38 city0)(at person39 city13)(at person41 city21)(at person42 city23)(at person43 city10)(at person44 city0)(at person45 city7)(at person46 city2)(at person47 city8)(at person48 city10)(at person49 city4)(at person50 city2))))
	(n1  n3  (:goal (and (at plane2 city4)(at plane5 city23)(at person1 city14)(at person2 city16)(at person3 city24)(at person4 city7)(at person5 city2)(at person6 city12)(at person7 city0)(at person8 city11)(at person9 city16)(at person10 city20)(at person11 city24)(at person12 city14)(at person13 city20)(at person14 city14)(at person15 city20)(at person16 city5)(at person17 city19)(at person18 city6)(at person19 city20)(at person20 city1)(at person21 city2)(at person22 city23)(at person23 city9)(at person24 city24)(at person25 city22)(at person26 city7)(at person27 city21)(at person28 city2)(at person29 city22)(at person30 city20)(at person31 city24)(at person32 city24)(at person33 city10)(at person34 city6)(at person35 city21)(at person36 city7)(at person37 city1)(at person38 city4)(at person39 city2)(at person40 city11)(at person41 city3)(at person42 city2)(at person43 city22)(at person44 city9)(at person45 city3)(at person46 city23)(at person47 city1)(at person48 city6)(at person49 city18)(at person50 city10))))
	(n2  n0  (:goal (and (at plane2 city13)(at plane4 city9)(at person1 city7)(at person2 city13)(at person3 city15)(at person4 city24)(at person5 city14)(at person6 city21)(at person7 city17)(at person8 city13)(at person9 city1)(at person10 city11)(at person11 city1)(at person12 city9)(at person13 city20)(at person14 city16)(at person15 city17)(at person16 city4)(at person17 city24)(at person18 city12)(at person20 city0)(at person21 city20)(at person22 city21)(at person23 city2)(at person24 city20)(at person25 city7)(at person26 city15)(at person27 city8)(at person28 city16)(at person29 city21)(at person30 city19)(at person31 city12)(at person32 city9)(at person33 city23)(at person34 city20)(at person35 city23)(at person36 city24)(at person37 city18)(at person38 city23)(at person39 city2)(at person40 city7)(at person41 city24)(at person42 city4)(at person43 city6)(at person44 city1)(at person45 city5)(at person46 city12)(at person47 city0)(at person48 city19)(at person50 city9))))
	(n2  n1  (:goal (and (at plane3 city7)(at plane5 city21)(at person1 city11)(at person2 city12)(at person3 city3)(at person4 city22)(at person5 city13)(at person6 city24)(at person7 city9)(at person8 city7)(at person9 city11)(at person10 city24)(at person11 city7)(at person12 city14)(at person13 city17)(at person14 city23)(at person15 city7)(at person16 city0)(at person17 city17)(at person18 city6)(at person19 city10)(at person20 city4)(at person21 city23)(at person22 city24)(at person23 city11)(at person24 city2)(at person25 city15)(at person26 city16)(at person27 city1)(at person28 city9)(at person30 city19)(at person31 city18)(at person32 city7)(at person33 city24)(at person34 city23)(at person35 city1)(at person36 city22)(at person38 city2)(at person39 city2)(at person40 city23)(at person41 city15)(at person42 city8)(at person43 city19)(at person44 city13)(at person45 city16)(at person46 city10)(at person47 city21)(at person48 city17)(at person49 city3)(at person50 city14))))
	(n2  n3  (:goal (and (at plane1 city22)(at plane4 city4)(at person1 city8)(at person2 city12)(at person3 city20)(at person4 city0)(at person5 city15)(at person6 city14)(at person7 city11)(at person8 city0)(at person9 city20)(at person10 city4)(at person11 city16)(at person12 city16)(at person13 city6)(at person14 city20)(at person15 city2)(at person16 city1)(at person17 city3)(at person18 city21)(at person19 city6)(at person20 city1)(at person22 city6)(at person23 city14)(at person24 city18)(at person25 city15)(at person26 city16)(at person27 city0)(at person28 city16)(at person29 city24)(at person30 city24)(at person31 city24)(at person32 city7)(at person33 city10)(at person34 city5)(at person35 city16)(at person36 city9)(at person37 city0)(at person39 city9)(at person40 city23)(at person41 city21)(at person42 city20)(at person43 city10)(at person44 city0)(at person45 city8)(at person46 city12)(at person47 city15)(at person48 city18)(at person49 city19)(at person50 city24))))
	(n3  n0  (:goal (and (at plane1 city19)(at plane3 city20)(at plane5 city23)(at person1 city21)(at person2 city10)(at person3 city22)(at person4 city6)(at person5 city8)(at person6 city5)(at person7 city10)(at person8 city1)(at person9 city16)(at person10 city13)(at person11 city12)(at person12 city17)(at person13 city19)(at person14 city17)(at person15 city14)(at person16 city16)(at person17 city1)(at person18 city10)(at person19 city24)(at person20 city16)(at person21 city7)(at person22 city2)(at person23 city0)(at person24 city21)(at person25 city15)(at person26 city12)(at person27 city11)(at person28 city5)(at person29 city19)(at person30 city22)(at person31 city21)(at person32 city11)(at person33 city3)(at person34 city19)(at person35 city15)(at person36 city0)(at person37 city4)(at person38 city13)(at person39 city3)(at person40 city15)(at person41 city13)(at person42 city10)(at person43 city23)(at person44 city21)(at person45 city23)(at person46 city18)(at person47 city21)(at person48 city11)(at person49 city22)(at person50 city5))))
	(n3  n1  (:goal (and (at plane1 city14)(at plane2 city1)(at plane5 city20)(at person1 city23)(at person2 city13)(at person3 city3)(at person4 city20)(at person5 city15)(at person6 city19)(at person7 city0)(at person8 city0)(at person9 city15)(at person10 city24)(at person11 city14)(at person12 city13)(at person13 city15)(at person14 city21)(at person15 city14)(at person16 city16)(at person17 city9)(at person18 city22)(at person19 city8)(at person20 city16)(at person21 city20)(at person22 city9)(at person23 city6)(at person24 city22)(at person25 city10)(at person26 city23)(at person27 city6)(at person28 city5)(at person29 city23)(at person30 city14)(at person31 city15)(at person32 city2)(at person33 city11)(at person34 city21)(at person35 city4)(at person36 city0)(at person37 city4)(at person38 city17)(at person39 city13)(at person40 city8)(at person41 city4)(at person42 city13)(at person43 city1)(at person44 city6)(at person46 city1)(at person47 city21)(at person48 city20)(at person49 city21)(at person50 city8))))
	(n3  n2  (:goal (and (at plane1 city10)(at person1 city5)(at person2 city9)(at person3 city7)(at person4 city8)(at person6 city24)(at person7 city2)(at person8 city7)(at person9 city11)(at person10 city24)(at person11 city13)(at person12 city1)(at person13 city7)(at person14 city0)(at person15 city17)(at person16 city20)(at person17 city17)(at person18 city11)(at person19 city23)(at person20 city15)(at person21 city18)(at person22 city5)(at person23 city7)(at person24 city15)(at person25 city16)(at person26 city18)(at person27 city22)(at person28 city21)(at person29 city16)(at person30 city11)(at person31 city21)(at person32 city2)(at person33 city12)(at person35 city2)(at person36 city23)(at person37 city22)(at person38 city2)(at person39 city19)(at person40 city11)(at person41 city1)(at person42 city2)(at person43 city18)(at person44 city5)(at person45 city13)(at person46 city11)(at person47 city19)(at person48 city5)(at person49 city4)(at person50 city17))))
)
)
