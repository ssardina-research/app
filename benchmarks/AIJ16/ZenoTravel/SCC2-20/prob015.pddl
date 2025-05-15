(define (planprog ZTRAVEL-5-22)
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
(at plane1 city17)
(fuel-level plane1 fl0)
(at plane2 city18)
(fuel-level plane2 fl0)
(at plane3 city2)
(fuel-level plane3 fl0)
(at plane4 city12)
(fuel-level plane4 fl0)
(at plane5 city24)
(fuel-level plane5 fl0)
(at person1 city4)
(at person2 city11)
(at person3 city9)
(at person4 city21)
(at person5 city23)
(at person6 city1)
(at person7 city23)
(at person8 city1)
(at person9 city23)
(at person10 city24)
(at person11 city2)
(at person12 city1)
(at person13 city24)
(at person14 city20)
(at person15 city14)
(at person16 city2)
(at person17 city11)
(at person18 city20)
(at person19 city21)
(at person20 city12)
(at person21 city21)
(at person22 city4)
(next fl0 fl1)
(next fl1 fl2)
(next fl2 fl3)

)

(:init-app n0)
(:transitions
	(n0  n1  (:goal (and (at plane2 city2)(at plane3 city15)(at plane4 city23)(at person1 city3)(at person2 city17)(at person3 city0)(at person4 city24)(at person5 city24)(at person6 city21)(at person7 city21)(at person8 city4)(at person9 city12)(at person10 city14)(at person11 city17)(at person12 city2)(at person13 city24)(at person14 city16)(at person15 city22)(at person16 city8)(at person17 city14)(at person18 city5)(at person19 city16)(at person20 city15)(at person21 city20)(at person22 city3))))
	(n0  n2  (:goal (and (at plane1 city7)(at plane3 city13)(at person1 city24)(at person2 city9)(at person3 city2)(at person4 city16)(at person5 city1)(at person6 city16)(at person7 city24)(at person8 city5)(at person9 city20)(at person10 city20)(at person11 city4)(at person12 city18)(at person13 city12)(at person14 city24)(at person15 city15)(at person16 city18)(at person17 city15)(at person18 city2)(at person19 city8)(at person20 city13)(at person21 city5)(at person22 city3))))
	(n1  n0  (:goal (and (at person1 city16)(at person2 city0)(at person3 city12)(at person4 city5)(at person5 city6)(at person6 city3)(at person7 city14)(at person8 city10)(at person9 city11)(at person10 city18)(at person12 city16)(at person13 city4)(at person14 city0)(at person16 city20)(at person17 city5)(at person18 city12)(at person19 city22)(at person20 city21)(at person21 city23)(at person22 city1))))
	(n1  n2  (:goal (and (at plane2 city6)(at plane3 city21)(at person1 city1)(at person2 city0)(at person3 city4)(at person4 city1)(at person5 city17)(at person6 city20)(at person7 city4)(at person8 city22)(at person9 city7)(at person10 city16)(at person11 city3)(at person12 city12)(at person13 city1)(at person14 city24)(at person15 city1)(at person16 city7)(at person17 city1)(at person18 city21)(at person20 city9)(at person21 city24)(at person22 city17))))
	(n2  n0  (:goal (and (at person1 city11)(at person2 city2)(at person3 city4)(at person4 city14)(at person5 city16)(at person6 city8)(at person7 city0)(at person8 city15)(at person9 city6)(at person10 city13)(at person11 city17)(at person12 city1)(at person14 city6)(at person15 city13)(at person16 city11)(at person17 city11)(at person18 city12)(at person19 city16)(at person21 city0)(at person22 city19))))
	(n2  n1  (:goal (and (at plane1 city2)(at plane3 city6)(at person1 city13)(at person2 city16)(at person3 city10)(at person4 city14)(at person5 city12)(at person6 city0)(at person7 city9)(at person8 city8)(at person9 city9)(at person10 city15)(at person11 city2)(at person12 city7)(at person13 city10)(at person14 city10)(at person15 city19)(at person16 city24)(at person17 city1)(at person18 city6)(at person19 city13)(at person20 city3)(at person21 city6)(at person22 city23))))
)
)
