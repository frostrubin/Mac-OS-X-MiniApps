set mycpus to (do shell script "sysctl hw.ncpu | awk '{print $2}'")

try
	set myload to the text returned of (display dialog ¬
		"You seem to have " & mycpus & " CPU Cores." & return & ¬
		"How many processes should be spawned?" default answer mycpus ¬
		buttons {"Cancel", "Spawn"} default button 2 with title "Please Select a load level") as integer
on error
	set myload to ""
end try

if myload is not equal to "" and myload is not equal to 0 then
	repeat myload times
		do shell script "yes > /dev/null 2>&1 &"
	end repeat
	display dialog "" & myload & " Processes have been spawned." & return & return & ¬
		"You should kill them sooner or later." buttons {"Kill"} default button 1 with title "Info"
	if button returned of result = "Kill" then
		try
			do shell script "killall yes"
		end try
	end if
end if