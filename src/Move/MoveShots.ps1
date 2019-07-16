function moveShots ([Shot[]] $shots) {
    $windowWidth = $Host.UI.RawUI.WindowSize.Width

    for ($i = 0; $i -lt $shots.Length; $i++) {
        if ($shots[$i].x -ne $null -and $shots[$i].y -ne $null) {
            if ($shots[$i].x -ge $windowWidth) {
                $shots[$i].x = $null
                $shots[$i].y = $null
                $shots[$i].fired = $false
            } elseif ($shots[$i].x -lt $windowWidth) {
                $shots[$i].x = $shots[$i].x + $shots[$i].moveSpeed
            }
        }
    }
}