

alias gen-rsa-pair="openssl genrsa -out private.key 4096 && openssl rsa -in private.key -pubout > pubkey.key"