display dialog "Please select the desktop background type:" buttons ¬
	{"Cancel", "Normal", "ScreenSaver"} ¬
		default button 3 with title "Choose Desktop Background"
if button returned of result = "ScreenSaver" then
	do shell script "/System/Library/Frameworks/ScreenSaver.framework/Resources/ScreenSaverEngine.app/Contents/MacOS/ScreenSaverEngine -background > /dev/null 2>&1 &"
else if button returned of result = "Normal" then
	tell application "ScreenSaverEngine" to quit
end if