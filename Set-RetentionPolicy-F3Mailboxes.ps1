#Connect-ExchangeOnline
#Get-Mailbox -Identity "john.goossen@tabitha.org"

# Define the path to the CSV file
$csvPath = ".\F3Mailboxes.csv"

# Import the CSV file into an array
$dataArray = Import-Csv -Path $csvPath

# Display the array content
$dataArray.ForEach({
    Write-Host $_.F3Mailboxes

    Get-Mailbox -Identity $_.F3Mailboxes
})

