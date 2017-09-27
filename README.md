# Set-LineNumber
You can use this function to set a lines for a file by easy and detailed parameters
<br />Vist Script in <a href="https://www.powershellgallery.com/packages/Set-LineNumber/1.0/DisplayScript">PowerShellGallery.com</a>
#### Examles:
```powershell
PS C:\> Set-LineNumber -Path "D:\test.txt"
PS C:\> Set-LineNumber -Path "D:\test.txt" -StopAtLine 3 -NumbersSign "-" -RemoveSpaces $false
PS C:\> Set-LineNumber -Path "D:\test.txt" -RemoveSpaces $false -StartAt 0 -OutFile "c:\testout.txt"
PS C:\> Set-LineNumber -Path "D:\test.txt" -StopAtLine 8 -NumbersSign "-" -RemoveSpaces $false -StartAt 5
