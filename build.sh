#!/bin/bash

set -e

CFGS="proxy_test_defconfig noproxy_test_defconfig proxy_nosmp_test_defconfig proxy_preempt_test_defconfig"

date
git log --pretty="Building %C(yellow)%h%C(reset) %s" HEAD~1..HEAD
for cfg in $CFGS
do 
	echo "=====[Using $cfg...]====================="
	mkdir -p out/$cfg
	make O=out/$cfg  $cfg;
	make O=out/$cfg -j80 bzImage > /dev/null ;
done
date
