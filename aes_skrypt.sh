#!/bin/bash

# Podanie pliku do szyfrowania jako argument
FILE="$1"

# Nowy typ pliku po szyfrowaniu
ENCRYPTED="${FILE}.enc"

# Hasło do szyfrowania (-s nie pokusuje na ekranie)
read -sp "Podaj hasło szyfrowania: " PASSWORD
echo

#Zapisywanie hasła do PASSWORD
openssl enc -aes-256-cbc -salt -in "$FILE" -out "$ENCRYPTED" -k "$PASSWORD"


# Sprawdzenie, czy szyfrowanie sie udalo (0 oznacza sukces)
if [ $? -eq 0 ]; then
    echo "Sukces: $ENCRYPTED"
else
    echo "Error"
fi
