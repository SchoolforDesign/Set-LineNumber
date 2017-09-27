
<#PSScriptInfo

.VERSION 1.0

.GUID 24cf0ce6-b122-400a-a5da-2b6a4b2344ae

.AUTHOR school

.COMPANYNAME 

.COPYRIGHT 

.TAGS 

.LICENSEURI 

.PROJECTURI 

.ICONURI 

.EXTERNALMODULEDEPENDENCIES 

.REQUIREDSCRIPTS 

.EXTERNALSCRIPTDEPENDENCIES 

.RELEASENOTES


#>

<# 

.DESCRIPTION 
 You can use this function to set a lines for a file by easy and detailed parameters 

#> 

Param()


<#
.SYNOPSIS
Set a line number for each lines of a file
.DESCRIPTION
You can use this function to set a lines for a file by easy and detailed parameters
.EXAMPLE
PS C:\> Set-LineNumber -Path "D:\test.txt"
1 : 119.46.110.17:8080
2 : 106.3.40.249:8081
3 : 109.87.146.155:80
4 : 112.95.241.76:80
5 : 114.80.136.112:7780
6 : 115.28.213.143:8000
7 : 116.213.211.130:80
8 : 117.59.217.236:843
9 : 209.97.203.60:8080
10 : 209.97.203.64:8080
11 : 210.73.220.18:8088
12 : 211.151.13.22:81
13 : 211.151.50.179:81
14 : 61.174.9.96:8080
15 : 69.10.137.138:3128
16 : 69.10.137.139:3128
17 : 75.127.5.214:8080
18 : 109.87.146.155:80
.EXAMPLE
PS C:\> Set-LineNumber -Path "D:\test.txt" -StopAtLine 3 -NumbersSign "-" -RemoveSpaces $false
1 - 119.46.110.17:8080
2 - 106.3.40.249:8081
3 - 109.87.146.155:80
.EXAMPLE
PS C:\> Set-LineNumber -Path "D:\test.txt" -StopAtLine 8 -NumbersSign "-" -RemoveSpaces $false -StartAt 5
5 - 119.46.110.17:8080
6 - 106.3.40.249:8081
7 - 109.87.146.155:80
8 - 112.95.241.76:80
.EXAMPLE
Set-LineNumber -Path "D:\test.txt" -StopAtLine 3 -NumbersSign "-" -RemoveSpaces $false -StartAt 5 -OutFile "c:\testout.txt"
.NOTES
If you use -StopLine and -StartAt parameters at the same time, becerful the -StartAt parameter can tell the lines number which is created by the function. 
.LINK
https://twitter.com/SchoolforDesign
#>

function Set-LineNumber(){
    
[CmdletBinding()] param(
        
        [Parameter(Position = 0, Mandatory = $true)]
        [Alias('UID', 'File', 'FilePath')]
        [String]
        $Path,

        [Parameter(Position = 1, Mandatory = $false)]
        [Alias('StopLine', 'atLine')]
        [Int32]
        $StopAtLine,

        [Parameter(Position = 2, Mandatory = $false)]
        [Alias('NumsSign')]
        [String]
        $NumbersSign = ":",
        
        [Parameter(Position = 3, Mandatory = $false)]
        [Boolean]
        $RemoveSpaces = $false,

        [Parameter(Position = 4, Mandatory = $false)]
        [Int32]
        $StartAt = 1,
        
        [Parameter(Position = 5, Mandatory = $false)]
        $OutFile = $null
)

$filePathtrue = Get-Content $Path

$nm = $StartAt - 1;

$out = :linenumsloop ForEach ($mainfile in $filePathtrue){

    $nums = ($nm+=1)
    if($RemoveSpaces -eq $true){
      $rmvsp = Write-Output "$nums$NumbersSign$mainfile"
      $rmvsp

    }else{
      $ntrmvsp = Write-Output $nums" "$NumbersSign" "$mainfile
      $ntrmvsp
    }
    
    if($StopAtLine){

    if ($nm -eq $StopAtLine){
        
        break linenumsloop
    }

 }  
}


if($OutFile -ne $null){
    $out | Out-File $OutFile -Force
}else{
    $out
}

Clear-Variable nm, nums

}













