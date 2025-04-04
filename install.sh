#!/bin/sh

set -e

download_pk3_maps_files()
{
sshpass -p '1' sftp sftpuser@5.63.158.181 <<EOF
lcd ioquake3/baseq3
cd pk3/various-maps
get *.pk3
bye
EOF
}

download_pk3_files()
{
sshpass -p '1' sftp sftpuser@5.63.158.181 <<EOF
lcd ioquake3/baseq3
cd pk3
get *.pk3
bye
EOF
}

default_installation()
{
	mkdir ioquake3
	mkdir zip
	mkdir tmp

	# download main Linux ioquake3 build
	wget https://files.ioquake3.org/Linux.zip

	# download archive with new high-resolution textures
	wget https://files.ioquake3.org/xcsv_hires.zip

	unzip Linux.zip -d ioquake3/
	unzip ioquake3/release-linux-x86_64.zip -d ioquake3/

	# know this host (SFTP server with main *.pk3 files)
	sftpip="5.63.158.181"
	if ! ssh-keygen -F "$sftpip" >/dev/null 2>&1; then
		ssh-keyscan -H "$sftpip" >> ~/.ssh/known_hosts
	fi

	# download all default *.pk3 files from my SFTP server
	download_pk3_files

	# copy cd-key for ioquake3 (optional)
	cp misc/q3key ioquake3/baseq3/

	# replace the textures from Quake 3 with new high-resolution textures
	unzip xcsv_hires.zip -d tmp/
	mv tmp/*.pk3 ioquake3/baseq3/
	rm -rf tmp

	# put all zip archives separately
	find . -path ./zip -prune -o -name "*.zip" -type f -exec mv {} zip/ \;
}

get_various_maps()
{
	if [ ! -d ioquake3/baseq3 ]; then
		>&2 echo "Please, run the script without arguments first"
		exit 1
	fi

	# download various *.pk3 maps from my SFTP server
	download_pk3_maps_files
}

if [ $# -eq 0 ]; then
	default_installation
else
	if [ "$1" = "--download-maps" ]; then
		get_various_maps
	fi
fi
