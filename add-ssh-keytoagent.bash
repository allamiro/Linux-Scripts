#!/bin/bash
eval $(ssh-agent -s)
sleep 5
ssh-add ~/.ssh/id_rsa
