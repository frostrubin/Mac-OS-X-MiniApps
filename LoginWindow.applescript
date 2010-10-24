--LoginWindow
--This Script shows the Login Window without Logging you out.
--Nice to lock your Mac without having to close the lid.
do shell script ¬
	"/System/Library/CoreServices/Menu\\ Extras/" & ¬
	"User.menu/Contents/Resources/CGSession -suspend"
