(define (domain Storage-Propositional)
(:requirements :typing)
(:types hoist surface place area batterylevel - object
   container depot - place
   storearea transitarea chargingarea - area
   area crate - surface
   maxbatterylevel - batterylevel)

(:predicates (clear ?s - storearea)
	(in ?x - (either storearea crate) ?p - place)
	(available ?h - hoist)
	(lifting ?h - hoist ?c - crate)
	(at ?h - hoist ?a - area)
	(on ?c - crate ?s - storearea)
	(connected ?a1 ?a2 - area)
	(compatible ?c1 ?c2 - crate)
	(battery-level ?h - hoist ?l - batterylevel)
	(next-level ?l1 ?l2 - batterylevel)
	
)


(:action lift
 :parameters (?h - hoist ?c - crate ?a1 - storearea ?a2 - area ?p - place ?l1 ?l2 - batterylevel)
 :precondition (and (connected ?a1 ?a2) (at ?h ?a2) (available ?h)
		    (on ?c ?a1) (in ?a1 ?p) (battery-level ?h ?l1) (next-level ?l2 ?l1) )
 :effect (and (not (on ?c ?a1)) (clear ?a1)
	      (not (available ?h)) (lifting ?h ?c) (not (in ?c ?p)) (not (battery-level ?h ?l1)) (battery-level ?h ?l2)))

(:action drop
 :parameters (?h - hoist ?c - crate ?a1 - storearea ?a2 - area ?p - place)
 :precondition (and (connected ?a1 ?a2) (at ?h ?a2) (lifting ?h ?c)
		    (clear ?a1) (in ?a1 ?p) )
 :effect (and (not (lifting ?h ?c)) (available ?h)
	      (not (clear ?a1)) (on ?c ?a1) (in ?c ?p)))

(:action move
  :parameters (?h - hoist ?from ?to - storearea)
  :precondition (and (at ?h ?from) (clear ?to) (connected ?from ?to) )
  :effect (and (not (at ?h ?from)) (at ?h ?to) (not (clear ?to)) (clear ?from)))

(:action go-out
  :parameters (?h - hoist ?from - storearea ?to - transitarea)
  :precondition (and (at ?h ?from) (connected ?from ?to) )
  :effect (and (not (at ?h ?from)) (at ?h ?to) (clear ?from)))

(:action go-in
  :parameters (?h - hoist ?from - transitarea ?to - storearea)
  :precondition (and (at ?h ?from) (connected ?from ?to) (clear ?to) )
  :effect (and (not (at ?h ?from)) (at ?h ?to) (not (clear ?to))))

(:action go-to-chargingarea
  :parameters (?h - hoist ?from - transitarea ?to - chargingarea ?l1 ?l2 - batterylevel)
  :precondition (and (at ?h ?from) (connected ?from ?to) (battery-level ?h ?l1) (next-level ?l2 ?l1))
  :effect (and (not (at ?h ?from)) (at ?h ?to) (not (battery-level ?h ?l1)) (battery-level ?h ?l2)))

(:action go-to-transitarea
  :parameters (?h - hoist ?from - chargingarea ?to - transitarea)
  :precondition (and (at ?h ?from) (connected ?from ?to) )
  :effect (and (not (at ?h ?from)) (at ?h ?to)))

(:action charging
  :parameters (?h - hoist ?a - chargingarea ?l1 - batterylevel ?l2 - maxbatterylevel)
  :precondition (and (at ?h ?a) (battery-level ?h ?l1) )
  :effect (and (not (battery-level ?h ?l1)) (battery-level ?h ?l2)))
)

