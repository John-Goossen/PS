$HeaderText = "This is the Header"
$Header = "║ $HeaderText"

$Header = $Header.PadRight(99, " ")
$Header = $Header + "║"

# Create a new StringBuilder object
$stringBuilder = [System.Text.StringBuilder]::new()

$stringBuilder.Append("")

$HorizontalLines = [string]::new("═", 98)
$FirstLine = "╔" + $HorizontalLines + "╗"
$SecondLine = "║ $HeaderText"
$SecondLine = $SecondLine.PadRight(99, " ") + "║"
$ThirdLine = "╚" + $HorizontalLines + "╝"





Write-Host $Header
