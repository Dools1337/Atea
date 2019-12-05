## Self-Elevating part
##
$ErrorActionPreference = 'silentlycontinue'

$Button = [Windows.MessageBoxButton]::YesNoCancel
$ErrorIco = [Windows.MessageBoxImage]::Error
$Ask = 'Do you want to run this as an Administrator?

        Select "Yes" to Run as an Administrator

        Select "No" to not run this as an Administrator
        
        Select "Cancel" to stop the script.'

If (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]'Administrator')) {
    $Prompt = [Windows.MessageBox]::Show($Ask, "Run as an Administrator or not?", $Button, $ErrorIco) 
    Switch ($Prompt) {
        #This will debloat Windows 10
        Yes {
            Write-Host "You didn't run this script as an Administrator. This script will self elevate to run as an Administrator and continue."
            Start-Process powershell.exe -ArgumentList ("-NoProfile -ExecutionPolicy Bypass -File `"{0}`"" -f $PSCommandPath) -Verb RunAs
            Exit
        }
        No {
            Break
        }
    }
}

## End of Self-Elevating Part

# Where we show that we like ASCII                                                                                                        
                                                                                                         
Write-host "               AAA         TTTTTTTTTTTTTTTTTTTTTTTEEEEEEEEEEEEEEEEEEEEEE               AAA             "             
Write-host "              A:::A        T:::::::::::::::::::::TE::::::::::::::::::::E              A:::A            " 
Write-host "             A:::::A       T:::::::::::::::::::::TE::::::::::::::::::::E             A:::::A           " 
Write-host "            A:::::::A      T:::::TT:::::::TT:::::TEE::::::EEEEEEEEE::::E            A:::::::A          " 
Write-host "           A:::::::::A     TTTTTT  T:::::T  TTTTTT  E:::::E       EEEEEE           A:::::::::A         " 
Write-host "          A:::::A:::::A            T:::::T          E:::::E                       A:::::A:::::A        " 
Write-host "         A:::::A A:::::A           T:::::T          E::::::EEEEEEEEEE            A:::::A A:::::A       " 
Write-host "        A:::::A   A:::::A          T:::::T          E:::::::::::::::E           A:::::A   A:::::A      " 
Write-host "       A:::::A     A:::::A         T:::::T          E:::::::::::::::E          A:::::A     A:::::A     " 
Write-host "     A:::::AAAAAAAAA:::::A        T:::::T          E::::::EEEEEEEEEE         A:::::AAAAAAAAA:::::A     "
Write-host "     A:::::::::::::::::::::A       T:::::T          E:::::E                  A:::::::::::::::::::::A   " 
Write-host "    A:::::AAAAAAAAAAAAA:::::A      T:::::T          E:::::E       EEEEEE    A:::::AAAAAAAAAAAAA:::::A  " 
Write-host "   A:::::A             A:::::A   TT:::::::TT      EE::::::EEEEEEEE:::::E   A:::::A             A:::::A " 
Write-host "  A:::::A               A:::::A  T:::::::::T      E::::::::::::::::::::E  A:::::A               A:::::A" 
Write-host " A:::::A                 A:::::A T:::::::::T      E::::::::::::::::::::E A:::::A                 A:::::A" 
Write-host "AAAAAAA                   AAAAAAATTTTTTTTTTT      EEEEEEEEEEEEEEEEEEEEEEAAAAAAA                   AAAAAAA"
Write-host ""
Write-host "" 
Write-host "Welcome to Atea Outlook Cleaning Tool (AOCT)" -ForegroundColor Yellow
Write-host "------------------------------------------" -ForegroundColor Yellow
Write-host "Closing Outlook and related processes and re-opening Outlook in safe mode" -ForegroundColor Yellow
Get-Process -Name 'outlook','OfficeClickToRun','OneNote' | Stop-Process -Force -ErrorAction $ErrorActionPreference
#taskkill /IM "outlook.exe" /F 
#taskkill /IM "OfficeClickToRun.exe" /F
start-Process -filepath "C:\Program Files (x86)\Microsoft Office\root\Office16\OUTLOOK.exe" /safe
Start-Sleep 5
Write-Host "Wait for Outlook to be completely opened before pressing any key ..." -ForegroundColor Green
Write-Host "Press any key to continue ....." -ForegroundColor Green
$x = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
Write-Host "Closing Outlook and re-opening normally..." -ForegroundColor Green
Get-Process -Name 'outlook' | Stop-Process -Force
#taskkill /IM "outlook.exe" /F
Start-Process -filepath "C:\Program Files (x86)\Microsoft Office\root\Office16\OUTLOOK.exe"
Start-Sleep 5
$challenge1 = Read-Host "Do you want to backup/repopulate outlook profile (Y/N) ?" 
$challenge1 = $challenge1.ToUpper()
if ($challenge1 -eq "N"){
Stop-Process -Id $PID
}elseif ($challenge1 -eq "Y"){
Write-Host "Stopping Outlook process"
try{
Get-Process -Name 'outlook','OfficeClickToRun','OneNote' | Stop-Process -Force -ErrorAction $ErrorActionPreference
Start-Sleep -Seconds 3
Write-Host "Outlook process succesfully stopped" -ForegroundColor Green
}catch{
echo $_
}
try{
$OutlookPath="$Env:USERPROFILE\AppData\Local\Microsoft" #getting outlook path
Rename-Item "$OutlookPath\Outlook" -NewName "Outlook.backup" -force -ErrorAction stop
Write-Verboe "Renamed Folder" -verbose
}catch{
echo $_
}
Start-Sleep -Seconds 1
Write-Host "Outlook profile folder renamed!" -ForegroundColor Green
}catch{
echo $_
}
Write-Host "Starting Outlook again..." -ForegroundColor Green
Start-Process -filepath "C:\Program Files (x86)\Microsoft Office\root\Office16\OUTLOOK.exe"

