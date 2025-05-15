(define (domain logistics-strips)
  (:requirements :strips) 
  (:predicates 	(obj ?obj)
	       	(truck ?truck)
               	(location ?loc)
		(airplane ?airplane)
                (city ?city)
                (airport ?airport)
		(at ?obj ?loc)
		(in ?obj1 ?obj2)
		(in-city ?obj ?city)
                (connected ?loc1 ?loc2)
       ; (dummy-goal)
       ; (dummy-fact)
)
;(:functions (cost))
 
  ; (:types )		; default object

(:action load-truck
  :parameters
   (?obj
    ?truck
    ?loc)
  :precondition
   (and (obj ?obj) (truck ?truck) (location ?loc) ;(dummy-fact)
   (at ?truck ?loc) (at ?obj ?loc))
  :effect
   (and (not (at ?obj ?loc)) (in ?obj ?truck)))

(:action load-airplane
  :parameters
   (?obj
    ?airplane
    ?loc)
  :precondition
   (and (obj ?obj) (airplane ?airplane) (location ?loc) ;(dummy-fact)
   (at ?obj ?loc) (at ?airplane ?loc))
  :effect
   (and (not (at ?obj ?loc)) (in ?obj ?airplane)))

(:action unload-truck
  :parameters
   (?obj
    ?truck
    ?loc)
  :precondition
   (and (obj ?obj) (truck ?truck) (location ?loc) ;(dummy-fact)
        (at ?truck ?loc) (in ?obj ?truck))
  :effect
   (and (not (in ?obj ?truck)) (at ?obj ?loc)))

(:action unload-airplane
  :parameters
   (?obj
    ?airplane
    ?loc)
  :precondition
   (and (obj ?obj) (airplane ?airplane) (location ?loc) ;(dummy-fact)
        (in ?obj ?airplane) (at ?airplane ?loc))
  :effect
   (and (not (in ?obj ?airplane)) (at ?obj ?loc)))

(:action drive-truck
  :parameters
   (?truck
    ?loc-from
    ?loc-to
    ?city)
  :precondition
   (and (truck ?truck) (location ?loc-from) (location ?loc-to) (city ?city)
   (at ?truck ?loc-from) ;(dummy-fact)
   (in-city ?loc-from ?city)
   (in-city ?loc-to ?city))
  :effect
   (and (not (at ?truck ?loc-from)) (at ?truck ?loc-to)))

(:action fly-airplane
  :parameters
   (?airplane
    ?loc-from
    ?loc-to)
  :precondition
   (and (connected ?loc-from ?loc-to) (airplane ?airplane) (airport ?loc-from) (airport ?loc-to) ;(dummy-fact)
	(at ?airplane ?loc-from))
  :effect
   (and (not (at ?airplane ?loc-from)) (at ?airplane ?loc-to)))

;(:action pref-op0
;  :precondition (and (dummy-fact))
;  :effect (and (not (dummy-fact)) (dummy-goal)))

)

