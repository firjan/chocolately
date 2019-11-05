<# chocolatey setup #> 
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1')); 
​
<# allowing globally confirmation #> 
choco feature enable -n=allowGlobalConfirmation;

<# programs to install #>
@(
"git"
,"netfx-4.8-devpack"
,"chrome"
,"dotnetcore-sdk"
,"cmder"
,"hyper"
,"archi"
,"wireshark"
,"sql-server-management-studio"
,"azure-data-studio"
,"docker-desktop"
,"jdk11"
,"nodejs-lts"
,"soapui"
,"postman"
,"notepadplusplus"
,"vim"
,"sublimetext2"
,"typora"
,"microsoft-teams") + ($pins = @("vscode")) | % { choco install $_ };

<# avoiding future upgrades of these following programs. #> $pins | % { choco pin add -n="$_" }; 
