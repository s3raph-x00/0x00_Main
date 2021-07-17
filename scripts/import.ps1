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
$DateStr = (Get-Date).ToString('MM-dd-yyyy-hh-mm-ss-tt')
$test = cat BSSID_temp.txt
$test = $test -replace "BSSID" -replace "" 
$test = $test -replace "-----" -replace "" 
$test2 = $test | sort-object –Unique
rm BSSID_temp.txt
$filename = "$DateStr" + "_BSSID.txt"
$test2 >> $filename
(gc $filename) | ? {$_.trim() -ne "" } | set-content $filename
rm BSSID_temp_2.txt
