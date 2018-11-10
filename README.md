# Blueist
Automatically downloads all VC redistributables and installs them

# Instructions
Just run the script. By default, installs only the redistributables for your PC's architecture and does it in unattended mode (shows progress bars but no interaction other than UAC required). Files will be deleted when the script is done.

# Sources used:

 - https://github.com/WPN-XM/vcredist
	 - Direct download links
- esha @ https://stackoverflow.com/questions/25407634/check-processor-architecture-and-proceed-with-if-statement
	- Powershell snippet to check architecture
- http://asawicki.info/news_1597_installing_visual_c_redistributable_package_from_command_line.html
	- Arguments to silently install VC redists

# TODO

 - Flags to:
	 - Keep downloaded files
	 - Install both architectures
	 - Toggle silent/unattended/attended installs
- Run installers one by one on unattended and attended installs
- Obtain links from WPN-XM repo directly instead of hard-coded array
