#!/usr/bin/env osascript

tell application "System Events"
	set myList to (name of every process)
end tell

if myList contains "Spotify" then
	tell application "Spotify"
		if player state is stopped then
			return
		end if
		set musicPlayer to "Spotify"
		set trackname to name of current track
		set artistname to artist of current track
		set albumname to album of current track
		
		if player state is playing then
			set state to 1
		else if player state is paused then
			set state to 0
		else
			set state to -1
		end if
	end tell
else if myList contains "iTunes" then
	tell application "iTunes"
		if player state is stopped then
			return
		end if
		set musicPlayer to "iTunes"
		set trackname to name of current track
		set artistname to artist of current track
		set albumname to album of current track
		
		if player state is playing then
			set state to 1
		else if player state is paused then
			set state to 0
		else
			set state to -1
		end if
	end tell
else
	return
end if

if state is 1 then
	set pauseIcon to ""
else if state is 0 then
	set pauseIcon to "❙❙ "
else
	set pauseIcon to ""
end if

return "Playing at " & musicPlayer & " : " & pauseIcon & trackname & " – " & artistname & " (" & albumname & ")"
