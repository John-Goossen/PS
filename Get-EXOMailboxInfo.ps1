Connect-ExchangeOnline

$Results=@()
$EXOMailboxes = Get-EXOMailbox -ResultSize unlimited -Properties RecipientTypeDetails, RetentionPolicy, IssueWarningQuota, ProhibitSendQuota, ProhibitSendReceiveQuota, UseDatabaseQuotaDefaults
$EXOMailboxCount = $EXOMailboxes.Count
$i = 1
$EXOMailboxes | ForEach-Object {
    $i++
    $mbx = $_
    $mbs = Get-EXOMailboxStatistics -Identity $_.UserPrincipalName -Properties TotalDeletedItemSize, TotalItemSize
    Write-Progress -Activity "Processing $mbx" -Status "$i of $EXOMailboxCount completed"
    $Results += New-Object PSObject -Property @{
        UserPrincipalName = $mbx.UserPrincipalName
        DisplayName = $mbx.DisplayName
        RecipientTypeDetails = $mbx.RecipientTypeDetails
        RetentionPolicy = $mbx.RetentionPolicy
        IssueWarningQuota = $mbx.IssueWarningQuota
        ProhibitSendQuota = $mbx.ProhibitSendQuota
        ProhibitSendReceiveQuota = $mbx.ProhibitSendReceiveQuota
        UseDatabaseQuotaDefaults = $mbx.UseDatabaseQuotaDefaults
        TotalDeletedItemSize = $mbs.TotalDeletedItemSize
        TotalItemSize = $mbs.TotalItemSize
    }
    $Results | Export-Csv "exomailboxinfo.csv" -NoTypeInformation
}

