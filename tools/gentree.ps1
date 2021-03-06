# gentree.ps1
# Generates a tree of the archive, assuming you have MEGAcmd in its default folder
Echo "AlphaNT Directory Tree Generator`n(c) 2018 Jacopo Maltagliati"
$MEGAClient = "${env:LOCALAPPDATA}\MEGAcmd\MEGAClient.exe"
$TodayDate = Get-Date -UFormat "%d%m%Y"
$OutputFile = "alphant_tree_${TodayDate}.txt"
$CurDir = (Get-Item -Path ".\").FullName
Set-Location 
& $MEGAClient login https://mega.nz/#F!RyAxwAzQ!K1vjCrm7nd_lwNqlE-bU9Q
"AlphaNT Software Archive - Directory Listing as of ${TodayDate}`r`n" > $OutputFile
& $MEGAClient ls -R >> $OutputFile
Copy $OutputFile "latest.txt"
Echo "Generated ${CurDir}\${OutputFile}"
& $MEGAClient logout > $null
Exit
