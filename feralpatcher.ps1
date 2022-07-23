Set-Variable -Name "ServerName" -Value "EmuFeral Online"
Set-Variable -Name "GameURL" -Value "https://download.fer.al/win64/FeralInstaller.exe"
Set-Variable -Name "PatchURL" -Value "https://aerialworks.ddns.net/extra/emuferal/sharedassets1-online.assets"

#Install Feral
if (-not Test-Path (%LOCALAPPDATA%\WildWorks\Feral)){
	Invoke-WebRequest -Url $GameURL -OutFile %HOMEPATH%\Downloads\FeralInstaller.exe
	echo "Installing Fer.al client...\n Close the game when it opens."
	Start-Process -FilePath "FeralInstaller.exe" -WorkingDirectory "%HOMEPATH%\Downloads" -Wait
}
else{
	echo "Fer.al is already installed."
}

#Install Patch
Invoke-WebRequest -Url $PatchURL -OutFile %LOCALAPPDATA%\WildWorks\Feral\Data\build\Fer.al_Data\sharedassets1.assets

echo "Your client is now patched and you can log in to $ServerName"











