#!/bin/bash
# sudo apt install playerctl xdotool

# Created 25.10.2026 https://chatgpt.com/share/6ab7f950-4e38-83eb-a512-f8b6e564bbd4
# Updated 10.11.2026 https://share.google/aimode/NuIiKDHuyALbofyMx
echo "Spotify-Guard is now Active!"
while true; do
	if playerctl metadata 2>/dev/null | grep -q '^spotify mpris:trackid .*\/ad\/'; then
		echo "💀 WERBUNG DETECTED → Spotify reboot"

		pkill -x spotify
		sleep 1

		echo "Starte Spotify..."
		spotify >/dev/null 2>&1 &
		spotifyWindowID=""
		while [ -z "$spotifyWindowID" ]; do # wait for spotify window opens
			sleep 0.1
			spotifyWindowID=$(xdotool search --onlyvisible --class spotify)
		done;
		
		echo "Spotify geöffnet, wird minimiert"
		xdotool windowminimize $spotifyWindowID
	
		while ! playerctl metadata 2>/dev/null | grep -q '^spotify'; do # wait for Spotify fully load
				sleep 0.2
		done
	
		echo "Spotify geladen, starte Wiedergabe"
			playerctl play
			playerctl next
	elif ! playerctl metadata 2>/dev/null | grep -q '^spotify'; then
		# No Spotify Playback, spotify-guard dont have to check so often
		sleep 60
	fi
	
	sleep 1
done
