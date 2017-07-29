
echo -e 'Install pip'
sudo apt-get install python-pip
pip install --upgrade pip

echo 'Add permanent mirror'
sudo mkdir /root/.pip
sudo gedit /root/.pip/pip.conf
echo -e '\n[global] trusted-host=pypi.douban.com \nindex-url=http://pypi.douban.com/simple' >>/root/.pip/pip.conf
source /root/.pip/pip.conf

echo -e 'Modify hard disk permissions'
sudo chown -hR hok:hok /media/hok/19b0da70-50d3-4964-b12c-2ed718e3b528
sudo chmod -R 777 /media/hok/19b0da70-50d3-4964-b12c-2ed718e3b528

echo -e 'Install necessary packages'
sudo apt-get install nautilus-open-terminal
sudo apt-get install scrot
sudo apt-get install git
pip install ipython
pip install jupyter

