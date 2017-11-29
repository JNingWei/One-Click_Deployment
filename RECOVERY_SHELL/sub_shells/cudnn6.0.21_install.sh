
echo 'Decompress cudnn6.0.21'
mkdir ~/Software/Cudnn
tar -xvzf ../../Cudnn/cudnn-8.0-linux-x64-v6.0.tgz -C ~/Software/Cudnn
sudo cp ~/Software/Cudnn/cuda/lib64/lib* /usr/local/cuda/lib64/
sudo cp ~/Software/Cudnn/cuda/include/cudnn.h /usr/local/cuda/include/

echo 'Links operation'
sudo rm -rf /usr/local/cuda/lib64/libcudnn.so /usr/local/cuda/lib64/libcudnn.so.6
sudo ln -s /usr/local/cuda/lib64/libcudnn.so.6.0.21 /usr/local/cuda/lib64/libcudnn.so.6
sudo ln -s /usr/local/cuda/lib64/libcudnn.so.6 /usr/local/cuda/lib64/libcudnn.so

sudo ldconfig
