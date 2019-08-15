
Function Get-RandomAlphanumericString {
	
	[CmdletBinding()]
	Param (
        [float] $length
	)

	Begin{
	}

	Process{
        Write-Output ( -join ((0x30..0x39) + ( 0x41..0x5A) + ( 0x61..0x7A) | Get-Random -Count $length  | % {[char]$_}) )
	}	
}

$VariableLoops=Get-Random -Minimum 30 -Maximum 60

for($i = 0; $i -lt $VariableLoops; $i++)
{
$Data = Get-RandomAlphanumericString -length 1024
$WriteSpaces="Write-Output "
$Spaces=Get-Random -Maximum 50
$EncodedCommand = $WriteSpaces.PadLeft($Spaces).ToString()  + $Data.ToString()
$encoded = [Convert]::ToBase64String([Text.Encoding]::Unicode.GetBytes($EncodedCommand))
powershell.exe -win hid -enc $encoded
}