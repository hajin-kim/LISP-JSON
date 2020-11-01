# LISP-JSON
Simple LISP JSON Structure and Data Processing
Went public on Nov. 2, 2020

## Functions

### [JsonStructure.lisp](./JsonStructure.lisp)

`JsonData (input key)`  
return the structure of the given JSON style string including JSON objects and arrays  
input: JSON style string  

`(JSONSTRUCTURE "")`  
 → returns `NIL`  
`(JSONSTRUCTURE "{}")`  
 → returns `("{" "}")`  
`(JSONSTRUCTURE "{'a':4}")`  
 → returns `("{" "}")`  
`(JSONSTRUCTURE "{'a':{'b':4}}")`  
 → returns `("{" "{" "}" "}")`  
`(JSONSTRUCTURE "{'z':[{'a':1,'b':2},{'a':3,'b':4}]}")`  
 → returns `("{" "[" "{" "}" "," "{" "}" "]" "}")`  
`(JSONSTRUCTURE "{'z':[[{'a':1,'b':2}],[{'a':3,'b':4}]]}")`  
 → returns `("{" "[" "[" "{" "}" "]" "," "[" "{" "}" "]" "]" "}")`  
`(JSONSTRUCTURE "{'z':[{'a':['x':9,'y':8],'b':2},{'c':3,'d':4}]}")`  
 → returns `("{" "[" "{" "[" "," "]" "}" "," "{" "}" "]" "}")`  
`(JsonStructure "{'employees':[{'a':{'a':1},'b':{'b':2}},{'a':3,'b':4}]}")`  
 → returns `("{" "[" "{" "{" "}" "{" "}" "}" "," "{" "}" "]" "}")`  

### [JsonData.lisp](./JsonData.lisp)

`JsonData (input key)`  
search the pair value of the given key from the input JSON style string  
return NIL if not exists  
input: JSON style string  
key: 1 length single key character  

`(jsonData "{'a':4}" "a")`  
 → returns `"4"`  
`(jsonData "{'z':[{'a':1},{'b':2},{'c':3}]}" "b")`  
 → returns `"2"`  
`(jsonData "{'z':[{'a':1,'b':2},{'c':3,'d':4}]}" "a")`  
 → returns `"1"`  
`(jsonData "{'z':[{'a':['x':9,'y':8],'b':2},{'c':3,'d':4}]}" "x")`  
 → returns `"9`  

## Examples
Please refer [main.lisp](./main.lisp)  
