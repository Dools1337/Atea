import-Module ActiveDirectory  
$copy = Read-host "Enter username to copy from: "  
$paste  = Read-host "Enter username to copy to: "  
Get-ADuser -identity $copy -properties memberof | select-object memberof -expandproperty memberof | Add-AdGroupMember -Members $paste
