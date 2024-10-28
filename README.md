# Offline-WSUS

Suppose you have two WSUS, the Internet_WSUS and the Offline_WSUS.
This script allows you to download of WSUS updates to the offline Microsoft WSUS , without ever downliading them to the Internet_WSUS. 

The way it works is the following
1. You have to configure the same sattings to the two WSUS servers , as in a typical online offline  WSUS  pair.
2. You synchrinose the internet WSUS to microsoft without approving any update.
3. You export the metatada from the Internet_WSUS and import them to the Offline_WSUS
