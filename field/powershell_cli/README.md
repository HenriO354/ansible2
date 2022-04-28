# Powershell

PowerShell is a task automation tool made up of a command-line shell, a scripting language, and a configuration management framework. PowerShell is based on 
Windows operating system but can also run on linux and macOs.  
Unlike *most shells that only accept and return text*, Powershell accepts and 
return **.NET objects**.

## Quick start

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

- Navigation.
- File operations.
- Permissions.
- Package Management.
- Environment Variables.