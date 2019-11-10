$myDoc = [Environment]::GetFolderPath("MyDocuments")
$gameData = "$mydoc\My Games\FINAL FANTASY XIV - A Realm Reborn"
$dropboxPath = Get-Content "$ENV:LOCALAPPDATA\Dropbox\info.json" -ErrorAction Stop | ConvertFrom-Json | % 'personal' | % 'path'
$backupPath = "$dropboxPath\Backup Folder\FFXIV"
$charList = gci $gamedata |? {$_.Name -like "FFXIV_CHR*"}
$backupDate = "backup" + (get-date -format yyMMdd-hhmm)
function make-link ($target, $link) {
    New-Item -Path $link -ItemType SymbolicLink -Value $target
}

#run links per character
foreach ($c in $charList) 
	{
        #create folder to backup if not there
        
        if (!(test-path "$gamedata\$backupDate\$c")) 
		    {
            mkdir "$gamedata\$backupDate\$c"
            }
	    
    #backup current config items
	mv "$gameData\$c\*" "$gameData\$backupDate\$c" -force
    
    #get character files and location from dropbox    
    $charLoc = $backupPath + "\" + $c
    $charFiles = gci $charLoc
    
    #make links for character specific files
    foreach ($cF in $charFiles) 
         {
         make-link "$charloc\$cF" "$gamedata\$c\$cF"
         } 

    $commonFiles = gci "$backupPath\COMMON\CHAR"
    
    #make links for common files between all characters
    foreach ($comF in $commonFiles)
        {
        make-link "$backupPath\COMMON\CHAR\$comF" "$gameData\$c\$comF"
        }

    #make links for computer specific UI layout
    make-link "$backupPath\$env:COMPUTERNAME\ADDON.DAT" "$gameData\$c\ADDON.DAT"

    }

#backup character appearance data and shared macros
mv "$gameData\FFXIV_CHARA_01.dat" "$gameData\$backupDate\" -force
mv "$gameData\MACROSYS.DAT" "$gameData\$backupDate\" -force

#make links for haracter appearance data and shared macros
make-link "$backupPath\COMMON\FFXIV_CHARA_01.DAT" "$gameData\FFXIV_CHARA_01.DAT"
make-link "$backupPath\COMMON\MACROSYS.DAT" "$gameData\MACROSYS.DAT"