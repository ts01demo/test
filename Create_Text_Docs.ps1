for($i = 0; $i -lt 10; $i++)
{
    $Random= Get-Random -Maximum 2048
    $Content=-join ((65..90) + (97..122) | Get-Random -Count $Random | % {[char]$_})
    $FileName=-join ((65..90) + (97..122) | Get-Random -Count 10 | % {[char]$_})
    $FileName = $FileName + ".txt"
    $Content | Out-File -FilePath .\$FileName
    
}