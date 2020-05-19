# Acer Nitro 7-AN715-51-OpenCore-Hackintosh
 Goal of this repo is to run MacOs on ACER NITRO 7 
 (Can work on Acer nitro 5 2019 model)

 MacOS Catalina 10.15.4
 :-------------------------:
 ![alt text](screenshots/Screenshot.png)
 ![](screenshots/ss.png)

 ## Guide
 
 * Bios Unlock [GUIDE](https://www.win-raid.com/t6175f54-Request-Unlocking-the-advanced-and-overclocking-menu-ACER-NITRO-AN.html)
 * Go to [GUIDE](https://dortania.github.io/vanilla-laptop-guide/)(**Official Guide**)
 * [OC-Little](https://github.com/daliansky/OC-little) - (**By daliansky**)

 ## ## System Information 💻
 
 | Part | Functional | Model | 
 | --- | --- | --- |
 | Machine | ✅ | Nitro 7 AN715-51 |
 | BIOS | ✅ | 1.29 Insyde-Unlocked |
 | CPU | ✅ | Intel(R) Core(TM) i5-9300H CPU @ 2.40GHz |
 | RAM | ✅ | 16GB DDR4 2666GHz SODIMM |
 | SSD | ✅ | 256GB Kingston NVMe(MacOS) + 1TB Crucial P1 NVMe(Windows 10) + 2TB Seagate HDD |
 | iGPU | ✅ | Intel UHD Graphics 630 1536 MB |
 | WLAN | ✅ | Broadcom BCM94352Z NGFF 802.11AC BT 4.0 Card |
 | Bluetooth | ✅ | Broadcom 20702 Bluetooth 4.0 |
 | Ethernet | ✅ | Qualcomm/Atheros E2500 PCI-E Gigabit Ethernet |
 | Webcam | ✅ | Integrated 720P Webcam |
 | Audio | ✅ | ALC255 |
 | Microphone | 🚫 | Integrated Microphone |
 | Internal Screen | ✅ | LG LP156WFG-SPF3 15.6' 1920x1080 144Hz |
 | Trackpad | ✅ | I2C ELAN0504 |
 | Keyboard | ✅ | - |
 | dGPU | 🚫 | NVIDIA GTX 1660ti 6GB GDDR6 |
 
 ## Status
 * Battery Status	| ✅
 * Brightness With keys(Fn+up/down) | ✅
 * Sleep/Hibernate | ✅
 * USB Ports | ✅
 * FaceTime/iMessages | Not tested
 * Rest everything is stable
 
 
 ## ## Issues & Solutions
 ### macOS
 * [Hackintool: The Swiss army knife of vanilla Hackintoshing.](https://github.com/headkaze/Hackintool)
 * [How to download a full ‘Install macOS’ app with software update in TERMINAL](https://scriptingosx.com/2019/10/download-a-full-install-macos-app-with-softwareupdate-in-catalina/)
 
 ### Audio
 * KEXT required to enable Audio support: `AppleALC.kext`
 * Make sure you inject audio `layout-id = 29 or 71` in OpenCore , using layout-id = 3 may get distorted audio. (Microphone doesn't work yet- Working on a custom layout-id)
 * Please share if you find out other working `layout-id`!
 
 ### ELAN Trackpad (TPAD)
 * The new official I2C kexts are having some issues with wake/sleep .
 * For now use custom I2C kexts by @tiger511 .
 * Will get updated once the issues are fixed . 
 
 ### Wifi & Bluetooth
 * In order to get Bluetooth and Wifi working, a wireless card replacement is needed.
 * I replaced mine with BCM94352Z - got it from aliexpress .
 * For now, the best card to use is BCM94360CS2 using a NGFF adapter which you can buy on eBay under $10. It has the highest performance among all other hackintosh-able wireless cards. It is natively supported in OpenCore (v2.X and above).
 
 ### GPU
 ##### iGPU
 * UHD 630 is supported from 2.X and above.
 * Some times UHD 630 glichs on the internal screen , maybe because of my 144hz display.
 * HDMI Port :
    * Long story short, it won't work. Why? Because all display output is hard wired to the NVIDIA GPU. You can confirm this by going into NVIDIA controler panel in Windows and see PhysX, and you can see all display output is wired to the NVIDIA card, while the eDP in screen display is wired to the iGPU. Therefore, since NVIDIA card won't work, also Optimus won't work, the HDMI port or USB-C display output just won't work because the display output is not wired to the iGPU. Not to mention you disabled dGPU in `config.plist/-wegnoegpu`or custom `SSDT-DDGPU`.	
 ##### dGPU
 * NVIDIA GTX1660ti is not supported and is disabled with `-wegnoegpu`.
 * [Apple and Nvidia Are Over: NVIDIA drops CUDA support for macOS.](https://gizmodo.com/apple-and-nvidia-are-over-1840015246)
 * Currently, there is nothing we can do. Let's hope Apple and NVIDIA work together again. 
 
 ### Power Management
 * On idle laptop uses 0.50w to 0.60w - stable for me.
 * using custom SSDT-DDGPU fixes power sapping issues .
 
 Intel Power Gadget
 :-------------------------:
 ![alt text](screenshots/IPG.png)
 
## Credits

- [acidanthera](https://github.com/acidanthera) for providing almost all kexts and drivers
- [alexandred](https://github.com/alexandred) for providing VoodooI2C
- [headkaze](https://github.com/headkaze) for providing the very useful [Hackintool](https://www.tonymacx86.com/threads/release-hackintool-v2-8-6.254559/)
- [daliansky](https://github.com/daliansky) for providing the awesome hotpatch guide [OC-little](https://github.com/daliansky/OC-little/) and the always up-to-date hackintosh solutions [XiaoMi-Pro-Hackintosh](https://github.com/daliansky/XiaoMi-Pro-Hackintosh) [黑果小兵的部落阁](https://blog.daliansky.net/)
- [RehabMan](https://github.com/RehabMan) for providing numbers of [hotpatches](https://github.com/RehabMan/OS-X-Clover-Laptop-Config/tree/master/hotpatch) and hotpatch guides
- [tiger511](https://github.com/tiger511) for custom I2C kexts
- And all other authors that mentioned or not mentioned in this repo
 
 ## License
 * This work is issued under the [996 License](https://github.com/996icu/996.ICU/blob/master/LICENSE) and [MIT License](https://opensource.org/licenses/MIT).