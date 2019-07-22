function Start-PowerSpace {
    function gameLoop () {
        $windowWidthInitial = $Host.UI.RawUI.WindowSize.Width
        $windowHeightInitial = $Host.UI.RawUI.WindowSize.Height

        $bottomSpace = 3
        [Star[]] $stars = createStars $bottomSpace
        [Spaceship] $spaceship = createWorm
        [Shot[]] $shots = createShots $spaceship.weaponCount

        while ($true) {
            $windowWidth = $Host.UI.RawUI.WindowSize.Width
            $windowHeight = $Host.UI.RawUI.WindowSize.Height

            $starfield = createStarfield $stars $spaceship $shots $bottomSpace          # Update, 3 = 2 for UI + 1 cmd indicator
            Write-Host $starfield                                                       # Draw
            moveStarfield $stars 1                                                      # Move stars, 1 for normal, 2 for funky
            moveShots $shots                                                            # Move Shot
            animateSpaceship $spaceship

            $seperator = createUiSeperator                                              # Draw Seperator and Footer
            Write-Host $seperator -NoNewline -ForegroundColor DarkGray
            writeUiInfo $spaceship.name $spaceship.hp 450000
            #Write-Host $seperator -NoNewline

            if ([console]::KeyAvailable) {                                              # Controls
                $input = [System.Console]::ReadKey()
    
                if ($input.Key -eq "LeftArrow") {
                    if ($spaceship.x -gt 1) {
                        $spaceship.x = $spaceship.x - $spaceship.moveSpeed
                    }
                }
                if ($input.Key -eq "RightArrow") {
                    if ($spaceship.x -lt ($windowWidth - $spaceship.width)) {
                        $spaceship.x = $spaceship.x + $spaceship.moveSpeed
                    }
                }
                if ($input.Key -eq "UpArrow") {
                    if ($spaceship.y -gt 1) {
                        $spaceship.y = $spaceship.y - $spaceship.moveSpeed
                    }
                }
                if ($input.Key -eq "DownArrow") {
                    if (($spaceship.y + $spaceship.height) -lt $windowHeight - 2) {
                        $spaceship.y = $spaceship.y + $spaceship.moveSpeed
                    }
                }
                if ($input.Key -eq "Enter") {
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

            for ($i = 0; $i -lt $stars.Length; $i++) {                                                                      # Spawn new stars
                if ($stars[$i].pos -lt 1) {
                    $spawnStar = Get-Random -Minimum 1 -Maximum 50
        
                    if ($spawnStar -eq 1) {
                        $stars[$i] = $windowWidth
                    }
                }
            }
                                                                                                                            # Add new stars if the window height increases
            if ($windowHeight -gt $windowHeightInitial -and ($stars.Length + $bottomSpace) -lt $windowHeight) {
                $pos = Get-Random -Minimum 1 -Maximum ($windowWidth + 1)
                $star = New-Object Star $pos
                $stars += @($star)
            }

            Start-Sleep -Milliseconds (1000 / $fps)                                                                         # FPS control and refresh
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
    . "$PSScriptRoot\src\AnimateSpaceships.ps1"

    Clear-Host
    $debug = $false
    $fps = 100

    gameLoop

    #TODO
    #Add Timer and slower Stars
    #Add Asteroids
}