#!/bin/bash

virsh list --name | while read n \
do
  [[ ! -z $n ]] && virsh domifaddr $n
done