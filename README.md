#How to use
1. Clone the repository to the server you're setting up
2. Create a new file in the same directory as the scripts called "folders.txt". Each line in this file is a folder that will be tidied up. Some examples of folders you might want to clean up - IIS logs, Sitecore logs, Temporary ASP.Net files. 
3. Make sure you have allowed scripts to run in Powershell - `Set-ExecutionPolicy Unrestricted`
4. Run `Execute.ps1` in Powershell.

You'll probably want to do this as a scheduled task. 
