(define (planprog ZTRAVEL-5-26)
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
(at plane1 city16)
(fuel-level plane1 fl0)
(at plane2 city17)
(fuel-level plane2 fl0)
(at plane3 city13)
(fuel-level plane3 fl0)
(at plane4 city2)
(fuel-level plane4 fl0)
(at plane5 city20)
(fuel-level plane5 fl0)
(at person1 city9)
(at person2 city3)
(at person3 city3)
(at person4 city6)
(at person5 city1)
(at person6 city21)
(at person7 city8)
(at person8 city9)
(at person9 city13)
(at person10 city21)
(at person11 city24)
(at person12 city24)
(at person13 city21)
(at person14 city0)
(at person15 city24)
(at person16 city17)
(at person17 city8)
(at person18 city20)
(at person19 city19)
(at person20 city8)
(at person21 city0)
(at person22 city4)
(at person23 city0)
(at person24 city11)
(at person25 city20)
(at person26 city18)
(next fl0 fl1)
(next fl1 fl2)
(next fl2 fl3)

)

(:init-app n0)
(:transitions
	(n0  n1  (:goal (and (at plane1 city0)(at plane2 city2)(at person1 city16)(at person2 city16)(at person3 city13)(at person4 city16)(at person5 city2)(at person6 city13)(at person7 city2)(at person8 city19)(at person9 city7)(at person10 city17)(at person11 city20)(at person12 city23)(at person13 city2)(at person14 city23)(at person15 city3)(at person16 city3)(at person17 city22)(at person18 city1)(at person19 city24)(at person20 city8)(at person21 city24)(at person22 city3)(at person23 city7)(at person24 city24)(at person25 city9)(at person26 city23))))
	(n1  n0  (:goal (and (at plane4 city12)(at person1 city9)(at person2 city11)(at person3 city5)(at person5 city1)(at person6 city7)(at person7 city2)(at person8 city10)(at person9 city0)(at person10 city15)(at person11 city23)(at person12 city20)(at person13 city17)(at person14 city12)(at person15 city19)(at person16 city18)(at person17 city22)(at person18 city12)(at person19 city12)(at person20 city1)(at person21 city7)(at person23 city2)(at person24 city3)(at person25 city5)(at person26 city21))))
)
)
