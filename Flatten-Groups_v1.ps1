#Setup logging
$myLogs = "C:\psWork\logs"
Set-Location -Path $myLogs
$Log = (Get-Date).ToString("yyyy-MM-dd_HHmm") + "_Flatten-Groups_v1.log"
Start-Transcript -Path "$myLogs\$Log"


# Import the Active Directory module
Import-Module ActiveDirectory

# Get all AD groups with their email addresses
$allgroups = Get-ADGroup -Filter * -Property mail | Select-Object Name, mail, SamAccountName

# $allgroups = Get-ADGroup -Filter * -SearchBase "OU=.NoSync,DC=TABITHA,DC=ORG" -Property mail | Select-Object Name, mail, SamAccountName

# filter for only those that have email addresses
#$mailgroups = $allgroups | Where-Object { $_.mail -ne $null } | Select-Object Name, mail, SamAccountName

# Select All Groups
$mailgroups = $allgroups | Select-Object Name, mail, SamAccountName

$mailgroups.ForEach({
    $thisgroup = $_.SamAccountName
    $thisgroupsmembers = Get-ADGroupMember $_.SamAccountName -Recursive | Select-Object Name, SamAccountName
    $thisgroupsgroups =  Get-ADGroupMember $_.SamAccountName | Where-Object { $_.objectClass -eq 'group' } | Select-Object Name, SamAccountName
    Write-Host "╔═══════════════════════════════════════════════"
    Write-Host "║ $thisgroup"
    Write-Host "╟───────────────────────────────────────────────"
    foreach ($m in $thisgroupsmembers){
        $mSam = $m.SamAccountName
        Write-Host "║  $mSam"
        # Add this user to the group directly.
        Add-ADGroupMember -Identity $thisgroup -Members $mSam
    }
    Write-Host "╟───────────────────────────────────────────────"
    foreach ($g in $thisgroupsgroups){
        $gSam = $g.SamAccountName
        Write-Host "â•‘  $gSam"
        # Remove this group from the group
        Remove-ADGroupMember -Identity $thisgroup -Members $gSam -Confirm:$false
    }
    Write-Host "╚═══════════════════════════════════════════════"
    Write-Host ""
    Write-Host ""
    
})


# close out the log file logging
Stop-Transcript
