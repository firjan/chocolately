<# chocolatey setup #> 
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1')); 
​
<# allowing globally confirmation #> 
choco feature enable -n=allowGlobalConfirmation;

<# programs to install #>
@(
"git"
,"netfx-4.7.2-devpack"
,"chrome"
,"cs-script"
,"dotnetcore-sdk"
,"cmder"
,"archi"
,"nuget.commandline"
,"dotnetcore-runtime"
,"dotnetcore-windowshosting"
,"visualstudio2019buildtools"
,"aspnetcore-runtimepackagestore"
,"sql-server-management-studio"
,"jdk11"
,"nodejs-lts"
,"soapui"
,"postman"
,"notepadplusplus") + ($pins = @("vscode", "github-desktop")) | % { choco install $_ };

<# avoiding future upgrades of these following programs. #> $pins | % { choco pin add -n="$_" }; 
