# EFSM  
## 运行环境  
Ubuntu 14.04/Linux  
Ruby: 2.1  
Nokogiri  
Python 2.7(最好是使用conda管理的环境)，uiautomator  
Java 1.8  
Android SDK: API 18+，使用avdmanager创建安卓模拟器，指令类似下面两条，可以根据需求更改：  
ant  
sdkmanager “system-images;android-18;google_apis;x86”  
avdmanager create avd --force --name testAVD_1 --package 'system-images;android-18;google_apis;x86' --abi google_apis/x86 --sdcard 512M --device 'Nexus 7'  
  
此外，需要在系统路径中export相应路径：  
export ANDROID_HOME="/home/XX/Android/Sdk"  
export PYTHONPATH="/home/XX/uiautomator"  
export CLASSPATH="/home/XX/fsmdroid/soot-github/lib/soot-develop.jar  
export PATH=$PATH:${ANDROID_HOME}/build-tools/25.0.0:${ANDROID_HOME}/emulator:${ANDROID_HOME}/tools:${ANDROID_HOME}/tools/bin:${ANDROID_HOME}/platform-tools:  
  
最后，运行前需要修改conf.txt及被测安卓应用指向的sdk路径  
  
## 运行方法  
调用EFSM/bin目录下的run_script.sh  
