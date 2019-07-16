function createUiSeperator {
    $seperator = ""
    $seperatorChar = "-"

    for ($i = 0; $i -lt $windowWidth; $i++) {
        $seperator = $seperator + $seperatorChar
    }

    return $seperator
}

function writeUiInfo ([string] $spaceshipName, [int] $lives, [int] $credits) {
    $windowWidth = $Host.UI.RawUI.WindowSize.Width
    $info = ""

    Write-Host "|" -NoNewline -ForegroundColor DarkGray
    Write-Host "    " $spaceshipName "    " -NoNewline -ForegroundColor White
    $info = $info + "|     " + $spaceshipName + "     "

    Write-Host "|" -NoNewline -ForegroundColor DarkGray
    Write-Host "     " -NoNewline
    $info = $info + "|     "
    for ($i = 0; $i -lt $lives; $i++) {
        Write-Host "<3" -NoNewline -ForegroundColor Red -BackgroundColor DarkRed
        Write-Host " " -NoNewline
        $info = $info + "<3 "
    }

    Write-Host "     " -NoNewline
    $info = $info + "     "
    $dottedCredits = dotNumber $credits
    Write-Host "|" -NoNewline -ForegroundColor DarkGray
    Write-Host "     " -NoNewline
    Write-Host "$" -NoNewline -ForegroundColor DarkGreen
    Write-Host $dottedCredits -NoNewline #-ForegroundColor DarkGreen
    Write-Host "     " -NoNewline
    Write-Host "|" -NoNewline -ForegroundColor DarkGray
    $info = $info + "|     $" + $dottedCredits + "     |"

    $remainingChars = $windowWidth - $info.Length
    for ($i = 1; $i -lt $remainingChars; $i++) {
        Write-Host " " -NoNewline
        $info = $info + " "
    }

    Write-Host "|" -ForegroundColor DarkGray -NoNewline
    
    $info = $info + "|"
}