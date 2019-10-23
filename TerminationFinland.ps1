# Simple finnish user termination script for Atea Global Service
## TODO : Add some checks and stop the script in the event of a typo. 

cls
Import-module activedirectory
$j=Read-Host "Enter the samaccountname" 
$k=Read-Host "Enter the account case for terminated user"
$l=Read-Host "Enter the month for termination"
$month = ($l)
$ou = "OU=Users Disabled,OU=FI,OU=Country,DC=one,DC=local"
$ou2 = 'OU=' + $month + ',' + $ou
$i = Get-ADUser $j -Properties info | %{ $_.info}  
Set-ADUser $j -Replace @{info="$($i) `r`n ($k) - Termination"} 
$jgroups = Get-aduser $j -Properties MemberOf
ForEach ($Group in $jgroups.memberof)
{
	Get-ADGroup $Group | Remove-ADGroupMember -confirm:$false -members $j
	}
Add-ADGroupMember -Identity DKHOS-SG-Stopped_Employees -members $j
$path = (get-aduser $j).DistinguishedName
Move-ADObject -Identity $path -TargetPath "$ou2" 
Disable-adaccount $j
