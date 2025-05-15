(define (planprog ZTRAVEL-5-14)
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
(at plane1 city23)
(fuel-level plane1 fl0)
(at plane2 city16)
(fuel-level plane2 fl0)
(at plane3 city16)
(fuel-level plane3 fl0)
(at plane4 city17)
(fuel-level plane4 fl0)
(at plane5 city24)
(fuel-level plane5 fl0)
(at person1 city0)
(at person2 city24)
(at person3 city10)
(at person4 city3)
(at person5 city3)
(at person6 city10)
(at person7 city9)
(at person8 city14)
(at person9 city6)
(at person10 city12)
(at person11 city2)
(at person12 city8)
(at person13 city6)
(at person14 city17)
(next fl0 fl1)
(next fl1 fl2)
(next fl2 fl3)

)

(:init-app n0)
(:transitions
	(n0  n1  (:goal (and (at plane2 city2)(at plane3 city2)(at person1 city3)(at person2 city5)(at person3 city1)(at person4 city24)(at person5 city3)(at person6 city9)(at person7 city18)(at person8 city9)(at person9 city17)(at person10 city22)(at person11 city18)(at person12 city13)(at person13 city3)(at person14 city24))))
	(n0  n2  (:goal (and (at plane3 city12)(at plane4 city15)(at person1 city2)(at person2 city15)(at person3 city10)(at person4 city0)(at person5 city24)(at person6 city21)(at person7 city15)(at person8 city15)(at person9 city9)(at person10 city19)(at person11 city19)(at person12 city6)(at person13 city14)(at person14 city13))))
	(n1  n0  (:goal (and (at plane3 city3)(at plane4 city9)(at person1 city15)(at person2 city3)(at person3 city20)(at person4 city5)(at person5 city9)(at person6 city13)(at person7 city11)(at person8 city7)(at person9 city13)(at person10 city22)(at person11 city23)(at person12 city22)(at person13 city3)(at person14 city2))))
	(n1  n2  (:goal (and (at plane1 city15)(at plane3 city10)(at plane5 city7)(at person1 city1)(at person2 city8)(at person3 city12)(at person4 city2)(at person5 city9)(at person6 city23)(at person7 city8)(at person8 city13)(at person9 city18)(at person10 city7)(at person11 city5)(at person12 city21)(at person13 city19)(at person14 city20))))
	(n2  n0  (:goal (and (at plane1 city24)(at plane2 city4)(at plane4 city21)(at person1 city24)(at person2 city21)(at person3 city24)(at person4 city21)(at person5 city3)(at person6 city23)(at person7 city22)(at person8 city7)(at person9 city17)(at person10 city24)(at person11 city2)(at person12 city17)(at person13 city16)(at person14 city19))))
	(n2  n1  (:goal (and (at person1 city13)(at person2 city8)(at person3 city16)(at person4 city6)(at person5 city6)(at person6 city16)(at person7 city1)(at person8 city23)(at person9 city14)(at person10 city21)(at person11 city12)(at person12 city17)(at person13 city16)(at person14 city23))))
)
)
