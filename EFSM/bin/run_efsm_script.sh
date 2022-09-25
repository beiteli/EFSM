#! /bin/bash

DIR="$(cd "$( dirname "${BASH_SOURCE[0]}")" && pwd )"
APPDIR=/home/libeite/trace/Stoat/benchmark/
BINDIR=/home/libeite/trace/Stoat/Stoat/bin/

#out=`conda activate python27`

cd $APPDIR
# c=0
# for p in `ls -d */`;do
#     dirnames[$c]=$p
#     ((c++))
# done 
dirnames=("com.addi_44_src")
echo ${#dirnames[@]}
for(( i=0;i<${#dirnames[@]};i++)); do
#    echo ${dirnames[i]}
    cd $APPDIR${dirnames[i]}
    out1=`ant emma debug install`
    cd $BINDIR
    ruby run_efsm_testing_only_test.rb --app_dir $APPDIR${dirnames[i]} --avd_name testAVD_1 --avd_port 5554 --stoat_port 2000 --only_test --project_type ant
    sleep 0m
done
