
/sbin/pam_tally2 --user=admin --reset
faillock --user admin --reset
passwd -u admin
usermod -U admin
chage admin -d $(date +%Y-%m-%d)
