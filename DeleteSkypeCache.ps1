# Preliminary work on how to solve various issues with Skype 4 business 

param(
	[switch]$WhatIf
	)

$UserProfileDirs = (GCI C:\Users).FullName
$LyncPath = "\AppData\Local\Microsoft"
C:\Windows\System32\taskkill /im lync.exe
Set-Itemproperty -path 'HKCU:\Software\Microsoft\Office\16.0\Lync' -Name 'EnableWAM' -value '1'
Foreach ($obj in $UserProfileDirs)
	{
	$CurrentUserProfileDir = $obj+$LyncPath
	$LyncDirs += (GCI -Recurse $CurrentUserProfileDir -ea SilentlyContinue | ? { $_.FullName -like "*sip_*" -and $_.Attributes -eq "Directory" }).FullName
	Foreach ($dir in $LyncDirs)
		{
		If ($dir)
			{
			if ($WhatIf)
				{
				Remove-Item $dir -Recurse -Force -Confirm:$false -EA SilentlyContinue -WhatIf
				}
			Else
				{
				Remove-Item $dir -Recurse -Force -Confirm:$false -EA SilentlyContinue
				}
				}
		}
	}
$GetProcessJob = Start-Job -ScriptBlock {Start-process lync.exe}
Wait-Job $GetProcessJob
$GetProcessResult = Receive-Job -Job $GetProcessJob
##Wait-Event -SourceIdentifier "ProcessStarted" -Timeout 10
Set-Itemproperty -path 'HKCU:\Software\Microsoft\Office\16.0\Lync' -Name 'EnableWAM' -value '0'
