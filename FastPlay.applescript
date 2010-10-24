--FastPlay
--This Script opens a selected iTunes Track in Quicktime and
--sets the play-speed to 1.3 of the normal speed.
--Comes in handy, if a podcast is very long.
tell application "iTunes"
	try
		pause
		set my_track to location of current track
		set my_seconds to player position
	on error
		set my_track to location of item 1 of selection
		set my_seconds to 0
	end try
end tell
 
tell application "QuickTime Player"
	open my_track
	set my_movie to first document
	set sound volume of my_movie to 128 --set volume to 50%
	set ts to time scale of my_movie
	set current time of my_movie to my_seconds * ts
	set rate of my_movie to 1.3 -- starts playing
	activate
end tell
