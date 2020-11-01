(defun IsEmptyString (str)
	"Documentation for IsEmptyStringObject."
	(cond
		((= (length str) 0)
			t)
		(t
			nil)))

(defun TrailUntilColon (str)
	"Documentation for TrailUntilColon."
	(cond
		((IsEmptyString str)
			nil)
		((string= (subseq str 0 1) ":")
			(subseq str 1))
		(t
			(TrailUntilColon (subseq str 1)))
		))

(defun GetCloserIdx (str idx)
	"Documentation for GetCloserIdx."
	(cond
		((IsEmptyString str)
			nil)
		((string= (subseq str 0 1) ",")
			idx)
		((string= (subseq str 0 1) "}")
			idx)
		((string= (subseq str 0 1) "]")
			idx)
		(t
			(GetCloserIdx (subseq str 1) (+ idx 1)))
		))

(defun JsonData (input key)
	"
	search the pair value of the given key from the input JSON style string  
	return NIL if not exists  
	input: JSON style string  
	key: 1 length single key character  
	"
	(cond
		((IsEmptyString input)
			nil)
		((string= (subseq input 0 1) key)
			(subseq (TrailUntilColon input) 0 (GetCloserIdx (TrailUntilColon input) 0)))
		(t
			(JsonData (subseq input 1) key))
	)
)


; (print (jsonData "{'a':4}" "a"))
; (print (jsonData "{'z':[{'a':1},{'b':2},{'c':3}]}" "b"))
; (print (jsonData "{'z':[{'a':1,'b':2},{'c':3,'d':4}]}" "a"))
; (print (jsonData "{'z':[{'a':['x':9,'y':8],'b':2},{'c':3,'d':4}]}" "x"))
