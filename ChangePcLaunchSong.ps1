<#
Author: xDOZAx

Description: Will change song that plays when PC launches

Requires: Itunes installed.

If issues occur then try placing a .m4a song in path: 
 'C:\Users\$env:USERNAME\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup'
Date: 08/20/2022

#>

Write-Verbose "Updating Morning Song :) . . . Don't close me!" -Verbose

Start-Sleep -Seconds 5

try{

$path = "C:\Users\$env:USERNAME\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"

cd $path

$sound = (dir).BaseName

$nameOfSong = "$sound.m4a"

$fileToRemove = $path + "\$nameOfSong"

Remove-Item -Path $fileToRemove
}catch{}

$musicPath = "C:\Users\$env:USERNAME\Music\iTunes\iTunes Media\Music"

cd $musicPath

$music = dir -Recurse

$musicList = $music.Name -like "*.m4a"

$trackNumber = Get-random -Minimum 0 -Maximum $musicList.Count

Write-Verbose "Random music track selected... " -Verbose

$song = $musicList[$trackNumber]

$partialPath = (dir -Filter "*$song" -Recurse).DirectoryName

$allFolders = $partialPath.Split("\")

$midPath = $allFolders[7] + "\" + $allFolders[8] + "\"

$copyPath = $musicPath + "\" + $midPath + "$song"

$destinationPath = $path + "\$song"

#Play song 

Copy-Item -Path $copyPath -Destination $destinationPath




Write-Verbose "Music Transfer Complete." -Verbose

Start-Sleep -Seconds 10