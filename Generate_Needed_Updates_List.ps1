$WsusContent_Path = 'C:\WSUS'
echo "It is assumed that WSUS repository lies under WSUS Path:  $WsusContent_Path If not, edit the script."

$Export_Script = "C:\Users\Administrator\Desktop\Download_Needed_Updates.ps1"


#$USB_Mount = Read-Host -Prompt 'Input your USB mount letter  , e.g. \\tsclient\E  '
#$Export_Script = "$USB_Mount\Download_Needed_Updates.ps1"


#Clear previous Download_Needed_Updates.ps1
if (Test-Path -Path $Export_Script) { Clear-Content -Path $Export_Script }



echo "`$Drive = Read-Host -Prompt 'Enter the Destination Path , e.g. F:'" >>  $Export_Script
echo "if (!`$Drive.EndsWith(':')) { `$Drive = `$Drive+':'} " >>  $Export_Script  # concatenates ":" at the end of Drive Letter

$BITS_Jobs = BITSADMIN  /list /allusers /verbose | Select-String  -SimpleMatch 'WORKING'    

foreach ($BITS_Job in $BITS_Jobs){
    $BITS_part =  $BITS_Job -split ' '
     
    
    #create folder command
    $Update_Path = $BITS_part[6]   #e.g. E:\WSUS\WsusContent\E8\1AF.....cab

    $Update_Path_Part =  $Update_Path -split '\\'
    $Update_Folder = '\'+$Update_Path_Part[2]+'\'+$Update_Path_Part[3]  #e.g. \WsusContent\E8

    $Update_Full_Path = Join-Path -Path '$Drive' -ChildPath $Update_Folder
    echo  " New-Item -ItemType Directory -Force -Path    $Update_Full_Path"      >>  $Export_Script  
      
    #Start-BitsTransfer command
    $target = $($BITS_part[6]).Replace($WsusContent_Path,'$Drive')
    echo " Start-BitsTransfer -Source $($BITS_part[4]) -Destination  $target   " >>  $Export_Script
}

echo "Export saved to $Export_Script"

