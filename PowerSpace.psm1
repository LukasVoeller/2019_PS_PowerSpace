class Star {
    [string] $appearance = "*"
    [int] $moveSpeed = 1
    [int] $pos

    Star ([int] $posNew) {
        $this.pos = $posNew
    }
}

class Spaceship {
    [string] $name = $null
    [String[]] $appearance = $null
    [int] $width
    [int] $height
    [int]$x = 10
    [int]$y = 10

    Spaceship ([String] $newName) {
        $this.name = $newName
        
        $this.appearance += @(" ____")
        $this.appearance += @("O    |=")
        $this.appearance += @("/\-- \__\")
        $this.appearance += @("\/-- /__/")
        $this.appearance += @("O____|=")

        $largestRow = 0                                                     # Determine the width of the spaceship by the largest row
        for ($i = 0; $i -lt $this.appearance.Length; $i++) {
            if ($this.appearance[$i].Length -gt $largestRow) {
                $largestRow = $this.appearance[$i].Length
            }
        }

        $this.width = $largestRow
        $this.height = $this.appearance.Length
    }
}

function Start-PowerSpace {

    function createStars {
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

    function createStarfield ([Star[]] $stars, [Spaceship] $spaceship) {
        $windowWidth = $Host.UI.RawUI.WindowSize.Width
        $windowHeight = $Host.UI.RawUI.WindowSize.Height
        $starfield = ""
    
        for ($i = 1; $i -le $windowHeight-1; $i++) {                # -1 so the last line ist the command indicator "_"
            $starline = createStarline $stars[$i] $spaceship $i
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
                $stars[$i].pos = $stars[$i].pos - $stars[$i].moveSpeed
            }
        }

# Move funky
<#
        for ($i = 1; $i -le $windowHeight; $i++) {
            $rand = Get-Random -Minimum 1 -Maximum 4           # Random number form 1-3

            if ($rand -eq 1) {
                if ($stars[$i].pos -ne $null) {
                    $stars[$i].pos = $stars[$i].pos - 1
                }
            }
        }
#>

# Move normal
<#
        for ($i = 1; $i -le $windowHeight; $i++) {
            if ($stars[$i].pos -ne $null) {
                $stars[$i].pos = $stars[$i].pos - 1
            }
        }
#>
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
        [Star[]] $stars = createStars
        [Spaceship] $spaceship = New-Object Spaceship("Spaceshell")

        while ($true) {
            $windowWidth = $Host.UI.RawUI.WindowSize.Width
            $windowHeight = $Host.UI.RawUI.WindowSize.Height

            $starfield = createStarfield $stars $spaceship                  # Update
            Write-Host $starfield                                           # Draw
            moveStarfield($stars)                                           # Move stars

            if ([console]::KeyAvailable) {                                  # Move spaceship
                $x = [System.Console]::ReadKey()
    
                if ($x.Key -eq "LeftArrow") {
                    if ($spaceship.x -gt 1) {
                        $spaceship.x = $spaceship.x - 1
                    }
                }
                if ($x.Key -eq "RightArrow") {
                    if ($spaceship.x -lt $windowWidth - $spaceship) {
                        
                    }
                    $spaceship.x = $spaceship.x + 1
                }
                if ($x.Key -eq "UpArrow") {
                    if ($spaceship.y -gt 1) {
                        $spaceship.y = $spaceship.y - 1
                    }
                }
                if ($x.Key -eq "DownArrow") {
                    $spaceship.y = $spaceship.y + 1
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

            if ($windowHeight -gt 40) {                                     # Add stars if height increases
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
    . "$PSScriptRoot\CreateStarline.ps1"
    $debug = $true
    $fps = 50

    gameLoop

    #[Spaceship] $spaceship = New-Object Spaceship("Spaceshell")
    #Write-Host $spaceship.appearance[4]
    #Write-Host $spaceship.width
    #Write-Host $spaceship.height
    

    # -------------------------------- DEBUG -------------------------------
    #$starfield = createStarfield($stars)
    #Write-Host $starfield
    #moveStarfield($stars)

    #Write-Host $windowWidth
    #Write-Host $windowHeight
    #Write-Host $stars.Length
}