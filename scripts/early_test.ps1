#################################NOTES################################
##These Scripts are not intended for release and pull from a variety##
##of sources including but not limited to Aircrack, TShark, etc.    ##
######################################################################

######################################################################
############################# VARIABLES ##############################
######################################################################

##Config Variables
$host                       ##This is You!
$console                    ##Used for UI
$colors                     ##Colors for UI
$buffer                     ##Really?
$bckgrnd                    ##Background for UI
$noobmusic                  ##For the Epicness!??!

##Things
$Seraph                     ##Banner

######################################################################
############################## CONFIG ################################
######################################################################

$host.UI.RawUI.BufferSize = new-object System.Management.Automation.Host.Size(175,20000)
$host.UI.RawUI.WindowSize = new-object System.Management.Automation.Host.Size(175,60)
$console.BufferSize = $buffer

$Host.UI.RawUI.BackgroundColor = ($bckgrnd = 'Black')
$Host.UI.RawUI.ForegroundColor = 'DarkGreen'

$Host.PrivateData.ConsolePaneForegroundColor = "DarkGreen"
$Host.PrivateData.ConsolePaneBackgroundColor= $bckgrnd
$Host.PrivateData.ConsolePaneTextBackgroundColor= "Black"

$console = $host.UI.RawUI
$colors = $host.PrivateData
$colors.VerboseForegroundColor = "White"
$colors.VerboseBackgroundColor = "Black"
$colors.WarningForegroundColor = "Yellow"
$colors.WarningBackgroundColor = "Black"
$colors.ErrorForegroundColor = "Black"
$colors.ErrorBackgroundColor = "Red"
$console.ForegroundColor = "Green"
$console.BackgroundColor = "Black"
$noobmusic = "./resources/Docking.wav"
$datestr = (Get-Date).ToString('MM-dd-yyyy-hh-mm-ss-tt')

Clear

######################################################################
############################# SOMETHING ##############################
######################################################################

function intro_beginning
{
    $Seraph = 
    "
    :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    ::      #######                                               /      ::
    ::    /       ###                                           #/       ::
    ::   /         ##                                           ##       ::
    ::   ##        #                                            ##       ::
    ::    ###                                                   ##       ::
    ::   ## ###           /##  ###  /###     /###       /###    ##  /##  ::
    ::    ### ###        / ###  ###/ #### / / ###  /   / ###  / ## / ### ::
    ::      ### ###     /   ###  ##   ###/ /   ###/   /   ###/  ##/   ###::
    ::        ### /##  ##    ### ##       ##    ##   ##    ##   ##     ##::
    ::          #/ /## ########  ##       ##    ##   ##    ##   ##     ##::
    ::           #/ ## #######   ##       ##    ##   ##    ##   ##     ##::
    ::            # /  ##        ##       ##    ##   ##    ##   ##     ##::
    ::  /##        /   ####    / ##       ##    /#   ##    ##   ##     ##::
    :: /  ########/     ######/  ###       ####/ ##  #######    ##     ##::
    ::/     #####        #####    ###       ###   ## ######      ##    ##::
    ::|                                              ##                / ::
    :: \)                                            ##               /  ::
    ::                                               ##              /   ::
    ::                                                ##            /    ::
    :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    "

      $colour=("red","darkred","green","darkgreen","cyan","darkcyan","darkmagenta"."Red")
      [int]$num=-1
  
      $info = $Seraph -split "`n"
      Write-Host ""
      foreach($i in $info){
        [int]$perspective=($num / 5)
        write-host $i -foregroundcolor $colour[$perspective]
        $num++   
      }
        Write-Host ""

    Start-Sleep -s 3
    clear

    '::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::'
    '::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::'
    '::                                                                ::'
    '::            ___                                                 ::'
    '::           -   -_, ,,                 |\                        ::'      
    '::          (  ~/||  ||      _           \\                       ::'  
    '::          (  / ||  ||/|,  < \, \\/\\  / \\  /*\\ \\/\\          ::' 
    '::           \/==||  || ||  /-|| || || || || || || || ||          ::'
    '::           /_ _||  || |* (( || || || || || || || || ||          ::'
    '::          (  - \\, \\/    \/\\ \\ \\  \\/  \\,/  \\ \\          ::'                                           
    '::                                                                ::'
    '::            ___                                                 ::'     
    '::           -   -_, ,, ,,       _-_-                             ::' 
    '::          (  ~/||  || ||         /,                             ::' 
    '::          (  / ||  || ||         || __    /*\\ -_-_   _-_       ::' 
    '::           \/==||  || ||        ~||-  -  || || || \\ || \\      ::' 
    '::           /_ _||  || ||         ||===|| || || || || ||/        ::'
    '::          (  - \\, \\ \\        ( \_, |  \\,/  ||-|  \\,/       ::'
    '::                                      `        |/               ::'  
    '::                                               *                ::' 
    '::::::::::::::::::::::::Enter At Your Own Risk::::::::::::::::::::::'
    '::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::'

    Start-Sleep -m 1000
    Write-Host "                   Press any key to continue..."
    [void][System.Console]::ReadKey($true)

    clear
}

function soundsandthings
{
    powershell (New-Object Media.SoundPlayer "./0._resources/other/docking.wav").Play();Start-Sleep -s 10;(New-Object Media.SoundPlayer "./0._resources/other/docking.wav").Stop()
}

######################################################################
######################################################################
##################### I: Capture Processing ##########################
######################################################################
######################################################################

function intro_I
{

    '::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::'
    '::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::'
    '::                                                                ::'
    '::                    ::::::::::::::::::::::                      ::'
    '::                    ::::::::::::::::::::::                      ::'      
    '::                            :+::+:                              ::'  
    '::                            :+::+:                              ::' 
    '::                            +:++:+                              ::'
    '::                            +:++:+                              ::'
    '::                            +#++#+                              ::'
    '::                            +#++#+                              ::'
    '::                            +#++#+                              ::'    
    '::                            +#++#+                              ::' 
    '::                            #+##+#                              ::' 
    '::                            #+##+#                              ::' 
    '::                            #+##+#                              ::' 
    '::                            #+##+#                              ::'
    '::                    ######################                      ::'
    '::                    ######################                      ::'  
    '::                                                                ::' 
    '::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::'
    '::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::'

    Start-Sleep -m 2000
    clear

    '::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::'
    '::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::'
    '::                                                                ::'
    ':: The (I) Powershell/Python Script(s) are designed to collate    ::'
    ':: raw packet capture data from a variety of sources for analysis ::'      
    ':: processing, and exploitation.                                  ::'  
    ':: with overabundant amounts of traffic.                          ::' 
    '::                                                                ::'
    ':: This is broken down into three distinct phases:                ::'
    '::                                                                ::'
    ':: Stage 1 - Fix any format errors (PCAP, XML, etc).              ::'
    '::                                                                ::'                                           
    ':: Stage 2 - Merge and de-duplicate.                              ::'
    '::                                                                ::'     
    ':: Stage 3 - Data extraction, Log Creation, etc.                  ::' 
    '::                                                                ::' 
    ':: Stage 4 - Initial Explotation/Cracking/Analysis.               ::' 
    '::                                                                ::'
    '::                                                                ::'
    ':: "There are no coincidences, only the illusion of coincidences" ::'  
    '::                                                                ::'
    '::                                                                ::' 
    '::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::'
    '::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::'

    Start-Sleep -m 2000
    Write-Host "                   Press any key to continue..."
    [void][System.Console]::ReadKey($true)
    clear
}

function PCAPFile
{
    Clear
    Write-Host ''
    Write-Host 'Ensure to Input the Full Directory of the Folder/Files(s) if Not Located in The Same Directory as the Script!'
    $filename = Read-Host "What folder and/or file(s) Do You Want To Process?"
    if ($filename -eq "")
    {
        Write-Host ''
        failwhale
        Write-Host "You have not entered a filename. Please try again without failing yourself!"
        pause
        PCAPFile
    }
    else
    {
        if ([System.IO.File]::Exists($filename) -eq "True")
        {
            #PCAPScopePostSelection
            Write-Host "True is True" ## add next part to start processing
        }
        else
        {
            Write-Host ''
            failwhale
            Write-Host "$filename is not a valid file/folder, please try again with feeling!"
            pause
            PCAPFile
        }
    }
}

function PCAPScope
{
    clear
    Write-Host " "
    Write-Host "What Do You Want To Process:"
    Write-Host " "
    Write-Host "(1): Single PCAP"
    Write-Host "(2): Multiple PCAPs"
    Write-Host "(3): All PCAPs in Folder"
    Write-Host "(4): Single AiroDump-NG CSV"
    Write-Host "(5): Multiple AiroDump-NG CSVs"
    Write-Host "(6): All AiroDump-NG CSVs in Folder"
    Write-Host "(7): Single Kismet CSV"
    Write-Host "(8): Multiple Kismet CSVs"
    Write-Host "(9): All Kismet CSVs in Folder"
    Write-Host " "
    $PCAPScopeSelection = Read-Host 'Type The Number From The Options Above'
    Write-Host " "
    Write-Host " "
    Write-Host " "
    $Verification = Read-Host "You Have Selected $PCAPScopeSelection, Is This Correct? (Yes/No)"
    if ($Verification -eq "Yes")
    {
        PCAPFile
    }
    if ($Verification -eq "No")
    {
        PCAPScope
    }
    else
    {
        write-host "$Verification is not a valid response!"
        failwhale
        pause
        PCAPScope
    }
}


function PCAPScopePostSelection
{
    if ($PCAPScopeSelection -eq "1")
    {
        Write-Host "You have selected the option to process a single PCAP file"
    }
    if ($PCAPScopeSelection -eq "2")
    {
        Write-Host "You have selected the option to process multiple PCAP files"
    }
    if ($PCAPScopeSelection -eq "3")
    {
        Write-Host "You have selected the option to process all PCAP files in a folder"
    }
    if ($PCAPScopeSelection -eq "4")
    {
        Write-Host "You have selected the option to process a single AiroDump-NG CSV"
    }
    if ($PCAPScopeSelection -eq "5")
    {
        Write-Host "You have selected the option to process multiple AiroDump-NG CSV files"
    }
    if ($PCAPScopeSelection -eq "6")
    {
        Write-Host "You have selected the option to process all AiroDump-NG CSV files in a folder"
    }
    if ($PCAPScopeSelection -eq "7")
    {
        Write-Host "You have selected the option to process a single Kismet CSV file"
    }
    if ($PCAPScopeSelection -eq "8")
    {
        Write-Host "You have selected the option to process multiple Kismet CSV files"
    }
    if ($PCAPScopeSelection -eq "9")
    {
        Write-Host "You have selected the option to process all Kismet CSV files in a folder"
    }
    else
    {
        write-host "$PCAPScopeSelection is not a valid response"
        failwhale
        pause
        PCAPScope
    }
}

function PCAPFileValidation
{
    ## user input
    $verification = Read-Host "You Have Chosen $filename, is this correct? (Yes/No)"
    if ($verification -eq "Yes")
    {
        FixerPythonCallOne
    }
}

function FixerPythonCallOne
{
   
}

function FixerPythonCallAll
{
    python ./0._resources/fixer.py $files
    $files = ""
    if ("fixed_$files" -eq $fileexistcheck)
    {
        $filename = "fixed_$files"
    }
    #move any fixed files
}

function MergerPythonCall
{
    python ./0._resources/merger.py
    #properly move all merged files
    #error control
}

function CreateTXTFiles
{
    $filenametemp = $filename + "_SSID_Beacons.txt"
    ./0._resources/porg/tshark.exe -r $files -Y "wlan.fc.type_subtype == 0x0008" >> $filenametemp 
    $filenametemp = $filename + "_SSID_Reponses.txt"
    ./0._resources/porg/tshark.exe -r $files -Y "wlan.fc.type_subtype == 0x0005" >> $filenametemp 
    $filenametemp = $filename + "_SSID_Requests.txt"clear
    ./0._resources/porg/tshark.exe -r $files -Y "wlan.fc.type_subtype == 0x0005" >> $filenametemp
    $filenametemp = $filename + "_SSID_EAPOL.txt"
    ./0._resources/porg/tshark.exe -r $files -Y "eapol" >> $filenametemp
    $filenametemp = $filename + "_HTTP.txt"
    ./0._resources/porg/tshark.exe -r $files -Y "http" >> $filenametemp
    $filenametemp = $filename + "_DNS.txt"
    ./0._resources/porg/tshark.exe -r $files -Y "dns" >> $filenametemp
    $filenametemp = $filename + "_TCP.txt"
    ./0._resources/porg/tshark.exe -r $files -Y "tcp" >> $filenametemp
    $filenametemp = $filename + "_UDP.txt"
    ./0._resources/porg/tshark.exe -r $files -Y "udp" >> $filenametemp
    $filenametemp = $filename + "_SMB.txt"
    ./0._resources/porg/tshark.exe -r $files -Y "smb" >> $filenametemp
    $filenametemp = $filename + "_FTP.txt"
    ./0._resources/porg/tshark.exe -r $files -Y "ftp" >> $filenametemp
    $filenametemp = $filename + "_mDNS.txt"
    ./0._resources/porg/tshark.exe -r $files -Y "mdns" >> $filenametemp
}

function CreatePCAPFiles
{
    $filenametemp = $filename + "_SSID_Beacons.pcap"
    ./0._resources/porg/tshark.exe -r $files -2 -R "wlan.fc.type_subtype == 0x0008" -w $filenametemp
    $filenametemp = $filename + "_SSID_Reponses.pcap"
    ./0._resources/porg/tshark.exe -r $files -2 -R "wlan.fc.type_subtype == 0x0005" -w $filenametemp
    $filenametemp = $filename + "_SSID_Requests.pcap"
    ./0._resources/porg/tshark.exe -r $files -2 -R "wlan.fc.type_subtype == 0x0005" -w $filenametemp
    $filenametemp = $filename + "_SSID_EAPOL.pcap"
    ./0._resources/porg/tshark.exe -r $files -2 -R "eapol" -w $filenametemp
    $filenametemp = $filename + "_HTTP.pcap"
    ./0._resources/porg/tshark.exe -r $files -2 -R "http" -w $filenametemp
    $filenametemp = $filename + "_DNS.pcap"
    ./0._resources/porg/tshark.exe -r $files -2 -R "dns" -w $filenametemp
    $filenametemp = $filename + "_TCP.pcap"
    ./0._resources/porg/tshark.exe -r $files -2 -R "tcp" -w $filenametemp
    $filenametemp = $filename + "_UDP.pcap"
    ./0._resources/porg/tshark.exe -r $files -2 -R "udp" -w $filenametemp
    $filenametemp = $filename + "_SMB.pcap"
    ./0._resources/porg/tshark.exe -r $files -2 -R "smb" -w $filenametemp
    $filenametemp = $filename + "_FTP.pcap"
    ./0._resources/porg/tshark.exe -r $files -2 -R "ftp" -w $filenametemp
    $filenametemp = $filename + "_mDNS.pcap"
    ./0._resources/porg/tshark.exe -r $files -2 -R "mdns" -w $filenametemp
}

function ExtractObjectsFiles
{
    mkdir exportobjects
    $testdir = "./exportobjects/"
    #check folder creation
    #user select options http,smb,tftp on by default
    ./0._resources/porg/tshark.exe -nr $filesa --export-objects http,$testdir
    ./0._resources/porg/tshark.exe -nr $filesa --export-objects smb,$testdir
    ./0._resources/porg/tshark.exe -nr $filesa --export-objects imf,$testdir
    ./0._resources/porg/tshark.exe -nr $filesa --export-objects tftp,$testdir
    ./0._resources/porg/tshark.exe -nr $filesa --export-objects dicom,$testdir
}

function Decloak
{
    $DecloakInput  ##userinput essid or bssid
    $DecloakInput2 ##user input for req
    if ($DecloakInput -eq "ESSID")
    {
        $DecloakInput3 = $DecloakInput2 -replace ":",""
        $DecloakOutput = $files + "_DecloakedPackets" + $DecloakInput3
        $Processed_Decloak_Input = " -ESSID " + $DecloakInput2
        ./0._resources/porg/airdecloak-ng.exe -i $filesa $Processed_Decloak_Input -o $DecloakOutput
    }
    if ($DecloakInput -eq "BSSID")
    {
        $DecloakOutput = $files + "_DecloakedPackets" + $DecloakInput2
        $Processed_Decloak_Input = " -BSSID " + $DecloakInput2
        ./0._resources/porg/airdecloak-ng.exe -i $filesa $Processed_Decloak_Input -o $DecloakOutput
    }
    else
    {
        failwhale ## ensure our whale friend joins the party
    }    
}

function Decap
{

}

function SearchByMAC
{
    #src, dst or both user input
    #what is the IP, IPs (include csv,txt input)
}

function SearchbyIP
{
    #src, dst or both user input
    #what is the IP, IPs (include csv,txt input)
}

function SearchByBSSID
{

}

function SearchByESSID
{
    $filenametemp = "$ESSID_Extracted_TXT.txt"
    ./0._resources/porg/tshark.exe -r $files -2 -R "wlan.ssid == $SSIDBeingSearched" >> $filenametemp
    $ScrapSSID = Get-Content $filenametemp | Sort -Unique
    #for($ScreenedSSID in $ScrapSSID)
    #{
        
    #}
    ./0._resources/porg/tshark.exe -r $files -2 -R "wlan.ssid == $SSIDBeingSearched" -w temp $ESSID_Extracted_$files
}

function AirodumpCSVParser
{
    foreach ($file in Get-ChildItem * -filter "*.csv" | Select -exp Name)
    {
        import-csv $file –header BSSID > BSSID_temp_2.txt
            foreach($line in Get-Content BSSID_temp_2.txt) 
            {
                if($line -match "Station MAC")
                {
                    Move-Item $file .\processed\   
                    break
                }
                else
                {
                    $line >> BSSID_temp.txt
                }
            }

    }
    $BSSID_temp = cat BSSID_temp.txt
    $BSSID_temp = $BSSID_temp -replace "BSSID" -replace "" 
    $BSSID_temp = $BSSID_temp -replace "-----" -replace "" 
    $BSSID_temp = $BSSID_temp | sort-object –Unique
    rm BSSID_temp.txt
    $BSSID_LOG_File = "$datestr" + "_BSSID_LOG_File.txt"
    $BSSID_temp >> $filename
    (gc $filename) | ? {$_.trim() -ne "" } | set-content $BSSID_LOG_File
    rm BSSID_temp.txt
    rm BSSID_temp_2.txt
}

intro_beginning
intro_I
PCAPScope
