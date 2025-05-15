(define (planprog ZTRAVEL-5-18)
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
(at plane1 city21)
(fuel-level plane1 fl0)
(at plane2 city19)
(fuel-level plane2 fl0)
(at plane3 city24)
(fuel-level plane3 fl0)
(at plane4 city1)
(fuel-level plane4 fl0)
(at plane5 city12)
(fuel-level plane5 fl0)
(at person1 city20)
(at person2 city21)
(at person3 city1)
(at person4 city3)
(at person5 city6)
(at person6 city7)
(at person7 city3)
(at person8 city11)
(at person9 city24)
(at person10 city9)
(at person11 city23)
(at person12 city24)
(at person13 city4)
(at person14 city7)
(at person15 city19)
(at person16 city20)
(at person17 city6)
(at person18 city4)
(next fl0 fl1)
(next fl1 fl2)
(next fl2 fl3)

)

(:init-app n0)
(:transitions
	(n0  n1  (:goal (and (at plane4 city11)(at person1 city23)(at person2 city11)(at person3 city8)(at person4 city19)(at person5 city6)(at person6 city8)(at person7 city4)(at person8 city14)(at person9 city20)(at person10 city4)(at person11 city7)(at person12 city0)(at person13 city16)(at person14 city12)(at person15 city2)(at person16 city20)(at person17 city0)(at person18 city8))))
	(n1  n0  (:goal (and (at plane4 city24)(at person1 city17)(at person2 city12)(at person3 city12)(at person4 city11)(at person5 city10)(at person6 city9)(at person7 city2)(at person8 city23)(at person9 city9)(at person10 city24)(at person11 city12)(at person12 city1)(at person13 city6)(at person14 city19)(at person15 city22)(at person16 city4)(at person17 city3)(at person18 city17))))
)
)
