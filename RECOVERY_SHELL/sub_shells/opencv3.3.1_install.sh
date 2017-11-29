
=================================================  NEW VERSION ===================================================

pip install opencv-python


=================================================  OLD VERSION ===================================================

echo 'Remove old version packages'
sleep 3
sudo apt-get -y remove ffmpeg x264 libx264-dev

echo -e 'Install Dependencies'
sleep 3
sudo apt-get -y install libopencv-dev
sudo apt-get -y install build-essential checkinstall cmake pkg-config yasm
sudo apt-get -y install libtiff4-dev libjpeg-dev libjasper-dev
sudo apt-get -y install libavcodec-dev libavformat-dev libswscale-dev libdc1394-22-dev libxine-dev libgstreamer0.10-dev libgstreamer-plugins-base0.10-dev libv4l-dev
sudo apt-get -y install python3-dev python3-numpy
sudo apt-get -y install libtbb-dev
sudo apt-get -y install libqt4-dev libgtk3.1-dev
sudo apt-get -y install libfaac-dev libmp3lame-dev libopencore-amrnb-dev libopencore-amrwb-dev libtheora-dev libvorbis-dev libxvidcore-dev
sudo apt-get -y install x264 v4l-utils

echo -e 'Optional packages according to org'
sleep 3
sudo apt-get install libtbb2 libpng-dev libtiff-dev

echo -e 'Unzip OpenCV'
sleep 3
mkdir ~/Software/OpenCV3.3.1
unzip ../../OpenCV/opencv-3.3.1.zip -d ~/Software/OpenCV3.3.1

echo -e 'Unzipping ffmpeg'
sleep 3
tar -zxvf ../../OpenCV/ffmpeg-2.8.8.tar.gz -C ~/Software/OpenCV3.3.1

echo -e 'Mv OpenCV3.3.1/OpenCV-3.3.1/* to OpenCV3.3.1/'
sleep 3
mv ~/Software/OpenCV3.3.1/opencv-3.3.1/* ~/Software/OpenCV3.3.1/
rm -r ~/Software/OpenCV3.3.1/opencv-3.3.1/

# 将　Anaconda3/　暂时移至回收站 (================= 由于加入了anaconda3的链接，所以不一定要，要了可能还会出问题 ================)
echo -e 'Must move Anaconda3 to Trash temporary ! '
sleep 3
mv ~/anaconda3 ~/.local/share/Trash

echo -e 'Replace ippicv'
sleep 3
# 接下来会报错，猜测是因为mkdir的路径不能太多级？反正拆开来（先cd，再mkdir就可以正常进行）
mkdir ~/Software/OpenCV3.3.1/3rdparty/ippicv/downloads/
mkdir ~/Software/OpenCV3.3.1/3rdparty/ippicv/downloads/linux-808b791a6eac9ed78d32a7666804320e/
cp ../../OpenCV/ippicv_linux_20151201.tgz ~/Software/OpenCV3.3.1/3rdparty/ippicv/downloads/linux-808b791a6eac9ed78d32a7666804320e/ippicv_linux_20151201.tgz

echo -e 'Generate Makefile'
sleep 3
mkdir ~/Software/OpenCV3.3.1/build
cd ~/Software/OpenCV3.3.1/build
#  (================= 添加了  -D PYTHON_EXECUTABLE=~/anaconda3/bin/python ================)
cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local -D WITH_TBB=ON -D BUILD_NEW_PYTHON_SUPPORT=ON -D WITH_V4L=ON -D INSTALL_C_EXAMPLES=ON -D INSTALL_PYTHON_EXAMPLES=ON -D PYTHON_EXECUTABLE=~/anaconda3/bin/python -D BUILD_EXAMPLES=ON -D WITH_QT=ON -D WITH_OPENGL=ON  -D CUDA_GENERATION=Kepler  -D WITH_FFMPEG=ON ..

echo -e 'Compile'
sleep 3
cmake ..
make -j8
# 编译完后会要求再次输入密码，所以脚本运行到这里就会停掉，等待input
sudo make install

pkg-config --modversion opencv

# 将　Anaconda/　从回收站restore
echo -e 'Restore Anaconda3 ! '
sleep 3
mv ~/.local/share/Trash/anaconda3 ~/anaconda3

cp /usr/local/lib/python3.6/dist-packages/cv2.so ~/anaconda3/lib/python3.6/site-packages/

echo "OpenCV 3.3.1 ready to be used"
