#!/bin/bash
if [ -z "$1" ]; then
  echo "Użycie: $0 nazwa_gry.d64"
  echo "Usage: $0 game_name.d64"
  exit 1
fi

if ! command -v d64copy &> /dev/null
then
    echo "d64copy nie jest zainstalowane! / is not installed!"
    exit 1
fi

echo "Rozpoczynam kopiowanie / Starting copy: $1"
d64copy "$1"
echo "Kopiowanie zakończone / Copy finished!"
