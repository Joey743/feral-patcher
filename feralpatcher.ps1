Set-Variable -Name "ServerName" -Value "EmuFeral Online"
Set-Variable -Name "GameURL" -Value "https://download.fer.al/win64/FeralInstaller.exe"
Set-Variable -Name "PatchURL" -Value "https://aerialworks.ddns.net/extra/emuferal/sharedassets1-online.assets"

#Install Feral
if (-not (Test-Path "$HOME\AppData\Local\Programs\WildWorks\Feral")){
	Invoke-WebRequest -Uri $GameURL -OutFile $HOME\Downloads\FeralInstaller.exe
	Write-Output "Installing Fer.al client..."
	Write-Output "Close the game when it opens. It may take a minute."
	Start-Process -Wait -FilePath "FeralInstaller.exe" -WorkingDirectory "$HOME\Downloads"
}
else{
	Write-Output "Fer.al is already installed. Installing patch..."
}

#Install Patch
Invoke-WebRequest -Uri $PatchURL -OutFile $HOME\AppData\Local\Programs\WildWorks\Feral\Data\build\Fer.al_Data\sharedassets1.assets

Write-Output "Your client is now patched and you can log in to $ServerName"
Read-Host -Prompt "Start Fer.al as normal from the Desktop or Start Menu to play. You can now close this window."
