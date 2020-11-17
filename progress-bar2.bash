#!/bin/bash
i=50
echo
echo "0--------20--------40-------60--------80-------100%"
while [ $i -ge 0 ]
do
echo -n "#"
sleep 1
i=`expr $i - 1`
done
echo
