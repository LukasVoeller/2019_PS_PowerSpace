
function createJetEngineI {
    $name = "Jet Engine I"
    $windowHeightStart = $Host.UI.RawUI.WindowSize.Height - 5
    $halfWindowHeightStart = $windowHeightStart / 2
    $shipStartX = 10
    $shipStartY = [math]::Round($halfWindowHeightStart)

    [String[]] $appearance = $null
    $appearance += @("\--\")            # weaponPos/appearance 0
    $appearance += @("JE-I[O]=")        # weaponPos/appearance 1
    $appearance += @("/--/")            # weaponPos/appearance 2

    $weaponCount = 1
    [int[]] $weaponPos = $null
    $weaponPos += @(1)

    [Spaceship] $spaceship = New-Object Spaceship $weaponCount, $weaponPos, $appearance, $name, $shipStartX, $shipStartY
    return $spaceship
}

function createJetEngineII {
    $name = "Jet Engine II"
    $windowHeightStart = $Host.UI.RawUI.WindowSize.Height - 5
    $halfWindowHeightStart = $windowHeightStart / 2
    $shipStartX = 10
    $shipStartY = [math]::Round($halfWindowHeightStart)

    [String[]] $appearance = $null
    $appearance += @("\---\")           # weaponPos/appearance 0
    $appearance += @("JE-II\=")         # weaponPos/appearance 1
    $appearance += @("  [   [O]")       # weaponPos/appearance 2
    $appearance += @("JE-II/=")         # weaponPos/appearance 3
    $appearance += @("/---/")           # weaponPos/appearance 4

    $weaponCount = 2
    [int[]] $weaponPos = $null
    $weaponPos += @(1)
    $weaponPos += @(3)

    [Spaceship] $spaceship = New-Object Spaceship $weaponCount, $weaponPos, $appearance, $name, $shipStartX, $shipStartY
    return $spaceship
}

function createJetEngineIII {
    $name = "Jet Engine III"
    $windowHeightStart = $Host.UI.RawUI.WindowSize.Height - 5
    $halfWindowHeightStart = $windowHeightStart / 2
    $shipStartX = 10
    $shipStartY = [math]::Round($halfWindowHeightStart)

    [String[]] $appearance = $null
    $appearance += @("\----\")          # weaponPos/appearance 0
    $appearance += @("JE-III\=")        # weaponPos/appearance 1
    $appearance += @("  [    [O]")      # weaponPos/appearance 2
    $appearance += @(" JE-III-|=")      # weaponPos/appearance 3
    $appearance += @("  [    [O]")      # weaponPos/appearance 4
    $appearance += @("JE-III/=")        # weaponPos/appearance 5
    $appearance += @("/----/")          # weaponPos/appearance 6

    $weaponCount = 3
    [int[]] $weaponPos = $null
    $weaponPos += @(1)
    $weaponPos += @(3)
    $weaponPos += @(5)

    [Spaceship] $spaceship = New-Object Spaceship $weaponCount, $weaponPos, $appearance, $name, $shipStartX, $shipStartY
    return $spaceship
}