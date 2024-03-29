function createJetEngineI {
    $name = "Jet Engine I"
    $hp = 3

    [String[]] $appearance = $null
    $appearance += @("   \--\")            # weaponPos/appearance 0
    $appearance += @("   JE-I[O]>")        # weaponPos/appearance 1
    $appearance += @("   /--/")            # weaponPos/appearance 2
    $weaponCount = 1
    [int[]] $weaponPos = $null
    $weaponPos += @(1)

    $windowHeightStart = $Host.UI.RawUI.WindowSize.Height - 5
    $halfWindowHeightStart = $windowHeightStart / 2
    $shipStartX = 10
    $shipStartY = [math]::Round($halfWindowHeightStart)

    [Spaceship] $spaceship = New-Object Spaceship $weaponCount, $weaponPos, $appearance, $name, $hp, $shipStartX, $shipStartY
    return $spaceship
}

function createJetEngineII {
    $name = "Jet Engine II"
    $hp = 4

    [String[]] $appearance = $null
    $appearance += @("   \---\")           # weaponPos/appearance 0
    $appearance += @("   JE-II\>")         # weaponPos/appearance 1
    $appearance += @("     [   [O]")       # weaponPos/appearance 2
    $appearance += @("   JE-II/>")         # weaponPos/appearance 3
    $appearance += @("   /---/")           # weaponPos/appearance 4
    $weaponCount = 2
    [int[]] $weaponPos = $null
    $weaponPos += @(1)
    $weaponPos += @(3)

    $windowHeightStart = $Host.UI.RawUI.WindowSize.Height - 5
    $halfWindowHeightStart = $windowHeightStart / 2
    $shipStartX = 10
    $shipStartY = [math]::Round($halfWindowHeightStart)

    [Spaceship] $spaceship = New-Object Spaceship $weaponCount, $weaponPos, $appearance, $name, $hp, $shipStartX, $shipStartY
    return $spaceship
}

function createJetEngineIII {
    $name = "Jet Engine III"
    $hp = 5

    [String[]] $appearance = $null
    $appearance += @("   \----\")          # weaponPos/appearance 0
    $appearance += @("   JE-III\>")        # weaponPos/appearance 1
    $appearance += @("     [    [O]")      # weaponPos/appearance 2
    $appearance += @("    JE-III-|>")      # weaponPos/appearance 3
    $appearance += @("     [    [O]")      # weaponPos/appearance 4
    $appearance += @("   JE-III/>")        # weaponPos/appearance 5
    $appearance += @("   /----/")          # weaponPos/appearance 6
    $weaponCount = 3
    [int[]] $weaponPos = $null
    $weaponPos += @(1)
    $weaponPos += @(3)
    $weaponPos += @(5)

    $windowHeightStart = $Host.UI.RawUI.WindowSize.Height - 5
    $halfWindowHeightStart = $windowHeightStart / 2
    $shipStartX = 10
    $shipStartY = [math]::Round($halfWindowHeightStart)

    [Spaceship] $spaceship = New-Object Spaceship $weaponCount, $weaponPos, $appearance, $name, $hp, $shipStartX, $shipStartY
    return $spaceship
}

function createHeavyCruiser {
    $name = "Heavy Cruiser"
    $hp = 10

    [String[]] $appearance = $null
    $appearance += @("     _______")                     # weaponPos/appearance 0
    $appearance += @("    / \\\___\________")            # weaponPos/appearance 1
    $appearance += @("     O |||___|___\\__\__")         # weaponPos/appearance 2
    $appearance += @("    \_///___/_|     \_\_\\-")      # weaponPos/appearance 3
    $appearance += @("    / \\\___\_|_____/_/_//-")      # weaponPos/appearance 4
    $appearance += @("     O |||___|___//__/")           # weaponPos/appearance 5
    $appearance += @("    \_///___/")                    # weaponPos/appearance 6
    $weaponCount = 2
    [int[]] $weaponPos = $null
    $weaponPos += @(3)
    $weaponPos += @(4)

    $windowHeightStart = $Host.UI.RawUI.WindowSize.Height - 5
    $halfWindowHeightStart = $windowHeightStart / 2
    $shipStartX = 10
    $shipStartY = [math]::Round($halfWindowHeightStart)

    [Spaceship] $spaceship = New-Object Spaceship $weaponCount, $weaponPos, $appearance, $name, $hp, $shipStartX, $shipStartY
    return $spaceship
}

function createWorm {
    $name = "Worm"
    $hp = 10

    [String[]] $appearance = $null
    $appearance += @("  _______         _\______   ")       # weaponPos/appearance 0
    $appearance += @(" / \\\___\--.---.-\    | _\  ")       # weaponPos/appearance 1
    $appearance += @("| O |||___| | | | |     \__|-")       # weaponPos/appearance 2
    $appearance += @(" \_///___/--^---^-/_______/  ")       # weaponPos/appearance 3
    $appearance += @("                   /         ")       # weaponPos/appearance 4
    $weaponCount = 1
    [int[]] $weaponPos = $null
    $weaponPos += @(2)

    $windowHeightStart = $Host.UI.RawUI.WindowSize.Height - 5
    $halfWindowHeightStart = $windowHeightStart / 2
    $shipStartX = 10
    $shipStartY = [math]::Round($halfWindowHeightStart)

    [Spaceship] $spaceship = New-Object Spaceship $weaponCount, $weaponPos, $appearance, $name, $hp, $shipStartX, $shipStartY
    return $spaceship
}