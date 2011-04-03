--This Script Locks or Unlocks the Dock
--I am using it to prevent unintentional deletions

display dialog "Lock the Dock..." buttons {"Lock", "Unlock", "Cancel"} default button 3
copy the result as list to {buttonpressed}
if the buttonpressed is "Lock" then
	try
		tell application "Dock" to quit
		do shell script "defaults write com.apple.dock contents-immutable -bool true"
		delay 1
		tell application "Dock" to activate
	end try
else if the buttonpressed is "Unlock" then
	try
		tell application "Dock" to quit
		do shell script "defaults write com.apple.dock contents-immutable -bool false"
		delay 1
		tell application "Dock" to activate
	end try
end if
