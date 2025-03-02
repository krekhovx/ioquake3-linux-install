<div align="center">
<img src="https://github.com/krekhovx/ioquake3-linux-install/blob/master/for-readme/header.webp">
</div>

## ioquake3-linux-install
This project is created to simplify the installation and launch of Quake III
Arena with enhanced content and the latest updates from ioquake3. It downloads
all necessary files and automates the process of preparing the game for launch
on Linux.

The project provides a script that:

- Downloads and installs the latest version of ioquake3: ioquake3 is an updated
  and improved version of the Quake III Arena engine, which supports modern
  operating systems and offers numerous fixes and enhancements. The script
  automatically downloads and installs the latest ioquake3 archives from the
  official site for [Linux](https://ioquake3.org/get-it/).

- Installs High-Resolution Textures: In addition to the engine, the script also
  downloads and installs a set of high-resolution textures from the
  [High-Resolution Textures](https://ioquake3.org/extras/replacement_content/)
  archive, significantly improving the game's visual quality.

- Downloads all necessary game files: The script will download all necessary
  **pk3** files from my personal Quake III Arena archive for ioquake3.

- Provides cd-key: The **q3key** is included to simplify the game launch
  process.

## Why should I use ioquake3 instead of id software’s 1.32c?
Answer from the
[ioquake3](https://ioquake3.org/help/players-guide/#whyioquake3):
*id software stopped fixing bugs, security issues, and adding features to Quake
3: Arena more than fifteen years ago. We’ve added many features and fixed too
many bugs to count.*

## Installation
<u>The script **install.sh** does not install files to the root filesystem; it
only operates locally within the current project directory.</u>

- Before installation, make sure that your machine has internet access.

- Make sure you have the following packages installed on your system:
  **coreutils, findutils, wget, unzip, sshpass, openssh-client.**

On Debian-based systems, you can install packages like this:
```
$ sudo apt update
$ sudo apt install -y coreutils findutils wget unzip sshpass openssh-client
```

- Run the installation script:
```
$ ./install.sh
```

- Enjoy the game:
```
$ cd ioquake3/
$ ./ioquake3.x86_64
```

Yes, it's that simple.</br>
Multiplayer works well.

- Want to download various maps?
```
$ ./install.sh --download-maps
```
I downloaded some popular maps and put them on my SFTP. I think it's convenient.
You can also download the maps separately (see **Useful links**).

## My configuration for 1920x1080 game
I've slightly modified the default configuration, changing some settings and
hotkeys to make it more convenient for playing. If you want to try it:

```
# if the directory does not exist create it
$ mkdir -p ~/.q3a/baseq3

# if you have your own configuration save it
$ cp ~/.q3a/baseq3/q3config.cfg ~/.q3a/baseq3/backup-q3config.cfg

# go back to the root of the project and copy the file
$ cp misc/q3config.cfg ~/.q3a/baseq3
```

After this, don't forget to change default nickname in the game.

## Where are the game files stored?
```
~/.q3a/
```

## Useful links

### Guides
- [Players Guide](https://ioquake3.org/help/players-guide/)
- [Sys Admin Guide](https://ioquake3.org/help/sys-admin-guide/)

### Project
- [GitHub](https://github.com/ioquake/ioq3)
- [Bug Tracker 1](https://github.com/ioquake/ioq3/issues)
- [Bug Tracker 2](https://bugzilla.icculus.org/describecomponents.cgi?product=ioquake3)

### Where can I find good maps to download?
- [Maps 1](https://lvlworld.com/)
- [Maps 2](https://ru.ws.q3df.org/maps/)

## Thanks
Thanks to the developers for creating this wonderful game and the volunteers who
still support this project.

ioquake3 :heart:
