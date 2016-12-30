while read -r LINE; do
      read -r REP < <(exec curl -sSI "$LINE" | head -n 1)
      echo "$LINE: $REP"
done < "$1"
