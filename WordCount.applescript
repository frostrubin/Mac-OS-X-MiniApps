--WordCount
--This Script counts words, characters, etc. from the clipboard.
set mytext to (the clipboard)
set mycharacters to (do shell script "pbpaste | wc -m | sed s/' '//g")
set mywords to (do shell script "pbpaste | wc -w | sed s/' '//g")
set mylines to (do shell script "pbpaste | wc -l | sed s/' '//g")
set myparagraphs to count paragraphs of mytext
display dialog "The text from the clipboard contains:" & ¬
	return & return & ¬
	"Characters: " & mycharacters & return & ¬
	"Words: " & mywords & return & ¬
	"Lines: " & mylines & return & ¬
	"Paragraphs: " & myparagraphs ¬
	buttons {"Ok"} with title "Clipboard Text Counted" default button 1 ¬
	giving up after 25
