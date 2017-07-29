
echo 'Decompress cudnn5.1'
mkdir ~/Software/Cudnn
tar -xvzf ../../Cudnn/cudnn-8.0-linux-x64-v5.1.tgz ~/Software/Cudnn
sudo cp ~/Software/Cudnn/lib64/lib* /usr/local/cuda/lib64/
sudo cp ~/Software/Cudnn/include/cudnn.h /usr/local/cuda/include/

echo 'Links operation'
sudo rm -rf /usr/local/cuda/lib64/libcudnn.so /usr/local/cuda/lib64/libcudnn.so.5
sudo ln -s /usr/local/cuda/lib64/libcudnn.so.5.1.5 /usr/local/cuda/lib64/libcudnn.so.5
sudo ln -s /usr/local/cuda/lib64/libcudnn.so.5 /usr/local/cuda/lib64/libcudnn.so

