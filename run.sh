#!/bin/bash

# --- pre-emptive clean ---
rm /tmp/discord*.tar.gz

# --- find discord install via symbolic link ---
pre_index=`whereis discord`
index=(${pre_index// / }) # translate whereis cmd output to usable string for bash ops
discord_dir=${index[2]}

# --- download latest (as tar.gz) ---
wget --trust-server-names -P /tmp 'https://discord.com/api/download?platform=linux&format=tar.gz'

# --- remove old discord files ---
sudo rm $discord_dir/*

# --- add new discord files ---
sudo tar -xvf /tmp/discord*.tar.gz --strip-components=1 --directory $discord_dir

# --- cleanup ---
rm /tmp/discord*.tar.gz