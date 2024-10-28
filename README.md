# Offline-WSUS

Suppose you have two WSUS, the Internet_WSUS and the Offline_WSUS.
This script allows you to download  WSUS updates to the offline Microsoft WSUS , without ever downloading them to the Internet_WSUS.

The way it works is the following
1. You have to configure the same settings to the two WSUS servers , as in a typical online offline  WSUS  pair.
2. You synchronise the internet WSUS to microsoft without approving (hence downloading) any update.
3. You export the metadata from the Internet_WSUS and import them to the Offline_WSUS.
4. On the Offline_WSUS , you only approve the updates you need to download.
5. Since there is no internet connection, the updates stay in a "Downloading" state. You run the "generate.... .ps1" on the Offline_WSUS
6. The "xxx.ps1" is created. You copy this script and run it on any computer connected to the internet. The "body" of the needed updates is downloaded.
7. You "robocopy" the downloaded update files back to the Offline_WSUS and then restart the BITS service 
