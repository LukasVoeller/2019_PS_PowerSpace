function moveStarfield ([Star[]] $stars, [int] $movementType) {
    $windowWidth = $Host.UI.RawUI.WindowSize.Width
    $windowHeight = $Host.UI.RawUI.WindowSize.Height

    if ($movementType -eq 1) {
        for ($i = 1; $i -le $windowHeight; $i++) {
            if ($stars[$i].pos -ne $null) {
                $stars[$i].pos = $stars[$i].pos - $stars[$i].moveSpeed
            }
        }
    } elseif ($movementType -eq 2) {                                                # Funky star movement
        for ($i = 1; $i -le $windowHeight; $i++) {              
            $rand = Get-Random -Minimum 1 -Maximum 4

            if ($rand -eq 1) {
                if ($stars[$i].pos -ne $null) {
                    $stars[$i].pos = $stars[$i].pos - 1
                }
            }
        }
    }
}