$myDoc = [Environment]::GetFolderPath("MyDocuments")
$gameData = "$mydoc\My Games\FINAL FANTASY XIV - A Realm Reborn"
$dropboxPath = Get-Content "$ENV:LOCALAPPDATA\Dropbox\info.json" -ErrorAction Stop | ConvertFrom-Json | % 'personal' | % 'path'
$backupPath = "$dropboxPath\Backup Folder\FFXIV"

$charList = gci $gamedata |? {$_.Name -like "FFXIV_CHR*"}

$backupDate = "backup" + (get-date -format yyMMdd-hhmm)

function make-link ($target, $link) {
    New-Item -Path $link -ItemType SymbolicLink -Value $target
}


foreach ($c in $charList) 
	{
        #create folder to backup if not there
        
        if (!(test-path "$gamedata\$backupDate\$c")) 
		    {
            write-host "THING"
            mkdir "$gamedata\$backupDate\$c"
            }
        else {Write-Host "otherthing"}
	    
    #backup current items
	mv "$gameData\$c\*" "$gameData\$backupDate\$c" -force
        
    $charLoc = $backupPath + "\" + $c
    $charFiles = gci $charLoc

    foreach ($cF in $charFiles) 
         {
         make-link "$charloc\$cF" "$gamedata\$c\$cF"
         } 

    $commonFiles = gci "$backupPath\COMMON\CHAR"
    
    foreach ($comF in $commonFiles)
        {
        make-link "$backupPath\COMMON\CHAR\$comF" "$gameData\$c\$comF"
        }

    make-link "$backupPath\$env:COMPUTERNAME\ADDON.DAT" "$gameData\$c\ADDON.DAT"

    }
mv "$gameData\FFXIV_CHARA_01.dat" "$gameData\$backupDate\" -force
mv "$gameData\MACROSYS.DAT" "$gameData\$backupDate\" -force

make-link "$backupPath\COMMON\FFXIV_CHARA_01.DAT" "$gameData\FFXIV_CHARA_01.DAT"
make-link "$backupPath\COMMON\MACROSYS.DAT" "$gameData\MACROSYS.DAT"


