for($i = 0; $i -lt 10; $i++)
{
$Word = New-Object -ComObject Word.Application
$Word.Visible = $False
$Document = $Word.Documents.Add()
$Selection = $Word.Selection
$Random= Get-Random -Maximum 2048
$Content=-join ((65..90) + (97..122) | Get-Random -Count $Random | % {[char]$_})
$Selection.TypeParagraph()
$Selection.TypeText($Content)
$Selection.TypeParagraph()
$Selection.TypeParagraph()
$Selection.TypeText($Content)
$FileName=-join ((65..90) + (97..122) | Get-Random -Count 10 | % {[char]$_})
$FileName = $FileName + ".doc"
$Document.SaveAs([ref]$FileName,[ref]$SaveFormat::wdFormatDocument)
$word.Quit()
$null = [System.Runtime.InteropServices.Marshal]::ReleaseComObject([System.__ComObject]$word)
[gc]::Collect()
[gc]::WaitForPendingFinalizers()
Remove-Variable word
}