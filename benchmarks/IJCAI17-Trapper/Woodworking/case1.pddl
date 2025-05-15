; woodworking task with 3 parts and 140% wood
; Machines:
;   3 grinder
;   3 glazer
;   3 immersion-varnisher
;   3 planer
;   3 highspeed-saw
;   3 spray-varnisher
;   3 saw
; random seed: 477863

(define (planprog wood-prob)
  (:domain woodworking)
  (:objects
    grinder0 grinder1 grinder2 - grinder
    glazer0 glazer1 glazer2 - glazer
    immersion-varnisher0 immersion-varnisher1 immersion-varnisher2 - immersion-varnisher
    planer0 planer1 planer2 - planer
    highspeed-saw0 highspeed-saw1 highspeed-saw2 - highspeed-saw
    spray-varnisher0 spray-varnisher1 spray-varnisher2 - spray-varnisher
    saw0 saw1 saw2 - saw
    black green - acolour
    oak walnut - awood
    p0 p1 p2 - part
    b0 b1 - board
    s0 s1 s2 s3 s4 s5 - aboardsize
  )

(:init
    (grind-treatment-change varnished colourfragments)
    (grind-treatment-change glazed untreated)
    (grind-treatment-change untreated untreated)
    (grind-treatment-change colourfragments untreated)
    (is-smooth smooth)
    (is-smooth verysmooth)
    (boardsize-successor s0 s1)
    (boardsize-successor s1 s2)
    (boardsize-successor s2 s3)
    (boardsize-successor s3 s4)
    (boardsize-successor s4 s5)
    (has-colour glazer0 black)
    (has-colour glazer1 green)
    (has-colour glazer2 black)
    (has-colour immersion-varnisher0 black)
    (has-colour immersion-varnisher1 green)
    (has-colour immersion-varnisher2 black)
    (empty highspeed-saw0)
    (empty highspeed-saw1)
    (empty highspeed-saw2)
    (has-colour spray-varnisher0 black)
    (has-colour spray-varnisher1 black)
    (has-colour spray-varnisher2 green)
    (has-colour spray-varnisher2 black)
    (unused p0)
    (goalsize p0 small)
    (unused p1)
    (goalsize p1 large)
    (available p2)
    (colour p2 natural)
    (wood p2 walnut)
    (surface-condition p2 verysmooth)
    (treatment p2 glazed)
    (goalsize p2 small)
    (boardsize b0 s5)
    (wood b0 oak)
    (surface-condition b0 rough)
    (available b0)
    (boardsize b1 s2)
    (wood b1 walnut)
    (surface-condition b1 rough)
    (available b1)

)

(:init-app n0)
(:transitions
	(n0  n1  (:goal (and (wood p0 oak))))
	(n1  n4  (:goal (and (colour p0 black)(available p0))))
	(n0  n2  (:goal (and (colour p0 green))))
	(n2  n4  (:goal (and (treatment p0 glazed)(available p0))))
	(n0  n3  (:goal (and (colour p0 black))))
	(n3  n4  (:goal (and (wood p0 oak)(available p0))))
	(n4  n5  (:goal (and (wood p1 walnut))))
	(n5  n8  (:goal (and (colour p1 green)(available p1))))
	(n4  n6  (:goal (and (treatment p1 varnished))))
	(n6  n8  (:goal (and (colour p1 black)(available p1))))
	(n4  n7  (:goal (and (wood p1 walnut))))
	(n7  n8  (:goal (and (colour p1 green)(available p1))))
	(n8  n9  (:goal (and (treatment p2 varnished))))
	(n9  n12  (:goal (and (colour p2 green)(available p2))))
	(n8  n10  (:goal (and (treatment p2 glazed))))
	(n10  n12  (:goal (and (colour p2 green)(available p2))))
	(n8  n11  (:goal (and (wood p2 walnut))))
	(n11  n12  (:goal (and (colour p2 black)(available p2))))
)
)
