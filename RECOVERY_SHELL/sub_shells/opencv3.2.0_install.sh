
echo 'Remove old version packages'
sudo apt-get -y remove ffmpeg x264 libx264-dev

echo -e 'Install Dependencies'
sudo apt-get -y install libopencv-dev
sudo apt-get -y install build-essential checkinstall cmake pkg-config yasm
sudo apt-get -y install libtiff4-dev libjpeg-dev libjasper-dev
sudo apt-get -y install libavcodec-dev libavformat-dev libswscale-dev libdc1394-22-dev libxine-dev libgstreamer0.10-dev libgstreamer-plugins-base0.10-dev libv4l-dev
sudo apt-get -y install python-dev python-numpy
sudo apt-get -y install libtbb-dev
sudo apt-get -y install libqt4-dev libgtk2.0-dev
sudo apt-get -y install libfaac-dev libmp3lame-dev libopencore-amrnb-dev libopencore-amrwb-dev libtheora-dev libvorbis-dev libxvidcore-dev
sudo apt-get -y install x264 v4l-utils

echo -e 'Optional packages according to org'
sudo apt-get install libtbb2 libpng-dev libtiff-dev

echo -e 'Unzip OpenCV'
mkdir ~/Software/OpenCV3.2.0
unzip ../../OpenCV/opencv-3.2.0.zip -d ~/Software/OpenCV3.2.0

echo -e 'Unzipping ffmpeg'
tar -zxvf ../../OpenCV/ffmpeg-2.8.8.tar.gz -C ~/Software/OpenCV3.2.0

# 将Anaconda暂时移至回收站
echo -e 'Must move Anaconda2 to Trash temporary ! '
mv ~/anaconda2 ~/.local/share/Trash

echo -e 'Replace ippicv'
rm ~/Software/OpenCV3.2.0/3rdparty/ippicv/downloads/linux-808b791a6eac9ed78d32a7666804320e/ippicv_linux_20151201.tgz
cp ../../OpenCV/ippicv_linux_20151201.tgz ~/Software/OpenCV3.2.0/3rdparty/ippicv/downloads/linux-808b791a6eac9ed78d32a7666804320e/ippicv_linux_20151201.tgz

echo -e 'Generate Makefile'
mkdir ~/Software/OpenCV3.2.0/build
cd ~/Software/OpenCV3.2.0/build
cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local -D WITH_TBB=ON -D BUILD_NEW_PYTHON_SUPPORT=ON -D WITH_V4L=ON -D INSTALL_C_EXAMPLES=ON -D INSTALL_PYTHON_EXAMPLES=ON -D BUILD_EXAMPLES=ON -D WITH_QT=ON -D WITH_OPENGL=ON  -D CUDA_GENERATION=Kepler  -D WITH_FFMPEG=OFF ..

echo -e 'Compile'
cmake ..
make -j8
sudo make install

pkg-config --modversion opencv

# 将Anaconda从回收站restore
echo -e 'Restore Anaconda2 ! '
mv ~/.local/share/Trash/anaconda2 ~/anaconda2

cp /usr/local/lib/python2.7/dist-packages/cv2.so ~/anaconda2/lib/python2.7/site-packages/

echo "OpenCV 3.2.0 ready to be used"

