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
(at plane1 city13)
(fuel-level plane1 fl0)
(at plane2 city11)
(fuel-level plane2 fl0)
(at plane3 city0)
(fuel-level plane3 fl0)
(at plane4 city17)
(fuel-level plane4 fl0)
(at plane5 city19)
(fuel-level plane5 fl0)
(at person1 city17)
(at person2 city6)
(at person3 city13)
(at person4 city6)
(at person5 city15)
(at person6 city5)
(at person7 city7)
(at person8 city8)
(at person9 city23)
(at person10 city21)
(at person11 city16)
(at person12 city24)
(at person13 city3)
(at person14 city15)
(at person15 city11)
(at person16 city6)
(at person17 city2)
(at person18 city18)
(at person19 city13)
(at person20 city12)
(at person21 city14)
(at person22 city13)
(at person23 city16)
(at person24 city20)
(at person25 city0)
(at person26 city15)
(at person27 city10)
(at person28 city1)
(at person29 city5)
(at person30 city15)
(next fl0 fl1)
(next fl1 fl2)
(next fl2 fl3)

)

(:init-app n0)
(:transitions
	(n0  n1  (:goal (and (at plane2 city9)(at person1 city15)(at person2 city13)(at person3 city7)(at person4 city6)(at person5 city2)(at person6 city5)(at person7 city18)(at person8 city22)(at person9 city21)(at person10 city19)(at person11 city5)(at person12 city24)(at person13 city19)(at person14 city24)(at person15 city4)(at person16 city22)(at person17 city12)(at person18 city20)(at person19 city16)(at person20 city20)(at person21 city7)(at person22 city2)(at person23 city11)(at person24 city1)(at person25 city8)(at person26 city12)(at person27 city0)(at person28 city1)(at person29 city23)(at person30 city1))))
	(n1  n0  (:goal (and (at plane3 city22)(at person1 city14)(at person2 city24)(at person3 city11)(at person5 city10)(at person6 city12)(at person7 city14)(at person8 city10)(at person9 city19)(at person10 city13)(at person11 city20)(at person12 city11)(at person13 city24)(at person14 city3)(at person15 city5)(at person16 city3)(at person17 city16)(at person18 city22)(at person19 city15)(at person20 city22)(at person21 city17)(at person22 city19)(at person23 city11)(at person24 city14)(at person25 city17)(at person26 city16)(at person27 city14)(at person28 city17)(at person29 city22)(at person30 city12))))
)
)
