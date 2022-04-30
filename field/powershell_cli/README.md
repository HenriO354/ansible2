# Powershell

PowerShell is a task automation tool made up of a command-line shell, a scripting language, and a configuration management framework. PowerShell is based on 
Windows operating system but can also run on linux and macOs.  
Unlike *most shells that only accept and return text*, Powershell accepts and 
return **.NET objects**.

# Quick start

```powershell

# Check powershell version
$PSVersionTable

# Check current Execution Policy: Restricted or RemoteSigned 
Get-ExecutionPolicy

# PowerShell scripts can't be run at all when the execution policy is set to Restricted.
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned

# The three core commands in powershell are:

Get-Command                                  # see a list of all command
Get-Help                                     # get help for any command
Get-Member                                   # gets the members, the properties and methods, of objects
```

## Navigation

```powershell

Get-Location                                 # display working directory
Get-ChildItem                                # display directory's content
Set-Location                                 # Move to a specific directory
```

## File operations

```powershell

New-Item                                     # create new file
Get-Content                                  # display file content
Copy-Item                                    # copy file
Move-Item                                    # move file
Remove-Item                                  # remove file
```

## Permissions

```powershell
# create a file
New-Item -Path .\myfile.txt -Value 'Hello World'

# Check ownership
$Acl = Get-Acl -Path .\myfile.txt
$Acl.Owner

# Check group
$Acl.Group

# Run as administrator
start-process powershell -verb runas

# Enable administrator account
Get-LocalUser -Name Administrator | Enable-LocalUser

# Define the owner account
$Admin = New-Object -TypeName System.Security.Principal.NTAccount -ArgumentList 'BUILTIN\Administrators'

# Change the file owner to the built-in administrator
$Acl.SetOwner($Admin)                                 # Update the in-memory ACL
$Acl.Owner
Set-Acl -Path .\myfile.txt -AclObject $Acl            # make changes persistent

# Check file permission
$Acl.Access
```

## Package Management

Open PowerShell as administrator.

```powershell

# Installing the PSWindowsUpdate Module
Install-Module -Name PSWindowsUpdate -Force

# Import PSWindowsUpdate Module
Import-Module PSWindowsUpdate

# Check all available command for PSWindowsUpdate module
Get-Command -Module PSWindowsUpdate

# Checking for Available Windows Updates
Get-WindowsUpdate

# show the list of available update services
Get-WUServiceManager

ServiceID                            IsManaged IsDefault Name
---------                            --------- --------- ----
7971f918-a847-4430-9279-4a52d1efe18d False     True      Microsoft Update
8b24b027-1dee-babb-9a95-3517dfb9c552 False     False     DCat Flighting Prod
855e8a7c-ecb4-4ca3-b045-1dfa50104289 False     False     Windows Store (DCat Prod)
9482f4b4-e343-43b6-b170-9a65bc822c77 False     False     Windows Update

# Install chocolatey
Install-Package -Name Chocolatey

# Check all packages and modules installed
Get-Package

Name                           Version          Source                           ProviderName
----                           -------          ------                           ------------
chocolatey                     0.0.79           https://www.powershellgallery.c… PowerShellGet
PSWindowsUpdate                2.2.0.3          https://www.powershellgallery.c… PowerShellGet

# Install VLC package from Chocolatey
choco install vlc

# Uninstall VLC
choco uninstall vlc -y

```

## Century Game

This is a powershell training. There are 16 levels (from 0 to 15), for each level
you need to connect to remote server via SSH. Then follow some instructions that
can be found in this [link](https://underthewire.tech/century).  
The credentials for the level 0 are provided. But you need to successfully complete
the previous level to get credentials for the next level.

### Century 1 -> 2

```powershell

PS C:\users\century1\desktop> $PSVersionTable.BuildVersion

Major  Minor  Build  Revision
-----  -----  -----  --------
10     0      14393  4583    
```
password=10.0.14393.4583

### Century 2 -> 3

```powershell

PS C:\users\century2\desktop> dir


    Directory: C:\users\century2\desktop


Mode                LastWriteTime         Length Name                                                  
----                -------------         ------ ----                                                  
-a----        8/30/2018   3:29 AM            693 443 
```
password=invoke-webrequest443

### Century 3 -> 4

```powershell

PS C:\users\century3\desktop> (Get-Item -File).Count                                                            
123
```
password=123

### Century 4 -> 5

```powershell

PS C:\users\century4\desktop> dir


    Directory: C:\users\century4\desktop


Mode                LastWriteTime         Length Name                                                  
----                -------------         ------ ----                                                  
d-----         2/8/2022  10:35 PM                Can You Open Me                                       


PS C:\users\century4\desktop> dir '.\Can You Open Me'


    Directory: C:\users\century4\desktop\Can You Open Me


Mode                LastWriteTime         Length Name                                                  
----                -------------         ------ ----                                                  
-a----         2/8/2022  10:35 PM             24 5548  
```
password=5548

### Century 5 -> 6

```powershell

PS C:\users\century5\desktop> dir


    Directory: C:\users\century5\desktop


Mode                LastWriteTime         Length Name                                                  
----                -------------         ------ ----                                                  
-a----        8/30/2018   3:29 AM             54 3347  
```
password=underthewire3347

### Century 6 -> 7

```powershell

PS C:\users\century6\desktop> (Get-ChildItem -Directory).Count                                          
197
```
password=197

### Century 7 -> 8

```powershell

PS C:\users\century7\desktop> Get-ChildItem -Path 'C:\users\century7' -Filter *readme* -Recurse


    Directory: C:\users\century7\Downloads


Mode                LastWriteTime         Length Name                                                  
----                -------------         ------ ----                                                  
-a----        8/30/2018   3:29 AM              7 Readme.txt                                            
-a----        2/12/2022   8:59 PM              2 Readme2.txt                                           


PS C:\users\century7\desktop> Get-Content -Path 'C:\users\century7\Downloads\Readme.txt'
7points
```
password=7points

### Century 8 -> 9

```powershell

PS C:\users\century8\desktop> dir


    Directory: C:\users\century8\desktop


Mode                LastWriteTime         Length Name                                                  
----                -------------         ------ ----                                                  
-a----        8/30/2018   3:33 AM          15858 unique.txt                                            


PS C:\users\century8\desktop> (Get-Content .\unique.txt).Length
696
```
password=696

### Century 9 -> 10

```powershell

PS C:\users\century9\desktop> dir


    Directory: C:\users\century9\desktop


Mode                LastWriteTime         Length Name                                                  
----                -------------         ------ ----                                                  
-a----        8/30/2018   3:34 AM           2131 Word_File.txt                                         


PS C:\users\century9\desktop> (Get-Content .\Word_File.txt).Split(' ')[160]
pierid
```
password=pierid