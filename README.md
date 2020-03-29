# AAD305x_01
***
**Chú ý: cần cài thêm các thư viện**
#### Bắt buộc
* Install Taglib: 
  - `sudo apt-get install libtag1-dev` 
* có thể cần Install LGL :
  - `sudo apt-get install libgl1-mesa-dev`

#### Không bắt buộc 
* Thư viện Gstream (hỗ trợ phát các link stream trực tiếp dạng m3u8...). Ứng dụng Video và Radio đang phát dạng này.
  - Cài đặt: `sudo apt-get install libgstreamer1.0-0 gstreamer1.0-plugins-base gstreamer1.0-plugins-good gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly gstreamer1.0-libav gstreamer1.0-doc gstreamer1.0-tools gstreamer1.0-x gstreamer1.0-alsa gstreamer1.0-gl gstreamer1.0-gtk3 gstreamer1.0-qt5 gstreamer1.0-pulseaudio`
  - Tham khảo tại: https://minhng.info/scripts/cai-dat-gstreamer.html	

***
**IDE/Compiler: Qt Creator 5.13 64bit/GCC**
* Platform: Ubuntu
*

***
** - **
* Mở app InputData trước khi mở app HomeScreen vì HomeScreen sẽ kết nối và đọc dữ liệu từ InputData
