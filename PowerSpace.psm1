class Star {
    [string]$appearance = "*"
    [int]$pos

    Star ([int]$posNew) {
        $this.pos = $posNew
    }
}

class Spaceship {
    [string]$name = "Spaceshell"

    [string]$appearance1 = "*"
    [string]$appearance2 = "*"
    [string]$appearance3 = "*"
    [string]$appearance4 = "*"
    [string]$appearance5 = "*"
    [string]$appearance6 = "*"
    [string]$appearance7 = "*"
    [string]$appearance8 = "*"
    [string]$appearance9 = "*"
}

function Start-PowerSpace {
    function makeStars {
        [Star[]] $stars
    
        for ($i = 0; $i -lt $windowHeight; $i++) {
            $pos = Get-Random -Minimum 0 -Maximum $windowWidth
            $star = New-Object Star($pos)
            $stars += @($star)

            #Write-Host "Made Star:$i" "With:"$star.pos $star.appearance "LArray:"$stars.Length -NoNewline
            #Write-Host "-> Control Made Star:$i" "With:"$stars[$i].pos $stars[$i].appearance "LArray:"$stars.Length
        }
    
        return $stars
    }
    
    function makeStarline ([Star]$star) {
        $starline = ""
    
        if ($star.pos -lt 1) {
            for ($i = 0; $i -lt $windowWidth; $i++) {
                if ($debug) {
                    $starline = $starline + "-"
                }else {
                    $starline = $starline + " "
                }
                
            }
        }else {
            for ($i = 1; $i -lt $star.pos; $i++) {
                if ($debug) {
                    $starline = $starline + "+"
                }else {
                    $starline = $starline + " "
                }
            }
        
            $starline = $starline + $star.appearance
        
            for ($i = $star.pos; $i -lt $windowWidth; $i++) {
                if ($debug) {
                    $starline = $starline + "-"
                }else {
                    $starline = $starline + " "
                }
            }
        }
    
        return $starline
    }

    function makeStarfield ([Star[]]$stars) {
        $starfield = ""
    
        for ($i = 1; $i -le $windowHeight-1; $i++) {
            $starline = makeStarline($stars[$i])
            $starfield = $starfield + $starline

            #Write-Host "Using Star:$i" "With:"$stars[$i].pos $stars[$i].appearance "LArray:"$stars.Length
        }
    
        return $starfield
    }

    function moveStarfield ([Star[]]$stars) {
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

        while ($true) {
            $windowWidth = $Host.UI.RawUI.WindowSize.Width
            $windowHeight = $Host.UI.RawUI.WindowSize.Height

            $starfield = makeStarfield($stars)                          # Update
            Write-Host $starfield                                       # Draw
            moveStarfield($stars)                                       # Move

            for ($i = 1; $i -le $stars.Length-1; $i++) {
                if ($stars[$i].pos -lt 1) {
                    $spawnStar = Get-Random -Minimum 1 -Maximum 50
        
                    if ($spawnStar -eq 1) {
                        $stars[$i] = $windowWidth
                    }
                }
            }

            if ($windowHeight -gt 40) {
                if ($windowHeight -gt $stars.Length) {
                    $pos = Get-Random -Minimum 0 -Maximum $windowWidth
                    $star = New-Object Star($pos)
                    $stars += @($star)
                }
            }

            Start-Sleep -Milliseconds (1000 / $fps)
            Clear-Host

            Write-Host "X:"$windowWidth "Y:"$windowHeight "Stars:"$stars.Length
        }
    }

    # -------------------------------- MAIN --------------------------------
    $debug = $false
    $fps = 50

    setWindowSize
    
    $windowWidth = $Host.UI.RawUI.WindowSize.Width
    $windowHeight = $Host.UI.RawUI.WindowSize.Height

    gameLoop

    # -------------------------------- DEBUG -------------------------------
    #$starfield = makeStarfield($stars)
    #Write-Host $starfield
    #moveStarfield($stars)

    #Write-Host $windowWidth
    #Write-Host $windowHeight
    #Write-Host $stars.Length
}