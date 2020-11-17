#!/bin/bash
rm -f /var/lib/rpm/__db.[0-9][0-9]*
rpm --quiet -qa
rpm --rebuilddb
