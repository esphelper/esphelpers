PORT=$1
BAUD=$2
SSID=$3
PASSWORD=$4

python esptool/esptool.py --port $PORT --baud $BAUD chip_id

cd mavesp8266

sed -i "44s/.*/const char* kDEFAULT_SSID       = \"$SSID\";/" ./src/mavesp8266_parameters.cpp
sed -i "45s/.*/const char* kDEFAULT_PASSWORD   = \"$PASSWORD\";/" ./src/mavesp8266_parameters.cpp

platformio run -e esp12e

cd ..
esptool/esptool.py --baud $BAUD --port $PORT write_flash 0x00000 ./mavesp8266/.pioenvs/esp12e/firmware.bin
