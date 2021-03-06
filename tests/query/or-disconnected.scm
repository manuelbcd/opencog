;
; Unit testing for disconnected patterns within OrLinks.
;
;;; Populate the atomspace with three small trees.
(EvaluationLink
	(PredicateNode "this way")
	(ListLink
		(ConceptNode "this one")
		(ConceptNode "thing two")
	)
)

(EvaluationLink
	(PredicateNode "that way")
	(ListLink
		(ConceptNode "thing one")
		(ConceptNode "that too")
	)
)

(EvaluationLink
	(PredicateNode "third way")
	(ListLink
		(ConceptNode "thing one")
		(ConceptNode "thing two")
	)
)

;;; A pattern with two disconnected groundings.  Two search pases must
;;; be made.  Should find two of the three trees given above.
(define (top-disco)
	(BindLink
		(VariableNode "$x")
		(ImplicationLink
			(OrLink
				(EvaluationLink
					(PredicateNode "this way")
					(ListLink
						(VariableNode "$x")
						(ConceptNode "thing two")
					)
				)
				(EvaluationLink
					(PredicateNode "that way")
					(ListLink
						(ConceptNode "thing one")
						(VariableNode "$x")
					)
				)
			)
			(VariableNode "$x")
		)
	)
)

;;; Same as above, but the tope-level OrLink is wrapped.
(define (wrapped-disco)
	(BindLink
		(VariableNode "$x")
		(ImplicationLink
			(AndLink
				(OrLink
					(EvaluationLink
						(PredicateNode "this way")
						(ListLink
							(VariableNode "$x")
							(ConceptNode "thing two")
						)
					)
					(EvaluationLink
						(PredicateNode "that way")
						(ListLink
							(ConceptNode "thing one")
							(VariableNode "$x")
						)
					)
				)
			)
			(VariableNode "$x")
		)
	)
)
