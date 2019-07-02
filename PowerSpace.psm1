function Start-PowerSpace {
    function createStars {
        $windowWidth = $Host.UI.RawUI.WindowSize.Width
        $windowHeight = $Host.UI.RawUI.WindowSize.Height
        [Star[]] $stars = $null

        for ($i = 0; $i -lt $windowHeight; $i++) {
            $pos = Get-Random -Minimum 1 -Maximum ($windowWidth+1)                      # Random number from 1-120
            $star = New-Object Star($pos)
            $stars += @($star)
        }
    
        return $stars
    }

    function createStarfield ([Star[]] $stars, [Spaceship] $spaceship, [Shot] $shot) {
        $windowWidth = $Host.UI.RawUI.WindowSize.Width
        $windowHeight = $Host.UI.RawUI.WindowSize.Height
        $starfield = ""
    
        for ($i = 1; $i -le $windowHeight - 3; $i++) {                                  # -2 so the last line ist the command indicator "_"
            $starline = createStarline $stars[$i] $spaceship $shot $i
            $starfield = $starfield + $starline
        }
    
        return $starfield
    }

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

    function moveShot ([Shot] $shot) {
        $windowWidth = $Host.UI.RawUI.WindowSize.Width

        if ($shot -ne $null) {
            if ($shot.x -ge $windowWidth) {
                Remove-Variable shot
            } elseif ($shot.x -lt $windowWidth) {
                $shot.x = $shot.x + $shot.moveSpeed
            }
        }
    }

    function createSeperator {
        $seperator = ""
        $seperatorChar = "-"

        for ($i = 0; $i -lt $windowWidth; $i++) {
            $seperator = $seperator + $seperatorChar
        }

        return $seperator
    }

    function setWindowSize {
        $pshost = get-host
        $pswindow = $pshost.ui.rawui

        if ($pswindow.windowsize.Width -lt 120) {
            $newsize = $pswindow.buffersize
            $newsize.height = 3000
            $newsize.width = 120
            $pswindow.buffersize = $newsize
        }
        
        $newsize = $pswindow.windowsize
        $newsize.height = 40
        $newsize.width = 120
        $pswindow.windowsize = $newsize
    }

    function gameLoop () {
        $windowHeightStart = $Host.UI.RawUI.WindowSize.Height - 5
        $halfWindowHeightStart = $windowHeightStart / 2
        $shipStartY = [math]::Round($halfWindowHeightStart)
        $shipStartX = 10

        [Star[]] $stars = createStars
        [Spaceship] $spaceship = New-Object Spaceship "Jet Engine I", $shipStartX, $shipStartY
        [shot] $shot

        while ($true) {
            $windowWidth = $Host.UI.RawUI.WindowSize.Width
            $windowHeight = $Host.UI.RawUI.WindowSize.Height

            $starfield = createStarfield $stars $spaceship $shot            # Update
            Write-Host $starfield                                           # Draw
            moveStarfield $stars 1                                          # Move stars
            moveShot $shot                                                  # Move Shot
    
            $seperator = createSeperator                                    # Draw Seperator and Footer
            Write-Host $seperator
            if (-not $debug) {
                Write-Host "Energy:[xxx       ]   Credits: 1000c   Level: Lorem"
            } else {
                Write-Host "Stars:" $stars.Length "Ship X:" $spaceship.x "Ship Y:" $spaceship.y
            }

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
                    if (($spaceship.y + $spaceship.height) -lt $windowHeight - 1) {
                        $spaceship.y = $spaceship.y + 1
                    }
                }
                if ($x.Key -eq "Space") {
                    $shot = New-Object Shot(($spaceship.x + $spaceship.width), ($spaceship.y + $spaceship.weaponPos[$weaponCount - 1]))
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
            Clear-Host
        }
    }

    # -------------------------------- MAIN ---------------------------------
    . "$PSScriptRoot\src\CreateStarline.ps1"
    . "$PSScriptRoot\src\Classes.ps1"
    $debug = $false
    $fps = 10

    gameLoop
}