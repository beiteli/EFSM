#! /bin/bash

DIR="$(cd "$( dirname "${BASH_SOURCE[0]}")" && pwd )"
APPDIR=/usr/src/gator/AndroidBench/APKs/testAPKs/
BINDIR=/usr/src/gator/gator

#out=`conda activate python27`

cd $APPDIR
c=0
for p in `ls`;do
     dirnames[$c]=$p
     ((c++))
done 
echo ${#dirnames[@]}
cd $BINDIR
for(( i=0;i<${#dirnames[@]};i++)); do
#    echo ${dirnames[i]}
    ./gator a -p ../AndroidBench/APKs/testAPKs/${dirnames[i]} -client testclient -enableStringPropertyAnalysis -enableStringAppendAnalysis | tee saves/${dirnames[i]%.apk}.txt
    sleep 0m
done

