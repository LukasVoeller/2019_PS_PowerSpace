function Start-PowerSpace {
    function gameLoop () {
        [Star[]] $stars = createStars
        [Spaceship] $spaceship = createJetEngineI
        [Shot[]] $shots = createShots $spaceship.weaponCount

        while ($true) {
            $windowWidth = $Host.UI.RawUI.WindowSize.Width
            $windowHeight = $Host.UI.RawUI.WindowSize.Height

            $starfield = createStarfield $stars $spaceship $shots 3         # Update, 3 = 2 for UI + 1 cmd indicator
            Write-Host $starfield                                           # Draw
            moveStarfield $stars 1                                          # Move stars, 1 for normal, 2 for funky
            moveShots $shots                                                # Move Shot
            changeAppearance $spaceship

            $seperator = createUiSeperator                                  # Draw Seperator and Footer
            Write-Host $seperator -NoNewline -ForegroundColor DarkGray
            writeUiInfo $spaceship.name 5 450000
            #Write-Host $seperator -NoNewline

            if ([console]::KeyAvailable) {                                  # Controls
                $x = [System.Console]::ReadKey()
    
                if ($x.Key -eq "LeftArrow") {
                    if ($spaceship.x -gt 1) {
                        $spaceship.x = $spaceship.x - 1
                    }
                }
                if ($x.Key -eq "RightArrow") {
                    if ($spaceship.x -lt ($windowWidth - $spaceship.width)) {
                        $spaceship.x = $spaceship.x + 1
                    }
                }
                if ($x.Key -eq "UpArrow") {
                    if ($spaceship.y -gt 1) {
                        $spaceship.y = $spaceship.y - 1
                    }
                }
                if ($x.Key -eq "DownArrow") {
                    if (($spaceship.y + $spaceship.height) -lt $windowHeight - 2) {
                        $spaceship.y = $spaceship.y + 1
                    }
                }
                if ($x.Key -eq "Enter") {
                    for ($i = 0; $i -lt $shots.Length; $i++) {
                        if ($shots[$i].fired -eq $false) {
                            $shots[$i].x = ($spaceship.x + $spaceship.width)
                            #$shots[$i].x = ($spaceship.x + $spaceship.appearance[$i].Length)
                            $shots[$i].y = ($spaceship.y + $spaceship.weaponPos[$i])
                            $shots[$i].fired = $true
                        }
                    }
                }
            }

            for ($i = 0; $i -lt $stars.Length-1; $i++) {                    # Spawn new stars
                if ($stars[$i].pos -lt 1) {
                    $spawnStar = Get-Random -Minimum 1 -Maximum 50
        
                    if ($spawnStar -eq 1) {
                        $stars[$i] = $windowWidth
                    }
                }
            }

            if ($windowHeight -gt 40) {                                     # Add new stars if the height of the console window increases
                if ($windowHeight -gt $stars.Length) {
                    $pos = Get-Random -Minimum 0 -Maximum $windowWidth
                    $star = New-Object Star($pos)
                    $stars += @($star)
                }
            }

            Start-Sleep -Milliseconds (1000 / $fps)
            if ($debug -eq $false) {
                Clear-Host
            }
        }
    }

    # -------------------------------- MAIN ---------------------------------
    . "$PSScriptRoot\src\Create\CreateShots.ps1"
    . "$PSScriptRoot\src\Create\CreateSpaceships.ps1"
    . "$PSScriptRoot\src\Create\CreateStarfield.ps1"
    . "$PSScriptRoot\src\Create\CreateStarline.ps1"
    . "$PSScriptRoot\src\Create\CreateStars.ps1"
    . "$PSScriptRoot\src\Move\MoveShots.ps1"
    . "$PSScriptRoot\src\Move\MoveStarfield.ps1"
    . "$PSScriptRoot\src\Classes.ps1"
    . "$PSScriptRoot\src\Userinterface.ps1"
    . "$PSScriptRoot\src\Utility.ps1"
    . "$PSScriptRoot\src\changeSpaceships.ps1"

    $debug = $false
    $fps = 100
    gameLoop

    #TODO
    #Add Timer and slower Stars
    #Add Asteroids

<#
    [Star[]] $stars = createStars

    while ($true) {
        $windowWidth = $Host.UI.RawUI.WindowSize.Width
        $windowHeight = $Host.UI.RawUI.WindowSize.Height

        $starfield = createStarfield $stars $spaceship $shot 1          # Update    1 for cmd indicator
        Write-Host $starfield                                           # Draw
        moveStarfield $stars 1                                          # Move stars

        for ($i = 0; $i -lt $stars.Length-1; $i++) {                    # Spawn new stars
            if ($stars[$i].pos -lt 1) {
                $spawnStar = Get-Random -Minimum 1 -Maximum 50
    
                if ($spawnStar -eq 1) {
                    $stars[$i] = $windowWidth
                }
            }
        }

        if ($windowHeight -gt 40) {                                     # Add new stars if the height of the console window increases
            if ($windowHeight -gt $stars.Length) {
                $pos = Get-Random -Minimum 0 -Maximum $windowWidth
                $star = New-Object Star($pos)
                $stars += @($star)
            }
        }

        Start-Sleep -Milliseconds (1000 / $fps)
        Clear-Host
    }
#>

}