openssl genrsa -out RootCA.key 4096
openssl req -new -x509 -days 356 -key RootCA.key -out RootCA.crt 
openssl genrsa -out IntCA.key 4096
openssl req -new -key IntCA.key -out IntCA.csr 
