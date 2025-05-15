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
(at plane1 city2)
(fuel-level plane1 fl0)
(at plane2 city4)
(fuel-level plane2 fl0)
(at plane3 city9)
(fuel-level plane3 fl0)
(at plane4 city0)
(fuel-level plane4 fl0)
(at plane5 city24)
(fuel-level plane5 fl0)
(at person1 city9)
(at person2 city14)
(at person3 city19)
(at person4 city19)
(at person5 city4)
(at person6 city17)
(at person7 city9)
(at person8 city24)
(at person9 city3)
(at person10 city0)
(at person11 city9)
(at person12 city19)
(at person13 city16)
(at person14 city7)
(at person15 city6)
(at person16 city6)
(at person17 city12)
(at person18 city18)
(at person19 city8)
(at person20 city14)
(at person21 city18)
(at person22 city7)
(at person23 city10)
(at person24 city6)
(at person25 city4)
(at person26 city1)
(at person27 city5)
(at person28 city11)
(at person29 city2)
(at person30 city21)
(at person31 city9)
(at person32 city1)
(at person33 city12)
(at person34 city10)
(at person35 city16)
(at person36 city7)
(at person37 city3)
(at person38 city11)
(at person39 city8)
(at person40 city22)
(at person41 city2)
(at person42 city8)
(at person43 city10)
(at person44 city24)
(at person45 city8)
(at person46 city17)
(at person47 city9)
(at person48 city22)
(at person49 city23)
(at person50 city21)
(next fl0 fl1)
(next fl1 fl2)
(next fl2 fl3)

)

(:init-app n0)
(:transitions
	(n0  n1  (:goal (and (at plane4 city3)(at person1 city24)(at person2 city18)(at person3 city8)(at person4 city12)(at person5 city11)(at person6 city9)(at person7 city8)(at person8 city12)(at person9 city18)(at person10 city13)(at person11 city4)(at person12 city4)(at person13 city0)(at person14 city9)(at person15 city4)(at person16 city16)(at person17 city0)(at person18 city20)(at person19 city21)(at person20 city15)(at person21 city21)(at person22 city12)(at person23 city1)(at person24 city23)(at person25 city14)(at person26 city11)(at person27 city2)(at person29 city21)(at person30 city17)(at person31 city17)(at person32 city19)(at person33 city16)(at person34 city17)(at person35 city9)(at person36 city5)(at person37 city13)(at person38 city18)(at person39 city6)(at person40 city22)(at person41 city3)(at person42 city3)(at person43 city3)(at person44 city3)(at person45 city11)(at person46 city8)(at person47 city10)(at person48 city17)(at person49 city24)(at person50 city4))))
	(n0  n2  (:goal (and (at plane1 city6)(at plane3 city19)(at plane5 city21)(at person1 city22)(at person2 city3)(at person3 city12)(at person4 city2)(at person5 city6)(at person6 city4)(at person7 city19)(at person8 city20)(at person9 city3)(at person10 city13)(at person11 city8)(at person12 city14)(at person13 city24)(at person14 city23)(at person15 city10)(at person16 city19)(at person17 city17)(at person18 city10)(at person19 city2)(at person20 city21)(at person21 city12)(at person22 city22)(at person23 city13)(at person24 city4)(at person25 city23)(at person27 city13)(at person28 city5)(at person29 city10)(at person30 city10)(at person31 city2)(at person32 city8)(at person33 city6)(at person34 city8)(at person35 city19)(at person36 city18)(at person37 city11)(at person38 city16)(at person39 city4)(at person40 city3)(at person41 city1)(at person42 city7)(at person43 city10)(at person44 city9)(at person45 city3)(at person46 city2)(at person47 city0)(at person48 city16)(at person49 city10))))
	(n1  n0  (:goal (and (at plane2 city8)(at plane5 city18)(at person1 city18)(at person2 city4)(at person3 city8)(at person4 city15)(at person5 city18)(at person6 city15)(at person7 city20)(at person8 city8)(at person9 city15)(at person10 city22)(at person11 city15)(at person12 city18)(at person13 city12)(at person14 city1)(at person15 city16)(at person16 city11)(at person17 city12)(at person18 city7)(at person19 city13)(at person20 city12)(at person21 city8)(at person22 city15)(at person23 city12)(at person24 city3)(at person25 city17)(at person26 city17)(at person27 city3)(at person28 city19)(at person29 city13)(at person30 city8)(at person31 city15)(at person32 city1)(at person33 city22)(at person34 city10)(at person35 city6)(at person36 city4)(at person37 city19)(at person38 city21)(at person39 city19)(at person41 city19)(at person42 city10)(at person43 city18)(at person44 city6)(at person45 city24)(at person46 city16)(at person47 city17)(at person48 city15)(at person49 city18)(at person50 city15))))
	(n1  n2  (:goal (and (at plane1 city9)(at plane2 city23)(at person1 city6)(at person2 city6)(at person3 city0)(at person4 city20)(at person5 city2)(at person6 city11)(at person7 city17)(at person8 city10)(at person9 city8)(at person10 city3)(at person11 city12)(at person12 city22)(at person13 city12)(at person14 city24)(at person15 city16)(at person16 city15)(at person17 city5)(at person18 city14)(at person19 city1)(at person20 city22)(at person21 city1)(at person22 city16)(at person23 city16)(at person24 city11)(at person25 city18)(at person26 city22)(at person28 city13)(at person29 city19)(at person30 city20)(at person31 city24)(at person32 city12)(at person33 city17)(at person34 city13)(at person35 city21)(at person36 city20)(at person37 city20)(at person38 city15)(at person39 city14)(at person40 city1)(at person41 city5)(at person42 city12)(at person43 city21)(at person44 city18)(at person45 city4)(at person46 city18)(at person47 city3)(at person48 city13)(at person49 city13)(at person50 city4))))
	(n2  n0  (:goal (and (at person1 city15)(at person2 city5)(at person3 city19)(at person4 city5)(at person5 city23)(at person6 city15)(at person7 city19)(at person8 city1)(at person9 city15)(at person10 city15)(at person12 city0)(at person13 city16)(at person14 city22)(at person15 city8)(at person16 city8)(at person17 city12)(at person18 city10)(at person19 city5)(at person20 city0)(at person21 city7)(at person22 city21)(at person23 city22)(at person24 city12)(at person25 city2)(at person26 city12)(at person27 city18)(at person28 city12)(at person29 city15)(at person30 city20)(at person31 city11)(at person32 city1)(at person33 city23)(at person34 city21)(at person36 city8)(at person37 city13)(at person38 city8)(at person39 city20)(at person40 city14)(at person41 city7)(at person42 city0)(at person43 city17)(at person44 city1)(at person45 city22)(at person46 city15)(at person47 city12)(at person48 city0)(at person49 city16)(at person50 city15))))
	(n2  n1  (:goal (and (at plane1 city22)(at person1 city16)(at person2 city19)(at person3 city4)(at person4 city7)(at person5 city3)(at person6 city0)(at person7 city13)(at person8 city8)(at person9 city22)(at person10 city1)(at person11 city22)(at person12 city10)(at person13 city16)(at person14 city20)(at person15 city14)(at person16 city19)(at person17 city7)(at person18 city23)(at person19 city20)(at person20 city9)(at person21 city6)(at person22 city24)(at person23 city4)(at person24 city5)(at person25 city0)(at person26 city7)(at person27 city19)(at person28 city18)(at person29 city23)(at person30 city24)(at person31 city8)(at person32 city15)(at person33 city15)(at person34 city13)(at person35 city16)(at person36 city4)(at person37 city2)(at person38 city23)(at person39 city1)(at person40 city8)(at person41 city20)(at person42 city10)(at person43 city13)(at person44 city20)(at person45 city3)(at person46 city0)(at person47 city6)(at person48 city3)(at person49 city16)(at person50 city15))))
)
)
