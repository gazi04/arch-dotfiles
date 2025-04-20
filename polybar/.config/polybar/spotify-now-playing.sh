!/bin/bash

get_current_media_status() {
  if playerctl --all-players status &> /dev/null; then
    status=$(playerctl --all-players status 2>/dev/null)

    if [ "$status" = "Playing" ] || [ "$status" = "Paused" ]; then
      artist=$(playerctl --all-players metadata artist 2>/dev/null || echo "Unknown Artist")
      title=$(playerctl --all-players metadata title 2>/dev/null || echo "Unknown Title")

      song_info="$title - $artist"

      max_length=30
      if [ ${#song_info} -gt $max_length ]; then
        song_info="${song_info:0:$max_length}..."
      fi

      echo "$song_info"
    else
      echo "Stopped"
    fi
  else
    echo ""
  fi
}

get_current_media_status

while true; do
  get_current_media_status
  sleep 1
done
