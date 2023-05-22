#!/bin/bash
# Sort by larger file size 
du -sh * | sort -nr | head -n10 
