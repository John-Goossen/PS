# https://learn.microsoft.com/en-us/autopilot/existing-devices


Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force
Install-Module -Name WindowsAutopilotIntune -MinimumVersion 5.4.0 -Force
Install-Module -Name Microsoft.Graph.Groups -Force
Install-Module -Name Microsoft.Graph.Authentication -Force
Install-Module -Name Microsoft.Graph.Identity.DirectoryManagement -Force

Import-Module -Name WindowsAutopilotIntune -MinimumVersion 5.4
Import-Module -Name Microsoft.Graph.Groups
Import-Module -Name Microsoft.Graph.Authentication
Import-Module -Name Microsoft.Graph.Identity.DirectoryManagement



Connect-MgGraph -Scopes "Device.ReadWrite.All", "DeviceManagementManagedDevices.ReadWrite.All", "DeviceManagementServiceConfig.ReadWrite.All", "Domain.ReadWrite.All", "Group.ReadWrite.All", "GroupMember.ReadWrite.All", "User.Read"


Get-AutopilotProfile | ConvertTo-AutopilotconfigurationJSON | Out-File -FilePath "C:\Intune\InstallAutopilotConfiguration\AutopilotConfigurationFile.json" -Encoding ASCII

