# FixAuraSync
A PowerShell script that attempts to fix the ASUS Aura Sync when it is not properly detecting lighting devices by stopping related services, removing the LastProfile.xml file, and then restarting the services.

# Prerequisites
If you have not set up your Windows PC to run PowerShell scripts, you will need to run PowerShell as administrator and enter one of the following commands:

Set-ExecutionPolicy Unrestricted

or 

Set-ExecutionPolicy RemoteSigned

Note that the second command is safer, but it may require you to 'Unblock' the script before you can use it (Right Click -> Properties -> Unblock)

# Installation
1. Download the script from the **Releases** page or clone the git repository
2. If you downloaded the script from Releases, extract the FixAuraSync.ps1 script and copy it where you would like it (for example, to C:\Scripts).
3. Run PowerShell as administrator
4. Navigate to the folder you put the script in. For example, if you put it in C:\Scripts, type the following command: cd C:\Scripts
5. Run the following command: Install-Script FixAuraSync.ps1

# Running the Script
If you installed the script using the installation procedure, do the following to run the script:

1. Run PowerShell as Administrator
2. Type the following command: FixAuraSync

If you downloaded the script but did not install it using the Install-Script command, use the following procedure to run the script:

1. Run PowerShell as Administrator
2. Navigate to the folder you put the script in. For example, if you put it in C:\Scripts, type the following command: cd C:\Scripts
3. Run the script by typing the following command: .\FixAuraSync.ps1

# Disclaimer
This was a quick and dirty script and only tested on one machine (my own) with a system running ASUS Armoury Create. I cannot guarantee this will work on your system. Use at your own risk!
