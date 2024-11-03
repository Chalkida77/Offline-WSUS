# Offline-WSUS

Suppose you have two WSUSs, the Internet WSUS and the Offline WSUS.
This script allows you to download  WSUS updates to the offline Microsoft WSUS , only getting the update METADATA from the Internet WSUS, not the updates themselves, thus only downloading few GBs of the updates you actually need instead of massively downloading TBs of useless data. 

The way it works is the following
1. You have to configure the same settings to the two WSUS servers , as in a typical online offline  WSUS  pair.
2. You synchronise the internet WSUS to microsoft without approving (hence downloading) any update.
3. You export the metadata from the Internet_WSUS and import them to the Offline_WSUS.
4. On the Offline_WSUS , you only approve the updates you need to download. Since there is no internet connection, the updates stay in a "Downloading" state.
5. Run the "Generate_Needed_Updates_List.ps1" on the Offline WSUS. The "Download_Needed_Updates.ps1" is created.
7. Copy this script and run it on any computer connected to the internet. The "body" of the needed updates is downloaded.
8. You "robocopy" the downloaded update files back to the Offline_WSUS and then restart the BITS service 
