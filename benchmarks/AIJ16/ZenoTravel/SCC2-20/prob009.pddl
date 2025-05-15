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
(at plane1 city7)
(fuel-level plane1 fl0)
(at plane2 city19)
(fuel-level plane2 fl0)
(at plane3 city1)
(fuel-level plane3 fl0)
(at plane4 city18)
(fuel-level plane4 fl0)
(at plane5 city24)
(fuel-level plane5 fl0)
(at person1 city6)
(at person2 city12)
(at person3 city9)
(at person4 city3)
(at person5 city14)
(at person6 city8)
(at person7 city20)
(at person8 city7)
(at person9 city12)
(at person10 city13)
(at person11 city23)
(at person12 city21)
(at person13 city13)
(at person14 city2)
(at person15 city14)
(at person16 city4)
(at person17 city24)
(at person18 city18)
(at person19 city6)
(at person20 city19)
(at person21 city10)
(at person22 city20)
(at person23 city20)
(at person24 city7)
(at person25 city5)
(at person26 city1)
(at person27 city13)
(at person28 city9)
(at person29 city2)
(at person30 city17)
(at person31 city5)
(at person32 city22)
(at person33 city5)
(at person34 city15)
(at person35 city4)
(at person36 city13)
(at person37 city24)
(at person38 city9)
(at person39 city23)
(at person40 city5)
(at person41 city18)
(at person42 city12)
(next fl0 fl1)
(next fl1 fl2)
(next fl2 fl3)

)

(:init-app n0)
(:transitions
	(n0  n1  (:goal (and (at plane3 city8)(at plane4 city17)(at person1 city24)(at person2 city1)(at person3 city22)(at person4 city15)(at person5 city19)(at person6 city13)(at person7 city9)(at person8 city0)(at person9 city21)(at person10 city9)(at person11 city18)(at person12 city12)(at person13 city10)(at person14 city22)(at person15 city9)(at person16 city18)(at person17 city24)(at person18 city3)(at person19 city16)(at person20 city22)(at person21 city4)(at person23 city24)(at person24 city4)(at person25 city5)(at person26 city7)(at person27 city4)(at person28 city20)(at person29 city9)(at person30 city13)(at person31 city24)(at person32 city17)(at person33 city18)(at person34 city1)(at person35 city5)(at person36 city0)(at person37 city24)(at person38 city12)(at person39 city15)(at person40 city3)(at person41 city10)(at person42 city5))))
	(n1  n0  (:goal (and (at plane3 city9)(at person1 city21)(at person2 city22)(at person3 city17)(at person4 city17)(at person5 city10)(at person6 city14)(at person7 city23)(at person8 city0)(at person9 city19)(at person10 city0)(at person11 city0)(at person12 city23)(at person13 city23)(at person14 city4)(at person15 city23)(at person16 city20)(at person17 city14)(at person18 city6)(at person19 city18)(at person20 city23)(at person21 city6)(at person22 city22)(at person23 city23)(at person24 city2)(at person25 city13)(at person26 city11)(at person27 city14)(at person28 city9)(at person29 city5)(at person30 city16)(at person31 city0)(at person32 city4)(at person33 city2)(at person34 city9)(at person35 city20)(at person36 city18)(at person37 city20)(at person38 city22)(at person39 city2)(at person40 city2)(at person41 city24)(at person42 city19))))
)
)
