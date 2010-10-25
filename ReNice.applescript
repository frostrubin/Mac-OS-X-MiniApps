--ReNice
--Change CPU Priority of a Process
tell application "Finder" to set theApps to name of every process
set theApp to (choose from list theApps OK button name "Edit Priority")
if theApp is not false then
	set thePID to do shell script "ps -axww | /usr/bin/grep '[/]" & theApp & "'| awk '{print $1}' | head -1"
	set newPriority to text returned of (display dialog "New priority for '" & theApp & "':" & ¬
		return & "-20 Highest | +20 Lowest" default answer "0")
	try
		set theConfirmation to (do shell script "renice " & newPriority & " -p " & thePID)
	on error
		set theConfirmation to (do shell script "renice " & newPriority & " -p " & thePID with administrator privileges)
	end try
	display dialog ("Changed priority of '" & (theApp as string) & "':" & return & theConfirmation) buttons {"OK"} giving up after 5
end if
