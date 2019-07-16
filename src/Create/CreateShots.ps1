function createShots ([int] $weaponCount) {
    [Shot[]] $shots = $null

    for ($i = 0; $i -lt $weaponCount; $i++) {
        [Shot] $shot = New-Object Shot $null, $null
        $shots += @($shot)
    }

    return $shots
}