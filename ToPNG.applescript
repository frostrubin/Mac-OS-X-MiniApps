--This Script uses the sips command to convert image to png
--I mainly use it to batch convert icns files to png

--This is a Droplet! You have to save it as an Application
--and have to choose the "stay open" option!
on open theDropped
	repeat with oneDrop in theDropped
		if kind of (info for alias oneDrop) is not "folder" then
			set iPath to quoted form of POSIX path of oneDrop
			set iFolder to quoted form of POSIX path of (do shell script "dirname " & iPath)
			tell application "Finder"
				set iExtension to name extension of file oneDrop
			end tell
			set iFile to (do shell script "basename " & iPath & "|sed 's/\\(.*\\)" & iExtension & "/\\1png/'")
			set iFile to quoted form of POSIX path of iFile
			try
				do shell script "sips -s format png " & iPath & " --out " & iFolder & iFile
				do shell script "sips -i " & iFolder & iFile
			end try
		end if
	end repeat
	return
end open
