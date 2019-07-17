function createStars ($bottomSpace) {
    $windowWidth = $Host.UI.RawUI.WindowSize.Width
    $windowHeight = $Host.UI.RawUI.WindowSize.Height

    [Star[]] $stars = $null

    for ($i = 0; $i -lt ($windowHeight - $bottomSpace); $i++) {
        $pos = Get-Random -Minimum 1 -Maximum ($windowWidth + 1)                      # Random number from 1-120
        $star = New-Object Star $pos
        $stars += @($star)
    }

    return $stars
}