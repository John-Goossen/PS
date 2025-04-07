# Autopilot JSON file name
$AutopilotJSON = "AutopilotConfigurationFile.json"
$JSONDropDirectory = (Join-Path -Path $env:windir -ChildPath "Provisioning\Autopilot")
Copy-Item -Path $AutopilotJSON -Destination $JSONDropDirectory
