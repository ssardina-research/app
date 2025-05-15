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
(at plane1 city7)
(fuel-level plane1 fl0)
(at plane2 city23)
(fuel-level plane2 fl0)
(at plane3 city10)
(fuel-level plane3 fl0)
(at plane4 city24)
(fuel-level plane4 fl0)
(at plane5 city5)
(fuel-level plane5 fl0)
(at person1 city5)
(at person2 city23)
(at person3 city10)
(at person4 city10)
(at person5 city22)
(at person6 city18)
(at person7 city14)
(at person8 city14)
(at person9 city13)
(at person10 city24)
(at person11 city2)
(at person12 city0)
(at person13 city20)
(at person14 city4)
(at person15 city10)
(at person16 city23)
(at person17 city23)
(at person18 city3)
(at person19 city0)
(at person20 city8)
(at person21 city13)
(at person22 city12)
(at person23 city12)
(at person24 city2)
(at person25 city20)
(at person26 city19)
(at person27 city20)
(at person28 city7)
(at person29 city1)
(at person30 city2)
(next fl0 fl1)
(next fl1 fl2)
(next fl2 fl3)

)

(:init-app n0)
(:transitions
	(n0  n1  (:goal (and (at plane3 city13)(at plane4 city10)(at plane5 city7)(at person1 city6)(at person2 city20)(at person3 city14)(at person4 city24)(at person5 city12)(at person6 city16)(at person7 city13)(at person8 city14)(at person9 city8)(at person10 city5)(at person11 city20)(at person12 city2)(at person13 city11)(at person14 city4)(at person15 city3)(at person16 city14)(at person17 city8)(at person18 city9)(at person19 city11)(at person20 city18)(at person21 city19)(at person22 city15)(at person23 city10)(at person24 city21)(at person25 city6)(at person26 city23)(at person27 city20)(at person28 city20)(at person29 city16)(at person30 city10))))
	(n0  n2  (:goal (and (at plane1 city12)(at plane3 city16)(at person1 city22)(at person2 city17)(at person3 city24)(at person4 city4)(at person5 city13)(at person6 city14)(at person7 city17)(at person8 city0)(at person9 city21)(at person10 city22)(at person11 city7)(at person12 city20)(at person13 city2)(at person14 city24)(at person15 city4)(at person16 city19)(at person17 city20)(at person18 city0)(at person19 city19)(at person20 city22)(at person21 city1)(at person22 city12)(at person23 city17)(at person24 city15)(at person25 city12)(at person26 city22)(at person27 city0)(at person28 city1)(at person29 city15)(at person30 city5))))
	(n1  n0  (:goal (and (at plane4 city7)(at plane5 city4)(at person1 city1)(at person2 city20)(at person3 city8)(at person4 city15)(at person5 city4)(at person6 city2)(at person7 city22)(at person8 city10)(at person9 city17)(at person10 city5)(at person11 city12)(at person12 city9)(at person13 city0)(at person14 city11)(at person15 city19)(at person16 city0)(at person17 city0)(at person18 city5)(at person19 city11)(at person20 city6)(at person21 city19)(at person22 city16)(at person23 city11)(at person25 city10)(at person26 city13)(at person27 city7)(at person28 city6)(at person29 city6)(at person30 city18))))
	(n1  n2  (:goal (and (at plane1 city2)(at plane2 city20)(at plane4 city18)(at plane5 city20)(at person1 city1)(at person2 city2)(at person3 city9)(at person4 city3)(at person5 city9)(at person6 city9)(at person7 city6)(at person8 city20)(at person9 city22)(at person10 city23)(at person11 city8)(at person12 city24)(at person13 city11)(at person14 city5)(at person15 city12)(at person16 city22)(at person17 city7)(at person18 city12)(at person19 city12)(at person20 city1)(at person21 city9)(at person22 city7)(at person23 city16)(at person24 city12)(at person25 city18)(at person26 city6)(at person27 city16)(at person28 city19)(at person29 city24)(at person30 city16))))
	(n2  n0  (:goal (and (at plane1 city24)(at person1 city0)(at person2 city7)(at person3 city20)(at person4 city18)(at person5 city0)(at person6 city16)(at person7 city7)(at person9 city18)(at person10 city2)(at person11 city21)(at person12 city2)(at person13 city24)(at person14 city18)(at person15 city19)(at person16 city6)(at person18 city23)(at person19 city16)(at person20 city3)(at person21 city15)(at person22 city8)(at person23 city20)(at person24 city14)(at person26 city7)(at person27 city23)(at person28 city4)(at person29 city9)(at person30 city12))))
	(n2  n1  (:goal (and (at plane1 city21)(at plane2 city1)(at plane3 city18)(at plane4 city12)(at person1 city16)(at person2 city2)(at person3 city9)(at person4 city22)(at person5 city10)(at person6 city9)(at person7 city9)(at person8 city15)(at person9 city2)(at person10 city9)(at person11 city14)(at person12 city4)(at person14 city18)(at person15 city14)(at person16 city2)(at person17 city16)(at person18 city21)(at person19 city18)(at person20 city3)(at person21 city18)(at person22 city12)(at person23 city14)(at person24 city23)(at person25 city1)(at person26 city20)(at person27 city3)(at person28 city7)(at person29 city2)(at person30 city15))))
)
)
