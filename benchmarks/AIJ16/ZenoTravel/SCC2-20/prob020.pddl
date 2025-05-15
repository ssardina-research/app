(define (planprog ZTRAVEL-5-42)
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
(at plane2 city16)
(fuel-level plane2 fl0)
(at plane3 city8)
(fuel-level plane3 fl0)
(at plane4 city14)
(fuel-level plane4 fl0)
(at plane5 city23)
(fuel-level plane5 fl0)
(at person1 city0)
(at person2 city5)
(at person3 city20)
(at person4 city9)
(at person5 city6)
(at person6 city8)
(at person7 city2)
(at person8 city13)
(at person9 city13)
(at person10 city4)
(at person11 city6)
(at person12 city17)
(at person13 city19)
(at person14 city0)
(at person15 city20)
(at person16 city4)
(at person17 city10)
(at person18 city13)
(at person19 city5)
(at person20 city1)
(at person21 city12)
(at person22 city9)
(at person23 city18)
(at person24 city20)
(at person25 city24)
(at person26 city8)
(at person27 city12)
(at person28 city15)
(at person29 city9)
(at person30 city14)
(at person31 city0)
(at person32 city19)
(at person33 city0)
(at person34 city15)
(at person35 city23)
(at person36 city6)
(at person37 city22)
(at person38 city24)
(at person39 city0)
(at person40 city14)
(at person41 city21)
(at person42 city2)
(next fl0 fl1)
(next fl1 fl2)
(next fl2 fl3)

)

(:init-app n0)
(:transitions
	(n0  n1  (:goal (and (at plane1 city16)(at plane5 city12)(at person1 city19)(at person2 city2)(at person3 city6)(at person4 city3)(at person5 city15)(at person6 city9)(at person7 city12)(at person8 city17)(at person9 city20)(at person10 city1)(at person11 city8)(at person12 city10)(at person13 city13)(at person14 city13)(at person15 city24)(at person16 city17)(at person17 city5)(at person18 city6)(at person19 city4)(at person20 city19)(at person21 city5)(at person22 city21)(at person23 city4)(at person24 city13)(at person25 city4)(at person26 city3)(at person27 city6)(at person28 city14)(at person29 city18)(at person30 city20)(at person31 city8)(at person32 city4)(at person33 city8)(at person34 city3)(at person35 city17)(at person36 city16)(at person37 city10)(at person38 city12)(at person39 city12)(at person40 city9)(at person41 city2)(at person42 city1))))
	(n0  n2  (:goal (and (at plane4 city0)(at person1 city16)(at person2 city1)(at person3 city8)(at person4 city9)(at person5 city9)(at person6 city5)(at person7 city2)(at person8 city10)(at person9 city17)(at person10 city24)(at person12 city23)(at person13 city7)(at person14 city7)(at person15 city2)(at person16 city17)(at person17 city2)(at person18 city13)(at person19 city20)(at person20 city3)(at person21 city16)(at person22 city2)(at person23 city17)(at person24 city21)(at person25 city13)(at person26 city13)(at person27 city23)(at person28 city18)(at person29 city3)(at person30 city12)(at person31 city5)(at person32 city24)(at person33 city20)(at person34 city3)(at person35 city5)(at person36 city11)(at person37 city3)(at person38 city7)(at person39 city10)(at person40 city4)(at person41 city13)(at person42 city2))))
	(n1  n0  (:goal (and (at plane2 city24)(at person1 city24)(at person2 city16)(at person3 city8)(at person4 city23)(at person5 city12)(at person6 city15)(at person7 city18)(at person8 city9)(at person9 city19)(at person10 city22)(at person11 city7)(at person12 city7)(at person13 city20)(at person14 city10)(at person15 city4)(at person16 city11)(at person17 city19)(at person18 city21)(at person20 city2)(at person21 city20)(at person22 city14)(at person23 city22)(at person24 city0)(at person25 city22)(at person26 city15)(at person27 city15)(at person28 city9)(at person29 city16)(at person30 city10)(at person31 city7)(at person32 city6)(at person33 city24)(at person34 city20)(at person35 city17)(at person36 city2)(at person37 city16)(at person38 city1)(at person39 city17)(at person40 city9)(at person41 city23)(at person42 city17))))
	(n1  n2  (:goal (and (at plane1 city22)(at plane3 city8)(at person1 city3)(at person2 city8)(at person3 city13)(at person4 city23)(at person5 city20)(at person6 city22)(at person7 city10)(at person8 city21)(at person9 city17)(at person10 city20)(at person11 city1)(at person12 city5)(at person13 city5)(at person14 city10)(at person15 city9)(at person16 city8)(at person17 city1)(at person18 city17)(at person19 city5)(at person20 city11)(at person21 city19)(at person22 city6)(at person23 city19)(at person24 city4)(at person25 city11)(at person26 city16)(at person27 city17)(at person28 city24)(at person29 city22)(at person30 city21)(at person31 city8)(at person32 city11)(at person33 city13)(at person34 city4)(at person35 city6)(at person36 city16)(at person37 city7)(at person38 city13)(at person39 city6)(at person40 city4)(at person42 city1))))
	(n2  n0  (:goal (and (at plane2 city9)(at plane3 city14)(at plane4 city16)(at person1 city6)(at person2 city12)(at person3 city18)(at person5 city17)(at person6 city5)(at person7 city2)(at person8 city19)(at person9 city8)(at person10 city16)(at person11 city3)(at person12 city12)(at person13 city15)(at person14 city13)(at person15 city17)(at person16 city19)(at person17 city12)(at person18 city23)(at person19 city24)(at person20 city20)(at person21 city0)(at person22 city19)(at person23 city8)(at person24 city14)(at person25 city21)(at person26 city17)(at person27 city4)(at person28 city4)(at person29 city20)(at person30 city8)(at person31 city1)(at person32 city6)(at person33 city10)(at person34 city7)(at person35 city8)(at person36 city5)(at person37 city4)(at person38 city6)(at person40 city13)(at person41 city19)(at person42 city3))))
	(n2  n1  (:goal (and (at plane2 city11)(at plane3 city7)(at person1 city16)(at person2 city16)(at person3 city12)(at person4 city21)(at person5 city21)(at person6 city19)(at person7 city4)(at person8 city16)(at person9 city5)(at person10 city15)(at person11 city24)(at person12 city14)(at person13 city0)(at person14 city17)(at person15 city20)(at person16 city21)(at person17 city2)(at person19 city5)(at person20 city0)(at person21 city22)(at person22 city0)(at person23 city2)(at person24 city0)(at person25 city14)(at person26 city21)(at person27 city0)(at person28 city17)(at person29 city1)(at person30 city7)(at person31 city9)(at person32 city22)(at person33 city14)(at person34 city22)(at person35 city18)(at person36 city24)(at person37 city7)(at person38 city0)(at person39 city18)(at person40 city17)(at person41 city13)(at person42 city6))))
)
)
