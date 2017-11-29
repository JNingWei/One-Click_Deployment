
echo -e '\n Please choose the best Ubuntu source firstly'
mkdir ~/Software

echo -e '\n Three steps'
bash ./sub_shells/three_steps.sh

echo -e '\n Cuda Install'
bash ./sub_shells/cuda8.0_install.sh

echo -e '\n CuDnn Install'
bash ./sub_shells/cudnn6.0.21_install.sh

echo -e '\n SogouPinyin Install'
bash ./sub_shells/sogoupinyin_install.sh

echo -e '\n Other Install'
bash ./sub_shells/other_install.sh

echo -e '\n Anaconda3 Install'
bash ./sub_shells/anaconda3.sh

echo -e '\n ShadowSocks Install'
bash ./sub_shells/shadowsocks_install.sh

echo -e '\n Chrome Install'
bash ./sub_shells/chrome_install.sh

echo -e '\n Pycharm Install'
bash ./sub_shells/pycharm17.2_install.sh

echo -e '\n TensorFlow Install'
bash ./sub_shells/tensorflow1.4.0_install.sh

echo -e '\n PyTorch Install'
bash ./sub_shells/pytorch0.2.0_install.sh

echo -e '\n OpenCV Install'
bash ./sub_shells/opencv3.3.1_install.sh

echo -e '\n VPN Install'
bash ./sub_shells/vpn_install.sh

echo -e '\n Thank you for using ! Byebye ~'
rm -rf ../RECOVERY_SHELL

sudo reboot
