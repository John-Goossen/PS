Install-module WindowsAutopilotIntune

Install-Module -Name Microsoft.Graph.Intune

Install-Script -Name get-windowsautopilotinfocommunity
Install-Module -Name WindowsAutopilotIntuneCommunity


# Connect to your target tenant using the following command:
Connect-AutopilotIntune

Connect-MSGraph


Connect-MgGraph -Scopes "User.Read.All"

# Extract the Autopilot profile configuration using the following:


Get-AutopilotProfile

Get-AutopilotProfile | ConvertTo-AutopilotconfigurationJSON | Out-File -FilePath "C:\Intune\InstallAutopilotConfiguration\AutopilotConfigurationFile.json" -Encoding ASCII

# If you have multiple profiles, you can use 
Get-AutopilotProfile -ID %ID%
# to ensure you only capture the required configuration



Invoke-RestMethod -Uri https://raw.githubusercontent.com/andrew-s-taylor/WindowsAutopilotInfo/main/get-windowsautopilotinfo.ps1 -OutFile "C:\Users\John.Goossen\source\VSCode\PS\get-windowsautopilotinfo.ps1"