# Installation

yum install rpm-sign pygpgme -y

# Generate a key pair

mkdir .gnupg
gpg --gen-key 



# list keys

gnupg --list-keys


# export your key 

gpg --export -a 'mykey' > RPM-GPG-KEY-ORG




