class Star {
    [string]$appearance = "*"
    [int]$pos

    Star ([int]$posNew) {
        $this.pos = $posNew
    }
}

class Spaceship {
    [string]$name = "Spaceshell"
    [int]$x = 10
    [int]$y = 10

    [string]$appearance1 = " ____"
    [string]$appearance2 = "O    |="
    [string]$appearance3 = "/\-- \__\"
    [string]$appearance4 = "\/-- /__/"
    [string]$appearance5 = "O____|="
}

function Start-PowerSpace {

    function makeStars {
        $windowWidth = $Host.UI.RawUI.WindowSize.Width
        $windowHeight = $Host.UI.RawUI.WindowSize.Height
        [Star[]] $stars

        for ($i = 0; $i -lt $windowHeight; $i++) {
            $pos = Get-Random -Minimum 1 -Maximum ($windowWidth+1)          # Random number from 1-120
            $star = New-Object Star($pos)
            $stars += @($star)

            #Write-Host "Made:" $i "Stars"
            #Write-Host "Made Star:$i" "With:"$star.pos $star.appearance "LArray:"$stars.Length -NoNewline
            #Write-Host "-> Control Made Star:$i" "With:"$stars[$i].pos $stars[$i].appearance "LArray:"$stars.Length
        }
    
        return $stars
    }
    
    function makeStarline ([Star] $star, [Spaceship] $spaceship, $row) {
        $windowWidth = $Host.UI.RawUI.WindowSize.Width
        $windowHeight = $Host.UI.RawUI.WindowSize.Height
        $starline = ""
    
        # Handeling the lines without a star
        if ($row -eq $spaceship.y){                                                                                         # determines that we are in a spaceship row
            for ($i = 0; $i -lt $spaceship.appearance1.Length; $i++) {
                if ($star.pos -eq ($spaceship.x + $i)) {                                                                    # star is behind the ship
                    for ($i = 0; $i -lt $spaceship.x; $i++) {
                        if ($debug) {
                            $starline = $starline + "D"
                        } else {
                            $starline = $starline + " "
                        }
                    }

                    $starline = $starline + $spaceship.appearance1

                    for ($i = (($spaceship.x + $spaceship.appearance1.Length)); $i -lt $windowWidth; $i++) {
                        if ($debug) {
                            $starline = $starline + "D"
                        } else {
                            $starline = $starline + " "
                        }
                    }
    
                    return $starline
                }
            }

            if ($star.pos -lt 1) {                                                                                          # star is out of bounds
                for ($i = 0; $i -lt $spaceship.x; $i++) {
                    if ($debug) {
                        $starline = $starline + "W"
                    } else {
                        $starline = $starline + " "
                    }
                }

                $starline = $starline + $spaceship.appearance1

                for ($i = (($spaceship.x + $spaceship.appearance1.Length)); $i -lt $windowWidth; $i++) {
                    if ($debug) {
                        $starline = $starline + "W"
                    } else {
                        $starline = $starline + " "
                    }
                }

                return $starline
            }
        } elseif ($star.pos -lt 1) {
            for ($i = 0; $i -lt $windowWidth; $i++) {
                if ($debug) {
                    $starline = $starline + "-"
                }else {
                    $starline = $starline + " "
                }
            }

            return $starline
        }
        
        # Main Handle
        if ($row -eq $spaceship.y){                                                                             # determines that we are in a spaceship row
            if ($star.pos -lt $spaceship.x) {                                                                   # the star is behind the ship
                for ($i = 1; $i -lt $star.pos; $i++) {
                    if ($debug) {
                        $starline = $starline + "L"
                    }else {
                        $starline = $starline + " "
                    }
                }
    
                $starline = $starline + $star.appearance

                for ($i = $star.pos; $i -lt $spaceship.x; $i++) {
                    if ($debug) {
                        $starline = $starline + "L"
                    } else {
                        $starline = $starline + " "
                    }
                }

                $starline = $starline + $spaceship.appearance1

                for ($i = ($spaceship.x + $spaceship.appearance1.Length); $i -lt $windowWidth; $i++) {
                    if ($debug) {
                        $starline = $starline + "L"
                    } else {
                        $starline = $starline + " "
                    }
                }
            } elseif ($star.pos -ge ($spaceship.x + $spaceship.appearance1.Length)) {                           # the star is in front of the ship
                for ($i = 0; $i -lt $spaceship.x; $i++) {
                    if ($debug) {
                        $starline = $starline + "R"
                    } else {
                        $starline = $starline + " "
                    }
                }

                $starline = $starline + $spaceship.appearance1

                for ($i = (($spaceship.x + $spaceship.appearance1.Length)); $i -lt $star.pos; $i++) {
                    if ($debug) {
                        $starline = $starline + "R"
                    } else {
                        $starline = $starline + " "
                    }
                }

                $starline = $starline + $star.appearance

                for ($i = $star.pos; $i -lt ($windowWidth - 1); $i++) {
                    if ($debug) {
                        $starline = $starline + "R"
                    } else {
                        $starline = $starline + " "
                    }
                }
            }
        } else {                                                                                                # for all other lines without the spaceship
            for ($i = 1; $i -lt $star.pos; $i++) {
                if ($debug) {
                    $starline = $starline + "+"
                }else {
                    $starline = $starline + " "
                }
            }

            $starline = $starline + $star.appearance
        }
    
        
        # Handling the space after a star. Only for non-spaceship line and stars in fornt of the ship
        if ($row -ne $spaceship.y) {
            for ($i = $star.pos; $i -lt $windowWidth; $i++) {
                if ($debug) {
                    $starline = $starline + "-"
                } else {
                    $starline = $starline + " "
                }
            }
        }
    
        return $starline
    }

    function makeStarfield ([Star[]] $stars, [Spaceship] $spaceship) {
        $windowWidth = $Host.UI.RawUI.WindowSize.Width
        $windowHeight = $Host.UI.RawUI.WindowSize.Height
        $starfield = ""
    
        for ($i = 1; $i -le $windowHeight-1; $i++) {                # -1 so the last line ist the command indicator "_"
            $starline = makeStarline $stars[$i] $spaceship $i
            $starfield = $starfield + $starline

            #Write-Host "Made:" $i "Starlines"
            #Write-Host "Using Star:$i" "With:"$stars[$i].pos $stars[$i].appearance "LArray:"$stars.Length
        }
    
        return $starfield
    }

    function moveStarfield ([Star[]] $stars) {
        $windowWidth = $Host.UI.RawUI.WindowSize.Width
        $windowHeight = $Host.UI.RawUI.WindowSize.Height

        for ($i = 1; $i -le $windowHeight; $i++) {
            if ($stars[$i].pos -ne $null) {
                $stars[$i].pos = $stars[$i].pos - 1
            }
            
            #Write-Host "-> Control Moved Star:$i" "With:"$stars[$i].pos $stars[$i].appearance "LArray:"$stars.Length
        }
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
        [Star[]] $stars = makeStars
        [Spaceship] $spaceship = New-Object Spaceship

        while ($true) {
            $windowWidth = $Host.UI.RawUI.WindowSize.Width
            $windowHeight = $Host.UI.RawUI.WindowSize.Height

            $starfield = makeStarfield $stars $spaceship                # Update
            Write-Host $starfield                                       # Draw
            #Write-Host " "
            moveStarfield($stars)                                       # Move

            #Write-Host "X:"$windowWidth "Y:"$windowHeight "Stars:"$stars.Length -NoNewline

            for ($i = 0; $i -lt $stars.Length-1; $i++) {                # Spawn new stars
                if ($stars[$i].pos -lt 1) {
                    $spawnStar = Get-Random -Minimum 1 -Maximum 50
        
                    if ($spawnStar -eq 1) {
                        $stars[$i] = $windowWidth
                    }
                }
            }

            if ($windowHeight -gt 40) {                                 # Add stars if height increases
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

    # -------------------------------- MAIN --------------------------------
    $debug = $true
    $fps = 50

    gameLoop

    # -------------------------------- SAVE --------------------------------
    <#
    while(1) {
        $pressedKey = $host.ui.RawUI.ReadKey() |%{$_.VirtualKeyCode}

        if ($pressedKey -eq 37) {
            Write-Host "Left"
        }
        if ($pressedKey -eq 38) {
            Write-Host "Up"
        }
        if ($pressedKey -eq 39) {
            Write-Host "Right"
        }
        if ($pressedKey -eq 40) {
            Write-Host "Down"
        }
    }
    #>

    # -------------------------------- DEBUG -------------------------------
    #$starfield = makeStarfield($stars)
    #Write-Host $starfield
    #moveStarfield($stars)

    #Write-Host $windowWidth
    #Write-Host $windowHeight
    #Write-Host $stars.Length
}