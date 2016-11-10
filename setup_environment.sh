sudo apt-get -y install python-dev git python-pip python build-essential

sudo pip install virtualenv

virtualenv wifi

source wifi/bin/activate

git clone --recursive https://github.com/dogmaphobic/mavesp8266.git
git clone https://github.com/themadinventor/esptool.git

pip install pyserial

pip install setuptools platformio

esptool/esptool.py -h

cd mavesp8266
platformio run -t clean
cd ..

deactivate
