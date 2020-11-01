(defun IsEmptyStringObject (object)
	"Documentation for IsEmptyStringObject."
	(cond
		((= (length (car object)) 0)
			t)
		(t
			nil)))

(defun GetFirstChar (object)
	"Documentation for GetFirstChar."
	(subseq (car object) 0 1))

(defun GetNextStrObject (object)
	"Documentation for GetNextStrObject."
	(cons (subseq (car object) 1) (cdr object)))

(defun CompareChar (object compare)
	"Documentation for CompareChar."
	(cond
		((string= (GetFirstChar object) compare)
			t)
		(t
			nil)
		))

(defun PushOpener (object opener)
	"Documentation for PushOpener."
	(append
		(list
			(car object)
			(cons opener (cadr object)))
		(cdr (cdr object))))

(defun PopOpener (object)
	"Documentation for PopOpener."
	(append
		(list
			(car object)
			(cdr (cadr object)))
		(cdr (cdr object))))

(defun Tokenize (object)
	"Documentation for Tokenize."
	(cond
		((CompareChar object "{")
			(append (PushOpener object "{") '("{")))
		((CompareChar object "[")
			(append (PushOpener object "[") '("[")))
		((CompareChar object ",")
			(cond
				((string= (car (cadr object)) "[")
					(append object '(",")))
				; ((CompareChar (car (cadr object)) ",")
				; 	(append object '(",")))
				(t
					object)
				))
		((CompareChar object "]")
			(append (PopOpener object) '("]")))
		((CompareChar object "}")
			(append (PopOpener object) '("}")))
		(t
			object)
		))

(defun JsonObject (object)
	"Documentation for JsonObject."
	(cond
		((IsEmptyStringObject object)
			object)
		(t
			(JsonObject (GetNextStrObject (Tokenize object))))))

(defun JsonStructure (input)
	"
	return the structure of the given JSON style string including JSON objects and arrays  
	input: JSON style string  
	"
	(cdr
		(cdr
			(JsonObject (list input nil)))
		))


; (print (JSONSTRUCTURE ""))
; (print (JSONSTRUCTURE "{}"))
; (print (JSONSTRUCTURE "{'a':4}"))
; (print (JSONSTRUCTURE "{'a':{'b':4}}"))
; (print (JSONSTRUCTURE "{'z':[{'a':1,'b':2},{'a':3,'b':4}]}"))
; (print (JSONSTRUCTURE "{'z':[[{'a':1,'b':2}],[{'a':3,'b':4}]]}"))
; (print (JSONSTRUCTURE "{'z':[{'a':['x':9,'y':8],'b':2},{'c':3,'d':4}]}"))
; (print (JsonStructure "{'employees':[{'a':{'a':1},'b':{'b':2}},{'a':3,'b':4}]}"))


