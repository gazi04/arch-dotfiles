# #!/bin/bash
#
# get_spotify_status() {
#   status=$(playerctl --player=spotify status 2>/dev/null)
#
#   if [ $? -eq 0 ]; then
#     if [ "$status" = "Playing" ] || [ "$status" = "Paused" ]; then
#       artist=$(playerctl --player=spotify metadata artist)
#       title=$(playerctl --player=spotify metadata title)
#       echo "$artist - $title"
#     else
#       echo "Spotify is stopped"
#     fi
#   fi
# }
#
# # Initial call
# get_spotify_status
#
# # Listen for changes
# playerctl --player=spotify metadata --follow | while read -r line; do
#   get_spotify_status
# done


#!/bin/bash

get_spotify_status() {
  if pgrep -x "spotify" > /dev/null; then
    status=$(playerctl --player=spotify status 2>/dev/null)

    if [ "$status" = "Playing" ] || [ "$status" = "Paused" ]; then
      artist=$(playerctl --player=spotify metadata artist)
      title=$(playerctl --player=spotify metadata title)

      song_info="$artist - $title"
      
      max_length=40
      
      if [ ${#song_info} -gt $max_length ]; then
        song_info="${song_info:0:$max_length}..."
      fi

      echo "$song_info"
    else
      echo "Spotify is stopped"
    fi
  else
    echo ""
  fi
}

get_spotify_status

while true; do
  if ! pgrep -x "spotify" > /dev/null; then
    echo ""
  else
    get_spotify_status
  fi
  sleep 1
done
