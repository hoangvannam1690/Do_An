# AAD305x_01
***
**Chú ý: cần cài thêm các thư viện**
#### Bắt buộc
* Install Taglib: 
  - `sudo apt-get install libtag1-dev` 
* Install LGL nếu build bị lỗi -lGL error, Có máy thiếu có máy không (chưa rõ nguyên nhân):
  - `sudo apt-get install libgl1-mesa-dev`

#### Không bắt buộc 
* Thư viện Gstream (hỗ trợ phát các link stream trực tiếp dạng m3u8...). Ứng dụng Video và Radio đang phát dạng này.
  - Cài đặt: `sudo apt-get install libgstreamer1.0-0 gstreamer1.0-plugins-base gstreamer1.0-plugins-good gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly gstreamer1.0-libav gstreamer1.0-doc gstreamer1.0-tools gstreamer1.0-x gstreamer1.0-alsa gstreamer1.0-gl gstreamer1.0-gtk3 gstreamer1.0-qt5 gstreamer1.0-pulseaudio`
  - Tham khảo tại: https://minhng.info/scripts/cai-dat-gstreamer.html	
   https://gstreamer.freedesktop.org/documentation/installing/on-linux.html?gi-language=c

***
**IDE/Compiler: Qt Creator 5.13 64bit/GCC**
* Platform: Ubuntu 19.10
*

***
** Sử dụng **
* Mở app InputData trước khi mở app HomeScreen vì HomeScreen sẽ kết nối và đọc dữ liệu từ InputData
* Sử dụng hardkey:
  - Nhấn Enter để bắt đầu hiển thị focus
  - Nhấn Up/Down/Left/Right để select
  - Nhấn giữ Shit + navigation để reorder
  -
* Khi danh sách app lớn hơn 6, có hiển Scrollbar

** Các ứng dụng **
* Các ứng dụng chỉ làm tượng trưng
* Map
* Media
* Video: Play/Pause live TV khi nhấn Enter/mouse
* Radio: Play/Pause radio online khi nhấn Enter/mouse
*
