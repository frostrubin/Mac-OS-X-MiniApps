#!/bin/bash
# Run the current Screen Saver as Desktop background
/System/Library/Frameworks/ScreenSaver.framework/Resources\
/ScreenSaverEngine.app/Contents/MacOS/\
ScreenSaverEngine -background


# This Script can _not_ be run via "do shell script" in Applescript Editor,
# you would always have to "force quit" the resulting application.

# Instead, this script has to be made an application via a helper App:
# Platypus [http://www.sveinbjorn.org/platypus] can make this Script into a
# standalone application.