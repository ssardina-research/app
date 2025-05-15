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
(at plane1 city3)
(fuel-level plane1 fl0)
(at plane2 city11)
(fuel-level plane2 fl0)
(at plane3 city5)
(fuel-level plane3 fl0)
(at plane4 city20)
(fuel-level plane4 fl0)
(at plane5 city6)
(fuel-level plane5 fl0)
(at person1 city19)
(at person2 city14)
(at person3 city9)
(at person4 city5)
(at person5 city7)
(at person6 city24)
(at person7 city3)
(at person8 city24)
(at person9 city22)
(at person10 city21)
(at person11 city17)
(at person12 city16)
(at person13 city1)
(at person14 city3)
(at person15 city12)
(at person16 city16)
(at person17 city17)
(at person18 city1)
(next fl0 fl1)
(next fl1 fl2)
(next fl2 fl3)

)

(:init-app n0)
(:transitions
	(n0  n1  (:goal (and (at person1 city15)(at person2 city2)(at person3 city8)(at person4 city22)(at person5 city13)(at person6 city6)(at person7 city20)(at person8 city21)(at person9 city13)(at person10 city13)(at person11 city1)(at person12 city18)(at person13 city0)(at person14 city20)(at person15 city2)(at person16 city10)(at person17 city3)(at person18 city0))))
	(n0  n2  (:goal (and (at person1 city11)(at person2 city13)(at person3 city20)(at person4 city2)(at person5 city4)(at person6 city5)(at person7 city13)(at person8 city24)(at person9 city20)(at person10 city5)(at person11 city12)(at person12 city6)(at person13 city9)(at person14 city13)(at person15 city24)(at person16 city4)(at person17 city22)(at person18 city21))))
	(n1  n0  (:goal (and (at plane2 city6)(at person1 city4)(at person2 city22)(at person3 city19)(at person4 city24)(at person5 city6)(at person6 city14)(at person7 city4)(at person8 city24)(at person9 city20)(at person10 city10)(at person11 city17)(at person12 city0)(at person13 city10)(at person14 city10)(at person15 city1)(at person16 city8)(at person17 city15)(at person18 city21))))
	(n1  n2  (:goal (and (at plane3 city17)(at person1 city1)(at person2 city12)(at person3 city9)(at person4 city4)(at person5 city17)(at person6 city18)(at person7 city1)(at person8 city24)(at person9 city10)(at person10 city6)(at person11 city0)(at person13 city17)(at person14 city12)(at person15 city18)(at person17 city16)(at person18 city7))))
	(n2  n0  (:goal (and (at plane4 city9)(at plane5 city18)(at person1 city20)(at person2 city22)(at person3 city4)(at person4 city13)(at person5 city9)(at person7 city4)(at person8 city24)(at person9 city11)(at person10 city5)(at person11 city24)(at person12 city5)(at person13 city19)(at person15 city15)(at person16 city16)(at person17 city7)(at person18 city18))))
	(n2  n1  (:goal (and (at person1 city24)(at person2 city12)(at person3 city17)(at person4 city24)(at person5 city8)(at person6 city13)(at person7 city13)(at person8 city12)(at person9 city3)(at person10 city10)(at person11 city2)(at person12 city1)(at person14 city19)(at person15 city16)(at person16 city18)(at person17 city15)(at person18 city1))))
)
)
