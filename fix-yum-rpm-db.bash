#!/bin/bash
rm -f /var/lib/rpm/__db.*
rpm --quiet -qa
rpm --rebuilddb
