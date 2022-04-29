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
```

## Package Management



## Environment Variables.