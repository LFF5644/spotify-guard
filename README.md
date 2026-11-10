# spotify-guard
Auto restart Spotify if ADs detacted

# Dependencies 
- Linux
- playerctl
- xdotool

If you are on Debian or Ubuntu based Linux just enter:
```sh
sudo apt install playerctl xdotool
```

# How do it work?
Its Simple just enter the command `playerctl metadata` while u listen to Spotify:
```
$ playerctl metadata 
spotify mpris:trackid             /com/spotify/track/4PTG3Z6ehGkBFwjybzWkR8
spotify mpris:length              213573000
spotify mpris:artUrl              https://i.scdn.co/image/ab67616d0000b27315ebbedaacef61af244262a8
spotify xesam:album               Whenever You Need Somebody
spotify xesam:albumArtist         Rick Astley
spotify xesam:artist              Rick Astley
spotify xesam:autoRating          0.75
spotify xesam:discNumber          1
spotify xesam:title               Never Gonna Give You Up
spotify xesam:trackNumber         1
spotify xesam:url                 https://open.spotify.com/track/4PTG3Z6ehGkBFwjybzWkR8
```
I just simply Saw that i have all the track infos. So far so good.

If an AD is start playing the `spotify xesam:url` starts with `https://open.spotify.com/ad/` that is something that we can listen to and then do:
- kill Spotify (Manualy Close works too btw)
- Starting Spotify & Min to Taskbar
- Starting Playback if started
- wait for the next AD
