function createJetEngineII {
    $name = "Jet Engine II"
    $windowHeightStart = $Host.UI.RawUI.WindowSize.Height - 5
    $halfWindowHeightStart = $windowHeightStart / 2
    $shipStartX = 10
    $shipStartY = [math]::Round($halfWindowHeightStart)

    [String[]] $appearance = $null
    $appearance += @("JE-II\=")         # weaponPos/appearance 0
    $appearance += @(" [   [O]=")       # weaponPos/appearance 1
    $appearance += @("JE-II/=")         # weaponPos/appearance 2

    $weaponCount = 3
    [int[]] $weaponPos = $null
    $weaponPos += @(0)
    $weaponPos += @(1)
    $weaponPos += @(2)

    [Spaceship] $spaceship = New-Object Spaceship $weaponCount, $weaponPos, $appearance, $name, $shipStartX, $shipStartY
    return $spaceship
}