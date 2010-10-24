--WordCount
--This Script counts words, characters, etc. from the clipboard.
set mytext to (do shell script "pbpaste | wc -l | sed s/' '//g")
set zeichen to (do shell script "pbpaste | wc -m | sed s/' '//g")
set worte to (do shell script "pbpaste | wc -w | sed s/' '//g")
set zeilen to (do shell script "pbpaste | wc -l | sed s/' '//g")
set mytext2 to (the clipboard)
set absatze to count paragraphs of mytext2
display dialog "The text from the clipboard contains:" & ¬
	return & return & "Characters: " & zeichen & return & ¬
	"Words: " & worte & return & "Rows: " & zeilen & ¬
	return & "Breaks: " & absatze ¬
	buttons {"Ok"} with title ¬
	"Clipboard Text Counted" default button 1 ¬
	giving up after 25
