(define (domain blocksworld)
(:requirements :typing)
(:types block movabilitylevel - object
 maxmovabilitylevel - movabilitylevel)

(:predicates (clear ?x - block)
          (on-table ?x - block)
          (arm-empty)
          (holding ?x - block)
          (on ?x ?y - block)
          (movability-level ?x - block ?l - movabilitylevel)
          (next-level ?l1 ?l2 - movabilitylevel)
          
)


(:action pickup
  :parameters (?ob - block ?l1 ?l2 - movabilitylevel)
  :precondition (and (clear ?ob) (on-table ?ob) (arm-empty) (movability-level ?ob ?l1) (next-level ?l2 ?l1) )
  :effect (and (holding ?ob) (not (clear ?ob)) (not (on-table ?ob))
               (not (arm-empty)) (not (movability-level ?ob ?l1)) (movability-level ?ob ?l2)))

(:action putdown
  :parameters  (?ob - block ?l1 - movabilitylevel ?l2 - maxmovabilitylevel)
  :precondition (and (holding ?ob) (movability-level ?ob ?l1) )
  :effect (and (clear ?ob) (arm-empty) (on-table ?ob)
               (not (holding ?ob)) (not (movability-level ?ob ?l1)) (movability-level ?ob ?l2)))

(:action stack
  :parameters  (?ob ?underob - block)
  :precondition (and (clear ?underob) (holding ?ob) )
  :effect (and (arm-empty) (clear ?ob) (on ?ob ?underob)
               (not (clear ?underob)) (not (holding ?ob))))

(:action unstack
  :parameters  (?ob ?underob - block ?l1 ?l2 - movabilitylevel)
  :precondition (and (on ?ob ?underob) (clear ?ob) (arm-empty) (movability-level ?ob ?l1) (next-level ?l2 ?l1) )
  :effect (and (holding ?ob) (clear ?underob)
               (not (on ?ob ?underob)) (not (clear ?ob)) (not (arm-empty))  (not (movability-level ?ob ?l1)) (movability-level ?ob ?l2)))
)

