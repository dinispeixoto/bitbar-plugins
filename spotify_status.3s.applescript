#!/usr/bin/osascript

-- Main flow
set currentlyPlayingTrack to getCurrentlyPlayingTrack()
do shell script "echo " & quoted form of currentlyPlayingTrack

-- Method to get the currently playing track
on getCurrentlyPlayingTrack()
	tell application "Spotify"
		set currentArtist to artist of current track as string
		set currentTrack to name of current track as string
		
		return "🎧 " & currentArtist & " - " & currentTrack
	end tell
end getCurrentlyPlayingTrack