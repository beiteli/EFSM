#! /bin/bash

DIR="$(cd "$( dirname "${BASH_SOURCE[0]}")" && pwd )"
APPDIR=/home/libeite/trace/EFSM/androidTest/
BINDIR=/home/libeite/trace/EFSM/EFSM/bin/

#out=`conda activate python27`

cd $APPDIR
# c=0
# for p in `ls -d */`;do
#     dirnames[$c]=$p
#     ((c++))
# done 
# dirnames=("com.github.cetoolbox_1_src")
# "dalvik-explorer" "de.homac.Mirrored_9_src" 
dirnames=("com.chmod0.manpages_3_src")
echo ${#dirnames[@]}
for(( i=0;i<${#dirnames[@]};i++)); do
#    echo ${dirnames[i]}
    cd $APPDIR${dirnames[i]}
    out1=`ant emma debug install`
    cd $BINDIR
    # ruby run_efsm_testing.rb --app_dir $APPDIR${dirnames[i]} --avd_name testAVD_1 --avd_port 5554 --stoat_port 2000 --only_gui_exploration --project_type ant | tee log1.txt
    ruby run_efsm_testing.rb --app_dir $APPDIR${dirnames[i]} --avd_name testAVD_1 --avd_port 5554 --stoat_port 2000 --project_type ant
    kill -9 $(lsof -i:2000 | sed -n '2p' | awk '{print $2}')
    lsof -i:2000
    sleep 0m
done

