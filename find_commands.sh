#!/bin/bash
## Find files over 200 MB
find /path -type f -size +200M -exec ls -lh {}\;
## Find files not modified in last 20 Days
find /path -type f -mtime +20
## Delete those files
find /path -type f -mtime +20 -exec rm -f {}\;
