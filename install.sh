#!/bin/sh -e

mkdir ioquake3
mkdir zip
mkdir tmp

# download main Linux ioquake3 build
wget https://files.ioquake3.org/Linux.zip

# download archive with new high-resolution textures
wget https://files.ioquake3.org/xcsv_hires.zip

unzip Linux.zip -d ioquake3/
unzip ioquake3/release-linux-x86_64.zip -d ioquake3/

# know this host
sftpip="5.63.158.181"
if ! ssh-keygen -F "$sftpip" 2>/dev/null; then
	ssh-keyscan -H "$sftpip" >> ~/.ssh/known_hosts
fi

# get all default *.pk3 files from my SFTP server
sshpass -p '1' sftp sftpuser@5.63.158.181 <<EOF
lcd ioquake3/baseq3
cd pk3
get *.pk3
bye
EOF

# copy cd-key for ioquake3 (optional)
cp misc/q3key ioquake3/baseq3/

# replace the textures from Quake 3 with new high-resolution textures
unzip xcsv_hires.zip -d tmp/
mv tmp/*.pk3 ioquake3/baseq3/
rm -rf tmp

# put all zip archives separately
find . -path ./zip -prune -o -name "*.zip" -type f -exec mv {} zip/ \;
