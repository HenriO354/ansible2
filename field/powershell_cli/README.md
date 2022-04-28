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

Get-Acl
Set-Acl
RunAs
```

## Package Management



## Environment Variables.