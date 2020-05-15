<# chocolatey setup #> 
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1')); 
​
<# allowing globally confirmation #> 
choco feature enable -n=allowGlobalConfirmation;

<# programs to install #>
@(
"git"
,"netfx-4.8-devpack"
,"microsoft-edge"
,"dotnetcore-sdk"
,"visualstudio2019professional"
,"cmder"
,"hyper"
,"microsoft-windows-terminal"
,"azure-cli"
,"archi"
,"wireshark"
,"westwindwebsurge"
,"sql-server-management-studio"
,"azure-data-studio"
,"docker-desktop"
,"nodejs-lts"
,"postman"
,"notepadplusplus"
,"vim"
,"sublimetext3"
,"typora"
,"microsoft-teams") + ($pins = @("vscode")) | % { choco install $_ };

<# avoiding future upgrades of these following programs. #> $pins | % { choco pin add -n="$_" }; 
