
echo 'Install cuda8.0'
sudo dpkg -i ../../Cuda/cuda-repo-ubuntu1404-8-0-local_8.0.44-1_amd64.deb
sudo apt-get update
sudo apt-get install cuda
nvidia-smi
cat /proc/driver/nvidia/version

sudo gedit /etc/profile
echo -e '\nexport PATH=/usr/local/cuda/bin:$PATH\n' >> /etc/profile
sudo gedit /etc/ld.so.conf.d/cuda.conf
echo -e '\n/usr/local/cuda/lib64\n' >> /etc/ld.so.conf.d/cuda.conf
source /etc/profile
sudo ldconfig

sudo gedit ~/.bash_profile
echo -e '\nexport LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH\n' >> ~/.bash_profile  
source ~/.bash_profile
sudo ldconfig

