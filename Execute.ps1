Import-Module -Force $PSScriptRoot\Maintenance-Helpers

Get-Content $PSScriptRoot\folders.txt | ForEach-Object {Remove-FilesOlderThan $_ -days 7}
 
