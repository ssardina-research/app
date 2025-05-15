; woodworking task with 4 parts and 500% wood
; Machines:
;   3 grinder
;   3 glazer
;   3 immersion-varnisher
;   3 planer
;   3 highspeed-saw
;   3 spray-varnisher
;   3 saw
; random seed: 575080

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
    white mauve blue - acolour
    walnut teak - awood
    p0 p1 p2 p3 - part
    b0 b1 b2 b3 b4 - board
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 - aboardsize
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
    (boardsize-successor s5 s6)
    (boardsize-successor s6 s7)
    (boardsize-successor s7 s8)
    (boardsize-successor s8 s9)
    (boardsize-successor s9 s10)
    (boardsize-successor s10 s11)
    (has-colour glazer0 mauve)
    (has-colour glazer1 white)
    (has-colour glazer2 blue)
    (has-colour immersion-varnisher0 mauve)
    (has-colour immersion-varnisher0 white)
    (has-colour immersion-varnisher1 blue)
    (has-colour immersion-varnisher2 mauve)
    (empty highspeed-saw0)
    (empty highspeed-saw1)
    (empty highspeed-saw2)
    (has-colour spray-varnisher0 white)
    (has-colour spray-varnisher1 mauve)
    (has-colour spray-varnisher1 white)
    (has-colour spray-varnisher2 blue)
    (unused p0)
    (goalsize p0 medium)
    (available p1)
    (colour p1 mauve)
    (wood p1 walnut)
    (surface-condition p1 rough)
    (treatment p1 glazed)
    (goalsize p1 medium)
    (unused p2)
    (goalsize p2 large)
    (unused p3)
    (goalsize p3 large)
    (boardsize b0 s10)
    (wood b0 teak)
    (surface-condition b0 rough)
    (available b0)
    (boardsize b1 s5)
    (wood b1 teak)
    (surface-condition b1 rough)
    (available b1)
    (boardsize b2 s11)
    (wood b2 walnut)
    (surface-condition b2 rough)
    (available b2)
    (boardsize b3 s9)
    (wood b3 walnut)
    (surface-condition b3 smooth)
    (available b3)
    (boardsize b4 s5)
    (wood b4 walnut)
    (surface-condition b4 smooth)
    (available b4)

)

(:init-app n0)
(:transitions
	(n0  n1  (:goal (and (treatment p0 glazed))))
	(n1  n4  (:goal (and (wood p0 teak))))
	(n0  n2  (:goal (and (treatment p0 varnished))))
	(n2  n4  (:goal (and (wood p0 teak))))
	(n0  n3  (:goal (and (colour p0 white))))
	(n3  n4  (:goal (and (treatment p0 varnished))))
	(n4  n5  (:goal (and (colour p1 blue))))
	(n5  n8  (:goal (and (wood p1 walnut))))
	(n4  n6  (:goal (and (wood p1 walnut))))
	(n6  n8  (:goal (and (treatment p1 glazed))))
	(n4  n7  (:goal (and (wood p1 walnut))))
	(n7  n8  (:goal (and (colour p1 blue))))
	(n8  n9  (:goal (and (colour p2 blue))))
	(n9  n12  (:goal (and (wood p2 teak))))
	(n8  n10  (:goal (and (treatment p2 varnished))))
	(n10  n12  (:goal (and (colour p2 white))))
	(n8  n11  (:goal (and (colour p2 mauve))))
	(n11  n12  (:goal (and (treatment p2 varnished))))
	(n12  n13  (:goal (and (colour p3 blue))))
	(n13  n16  (:goal (and (wood p3 walnut))))
	(n12  n14  (:goal (and (treatment p3 glazed))))
	(n14  n16  (:goal (and (colour p3 blue))))
	(n12  n15  (:goal (and (wood p3 walnut))))
	(n15  n16  (:goal (and (colour p3 blue))))
)
)
