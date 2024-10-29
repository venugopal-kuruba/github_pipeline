#!/bin/bash
rm -rf /tmp/testfolder*
for I in {1..10}; do
    echo "Welcome To DevSecOpsB41 Training $I"
    mkdir /tmp/testnew0$I
    sleep 1
done
