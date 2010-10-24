--RAMdisk
--This Script mounts part of the system RAM as a super fast hard drive.
--Watch out: Data WILL get lost if computer is shut down!!
--(Still handy for super fast video editing or storing heavily accessed files)
try
	set mb_size to the text returned of (display dialog ¬
		"How many MB shall the RAM-Disk have?" & return ¬
		default answer "" buttons {"Cancel", "Create"} default button 2) as integer
on error
	set mb_size to ""
end try

if mb_size is not "" then
	set new_name to the text returned of ¬
		(display dialog ¬
			"Which name shall the RAM-Disk have?" default answer ¬
			"" buttons {"OK"} default button 1)
	try
		set mb_size to mb_size * 2048
		--return mb_size
		set created_ramdisk to ¬
			(do shell script "hdid -nomount ram://" & mb_size)
		--return created_ramdisk
		set disk_name to ¬
			(do shell script "basename " & created_ramdisk)
		--return disk_name
		do shell script ¬
			"newfs_hfs -v " & disk_name & ¬
			" /dev/" & created_ramdisk
		do shell script ¬
			"diskutil mount " & created_ramdisk
		set mountpoint to "/Volumes/" & disk_name
		set mountpoint to ¬
			(do shell script "echo " & mountpoint & ¬
				" | sed -e 's/ /\\\\\\ /g'")
		-- only three backslashes, if it is a shell script
		do shell script ¬
			"/Developer/Tools/SetFile -a C " & mountpoint
		do shell script ¬
			"diskutil rename " & mountpoint & " " & ¬
			quoted form of new_name
	end try
end if
