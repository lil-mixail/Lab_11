#!/bin/bash


# Podanie pliku jako argument
FILE="$1"

# Nowy typ pliku po podpisaniu 
PRIVATE_KEY="private.pem"
SIGNATURE="${FILE}.sig"

# Generowanie klucza prywatnego (jesli nie istnieje)
if [ ! -f "$PRIVATE_KEY" ]; then
    openssl genpkey -algorithm RSA -out "$PRIVATE_KEY" -pkeyopt rsa_keygen_bits:2048
    echo "Wygenerowano nowy klucz prywatny: $PRIVATE_KEY"
fi

# Podpisywanie pliku
openssl dgst -sha256 -sign "$PRIVATE_KEY" -out "$SIGNATURE" "$FILE"

# Sprawdzenie, czy podpisywanie sie udalo (0 oznacza sukces)
if [ $? -eq 0 ]; then
    echo "Sukces: $SIGNATURE"
else
    echo "Error"
fi
