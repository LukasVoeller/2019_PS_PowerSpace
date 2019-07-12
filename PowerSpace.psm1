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

    function createStarfield ([Star[]] $stars, [Spaceship] $spaceship, [Shot] $shot, [int] $bottomSpace) {
        $windowWidth = $Host.UI.RawUI.WindowSize.Width
        $windowHeight = $Host.UI.RawUI.WindowSize.Height
        $starfield = ""
    
        for ($i = 1; $i -le ($windowHeight - $bottomSpace); $i++) {                                  # -2 so there is room for the UI and the comandline indicator "_"
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
        Write-Host "    " $spaceshipName "    " -NoNewline
        $info = $info + "|     " + $spaceshipName + "     "

        Write-Host "|" -NoNewline -ForegroundColor DarkGray
        Write-Host "     " -NoNewline
        $info = $info + "|     "
        for ($i = 0; $i -lt $lives; $i++) {
            Write-Host "<3 " -NoNewline -ForegroundColor Red
            $info = $info + "<3 "
        }

        Write-Host "     " -NoNewline
        $info = $info + "     "
        $dottedCredits = dotNumber $credits
        Write-Host "|" -NoNewline -ForegroundColor DarkGray
        Write-Host "     " -NoNewline
        Write-Host "$" -NoNewline -ForegroundColor Green
        Write-Host $dottedCredits -NoNewline -ForegroundColor White
        Write-Host "     " -NoNewline
        Write-Host "|" -NoNewline -ForegroundColor DarkGray
        $info = $info + "|     $" + $dottedCredits + "     |"

        $remainingChars = $windowWidth - $info.Length
        for ($i = 1; $i -lt $remainingChars; $i++) {
            Write-Host " " -NoNewline
            $info = $info + " "
        }
        Write-Host "|" -ForegroundColor DarkGray #-NoNewline
        $info = $info + "|"
    }

    function dotNumber ([int] $number) {
        $numberDotted = ""
        $numberString = $number.ToString()
    
        if ($number -ge 1000 -and $number -lt 10000) {
            $numberDotted = $numberDotted + $numberString.subString(0,1)
            $numberDotted = $numberDotted + "."
            $numberDotted = $numberDotted + $numberString.subString(1,3)
        } elseif ($number -ge 10000 -and $number -lt 100000) {
            $numberDotted = $numberDotted + $numberString.subString(0,2)
            $numberDotted = $numberDotted + "."
            $numberDotted = $numberDotted + $numberString.subString(2,3)
        } elseif ($number -ge 100000 -and $number -lt 1000000) {
            $numberDotted = $numberDotted + $numberString.subString(0,3)
            $numberDotted = $numberDotted + "."
            $numberDotted = $numberDotted + $numberString.subString(2,3)
        } elseif ($number -ge 1000000 -and $number -lt 10000000) {
            $numberDotted = $numberDotted + $numberString.subString(0,1)
            $numberDotted = $numberDotted + "."
            $numberDotted = $numberDotted + $numberString.subString(1,3)
            $numberDotted = $numberDotted + "."
            $numberDotted = $numberDotted + $numberString.subString(4,3)
        } elseif ($number -ge 10000000 -and $number -lt 100000000) {
            $numberDotted = $numberDotted + $numberString.subString(0,2)
            $numberDotted = $numberDotted + "."
            $numberDotted = $numberDotted + $numberString.subString(2,3)
            $numberDotted = $numberDotted + "."
            $numberDotted = $numberDotted + $numberString.subString(5,3)
        } elseif ($number -ge 100000000 -and $number -lt 1000000000) {
            $numberDotted = $numberDotted + $numberString.subString(0,3)
            $numberDotted = $numberDotted + "."
            $numberDotted = $numberDotted + $numberString.subString(3,3)
            $numberDotted = $numberDotted + "."
            $numberDotted = $numberDotted + $numberString.subString(6,3)
        }
    
        return $numberDotted
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

            $starfield = createStarfield $stars $spaceship $shot 3          # Update    3 for ui
            Write-Host $starfield                                           # Draw
            moveStarfield $stars 1                                          # Move stars
            moveShot $shot                                                  # Move Shot
    
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
    $fps = 60

    gameLoop

    #TODO
    #Add Timer and slower Stars
    #Add Asteroids
    # Make Ui Seperators DarkGrey

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