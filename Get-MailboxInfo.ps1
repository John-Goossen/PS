# Connect to Exchange Online
$UserCredential = Get-Credential
Connect-ExchangeOnline #-UserPrincipalName $UserCredential.UserName -Password $UserCredential.GetNetworkCredential().Password

# Get the last login time for all mailboxes
Get-Mailbox -ResultSize Unlimited | Get-MailboxStatistics | Select-Object DisplayName, LastLogonTime | Sort-Object LastLogonTime -Descending

# Disconnect from Exchange Online
Disconnect-ExchangeOnline -Confirm:$false
