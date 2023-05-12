
for x in `cat file.txt`; do echo ""; ssh -qtx useradmin@$x'sudo useradd -g wheel user2';done


for i in {1..4}; do ${i};done

