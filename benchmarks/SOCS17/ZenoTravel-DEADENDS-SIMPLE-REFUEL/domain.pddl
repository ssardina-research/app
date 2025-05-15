(define (domain zeno-travel)
(:requirements :typing)
(:types  maxlevel - flevel
    aircraft person city flevel - object)
(:predicates (at ?x - (either person aircraft) ?c - city)
    (in ?p - person ?a - aircraft)
    (fuel-level ?a - aircraft ?l - flevel)
    (next ?l1 ?l2 - flevel)
    (fuel-station ?c - city)
    
)


(:action board
 :parameters (?p - person ?a - aircraft ?c - city)
 :precondition (and (at ?p ?c)  (at ?a ?c))
 :effect (and (not (at ?p ?c)) (in ?p ?a)))

(:action debark
 :parameters (?p - person ?a - aircraft ?c - city)
 :precondition (and (in ?p ?a)  (at ?a ?c))
 :effect (and (not (in ?p ?a)) (at ?p ?c)))

(:action fly
 :parameters (?a - aircraft ?c1 ?c2 - city ?l1 ?l2 - flevel)
 :precondition (and (at ?a ?c1)  (fuel-level ?a ?l1) (next ?l2 ?l1))
 :effect (and (not (at ?a ?c1)) (at ?a ?c2) (not (fuel-level ?a ?l1)) (fuel-level ?a ?l2)))

(:action full-refuel
 :parameters (?a - aircraft ?c - city ?l1 - flevel ?l2 - maxlevel)
 :precondition (and (at ?a ?c) (fuel-station ?c) (fuel-level ?a ?l1) )
 :effect (and (not(fuel-level ?a ?l1)) (fuel-level ?a ?l2)))
)

