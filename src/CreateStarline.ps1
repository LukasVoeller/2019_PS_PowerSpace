function createStarline ([Star] $star, [Spaceship] $spaceship, [Shot] $shot, $row) {
    $windowWidth = $Host.UI.RawUI.WindowSize.Width
    $windowHeight = $Host.UI.RawUI.WindowSize.Height
    $starline = ""

    $isSpaceshipLine = $false
    $isShotLine = $false

    for ($i = 0; $i -lt $spaceship.height; $i++) {              # Determines if the line that is about to be dawn contains a part of a spaceship
        if ($row -eq ($spaceship.y + $i)) {
            $isSpaceshipLine = $true
        }
    }

    if ($row -eq $shot.y) {                                     # Determines if the line that is about to be drawn contains a shot
        $isShotLine = $true
    }

    if ($row -eq $spaceship.y) {                                # Determine the appearance line of the spaceship up to ships with a height of 5
        $appIndex = 0
    } elseif ($row -eq ($spaceship.y + 1)) {
        $appIndex = 1
    } elseif ($row -eq ($spaceship.y + 2)) {
        $appIndex = 2
    } elseif ($row -eq ($spaceship.y + 3)) {
        $appIndex = 3
    } elseif ($row -eq ($spaceship.y + 4)) {
        $appIndex = 4
    }

    # The debug alternatives "L", "R", "O" and "B" for the spaceship lines, are indicating that the star is
    # left or right from the ship, or the star is out of bounds or "behind" the ship

    # Handeling lines without a star ----------------------------------------------------------------------------------------
    if ($isSpaceshipLine -and $isShotLine) {                                                                                # The line contains a spaceship part and a shot                         
        if ($star.pos -ge $spaceship.x -and $star.pos -lt ($spaceship.x + $spaceship.appearance[$appIndex].Length) -or $star.pos -eq $shot.x) {     # Star is at the same position as the ship or the shot                                                                   
            for ($i = 1; $i -lt $spaceship.x; $i++) {                                                                       # -1 for the added shot
                if ($debug) {
                    $starline = $starline + "b"
                } else {
                    $starline = $starline + " "
                }
            }

            $starline = $starline + $spaceship.appearance[$appIndex]
                
            for ($i = (($spaceship.x + $spaceship.appearance[$appIndex].Length)); $i -lt $shot.x; $i++) {
                if ($debug) {
                    $starline = $starline + "b"
                } else {
                    $starline = $starline + " "
                }
            }

            if ($shot.x -lt $windowWidth) {
                $starline = $starline + $shot.appearance

                for ($i = $shot.x; $i -lt ($windowWidth); $i++) {                                                           
                    if ($debug) {
                        $starline = $starline + "b"
                    } else {
                        $starline = $starline + " "
                    }
                }
            } else {
                for ($i = $shot.x; $i -lt ($windowWidth + 1); $i++) {                                                           
                    if ($debug) {
                        $starline = $starline + "b"
                    } else {
                        $starline = $starline + " "
                    }
                }
            }
 
            return $starline
        } elseif ($star.pos -lt 1) {                                                                                        # Star is out of bounds
            for ($i = 1; $i -lt $spaceship.x; $i++) {                                                                       # -1 for the added shot
                if ($debug) {
                    $starline = $starline + "o"
                } else {
                    $starline = $starline + " "
                }
            }

            $starline = $starline + $spaceship.appearance[$appIndex]

            for ($i = (($spaceship.x + $spaceship.appearance[$appIndex].Length)); $i -lt $shot.x; $i++) {               
                if ($debug) {
                    $starline = $starline + "o"
                } else {
                    $starline = $starline + " "
                }
            }

            if ($shot.x -lt $windowWidth) {
                $starline = $starline + $shot.appearance

                for ($i = $shot.x; $i -lt $windowWidth; $i++) {                                                           
                    if ($debug) {
                        $starline = $starline + "o"
                    } else {
                        $starline = $starline + " "
                    }
                }
            } else {
                for ($i = $shot.x; $i -lt $windowWidth + 1; $i++) {                                                           
                    if ($debug) {
                        $starline = $starline + "o"
                    } else {
                        $starline = $starline + " "
                    }
                }
            }

            return $starline
        }
    } elseif ($isSpaceshipLine) {                                                                                           # The line contains only a spaceship part      
        if ($star.pos -ge $spaceship.x -and $star.pos -lt ($spaceship.x + $spaceship.appearance[$appIndex].Length)) {       # Star is at the same position as the ship is
            for ($i = 1; $i -lt $spaceship.x; $i++) {
                if ($debug) {
                    $starline = $starline + "B"
                } else {
                    $starline = $starline + " "
                }
            }

            $starline = $starline + $spaceship.appearance[$appIndex]

            for ($i = (($spaceship.x + $spaceship.appearance[$appIndex].Length)); $i -le $windowWidth; $i++) {
                if ($debug) {
                    $starline = $starline + "B"
                } else {
                    $starline = $starline + " "
                }
            }

            return $starline
        } elseif ($star.pos -lt 1) {                                                                                        # Star is out of bounds
            for ($i = 1; $i -lt $spaceship.x; $i++) {
                if ($debug) {
                    $starline = $starline + "O"
                } else {
                    $starline = $starline + " "
                }
            }

            $starline = $starline + $spaceship.appearance[$appIndex]

            for ($i = (($spaceship.x + $spaceship.appearance[$appIndex].Length)); $i -le $windowWidth; $i++) {
                if ($debug) {
                    $starline = $starline + "O"
                } else {
                    $starline = $starline + " "
                }
            }

            return $starline
        }
    } elseif ($isShotLine -and $star.pos -ge 1) {
        if ($shot.x -eq $star.pos) {                                                                                        # Shot is at the same position as the star
            for ($i = 0; $i -lt $star.pos - 1; $i++) {                                                                      # -1 for the star
                if ($debug) {
                    $starline = $starline + "b"
                } else {
                    $starline = $starline + " "
                }
            }
    
            $starline = $starline + $star.appearance
    
            for ($i = $star.pos; $i -lt $windowWidth; $i++) {
                if ($debug) {
                    $starline = $starline + "b"
                } else {
                    $starline = $starline + " "
                }
            }
        }
    } elseif ($star.pos -lt 1) {                                                                                            # The line neither contains a ship part nor a shot
        if ($isShotLine) {
            for ($i = 0; $i -lt $shot.x - 1; $i++) {                                                                        # -1 for the star
                if ($debug) {
                    $starline = $starline + "-"
                } else {
                    $starline = $starline + " "
                }
            }

            if ($shot.x -lt $windowWidth) {
                $starline = $starline + $shot.appearance

                for ($i = $shot.x; $i -lt $windowWidth; $i++) {
                    if ($debug) {
                        $starline = $starline + "-"
                    }else {
                        $starline = $starline + " "
                    }
                }
            } else {
                for ($i = $shot.x; $i -lt $windowWidth; $i++) {
                    if ($debug) {
                        $starline = $starline + "-"
                    }else {
                        $starline = $starline + " "
                    }
                }
            }

            return $starline
        } else {
            for ($i = 0; $i -lt $windowWidth; $i++) {
                if ($debug) {
                    $starline = $starline + "-"
                }else {
                    $starline = $starline + " "
                }
            }

            return $starline
        }
    }
    
    # Main Handle -----------------------------------------------------------------------------------------------------------
    if ($isSpaceshipLine -and $isShotLine) { # ---------------------------------------------------------------------------- # The line contains a spaceship part and a shot
        if ($star.pos -lt $spaceship.x) {                                                                                   # The star is left form the ship
            for ($i = 0; $i -lt $star.pos - 1; $i++) {                                                                      # No need to handle the shot, shot always right from ship
                if ($debug) {
                    $starline = $starline + "l"
                }else {
                    $starline = $starline + " "
                }
            }

            $starline = $starline + $star.appearance

            for ($i = $star.pos; $i -lt $spaceship.x - 1; $i++) {
                if ($debug) {
                    $starline = $starline + "r"
                } else {
                    $starline = $starline + " "
                }
            }

            $starline = $starline + $spaceship.appearance[$appIndex]

            for ($i = (($spaceship.x + $spaceship.appearance[$appIndex].Length)); $i -lt $shot.x; $i++) {                   # -1 for the added shot
                if ($debug) {
                    $starline = $starline + "r"
                } else {
                    $starline = $starline + " "
                }
            }

            if ($shot.x -lt $windowWidth) {
                $starline = $starline + $shot.appearance

                for ($i = $shot.x; $i -lt ($windowWidth); $i++) {                                                               
                    if ($debug) {
                        $starline = $starline + "r"
                    } else {
                        $starline = $starline + " "
                    }
                }
            } else {
                for ($i = $shot.x; $i -lt ($windowWidth + 1); $i++) {                                                               
                    if ($debug) {
                        $starline = $starline + "r"
                    } else {
                        $starline = $starline + " "
                    }
                }
            }
        } elseif ($star.pos -ge ($spaceship.x + $spaceship.appearance[$appIndex].Length)) {                                 # The star is right from the ship
            for ($i = 1; $i -lt $spaceship.x; $i++) {
                if ($debug) {
                    $starline = $starline + "l"
                } else {
                    $starline = $starline + " "
                }
            }

            $starline = $starline + $spaceship.appearance[$appIndex]

            if ($shot.x -lt $star.pos) {                                                                                    # The shot is left from the star
                for ($i = (($spaceship.x + $spaceship.appearance[$appIndex].Length)); $i -lt $shot.x; $i++) {
                    if ($debug) {
                        $starline = $starline + "l"
                    } else {
                        $starline = $starline + " "
                    }
                }
    
                if ($shot.x -lt $windowWidth) {
                    $starline = $starline + $shot.appearance

                    for ($i = $shot.x; $i -lt $star.pos - 1; $i++) {                                                            # -1 for the star
                        if ($debug) {
                            $starline = $starline + "x"
                        } else {
                            $starline = $starline + " "
                        }
                    }
                } else {
                    for ($i = $shot.x; $i -lt $star.pos; $i++) {
                        if ($debug) {
                            $starline = $starline + "x"
                        } else {
                            $starline = $starline + " "
                        }
                    }
                }
            
                $starline = $starline + $star.appearance

                for ($i = $star.pos; $i -lt ($windowWidth); $i++) {
                    if ($debug) {
                        $starline = $starline + "r"
                    } else {
                        $starline = $starline + " "
                    }
                }
            } elseif ($shot.x -gt $star.pos) {                                                                              # The shot is right from the star
                for ($i = (($spaceship.x + $spaceship.appearance[$appIndex].Length)); $i -lt $star.pos; $i++) {
                    if ($debug) {
                        $starline = $starline + "l"
                    } else {
                        $starline = $starline + " "
                    }
                }

                $starline = $starline + $star.appearance

                for ($i = $star.pos; $i -lt $shot.x - 1; $i++) {                                                            # -1 for the shot
                    if ($debug) {
                        $starline = $starline + "x"
                    } else {
                        $starline = $starline + " "
                    }
                }

                if ($shot.x -lt $windowWidth) {
                    $starline = $starline + $shot.appearance

                    for ($i = $shot.x; $i -lt ($windowWidth); $i++) {                                                       # -2 for the added shot and star
                        if ($debug) {
                            $starline = $starline + "r"
                        } else {
                            $starline = $starline + " "
                        }
                    }
                } else {
                    for ($i = $shot.x; $i -lt ($windowWidth + 1); $i++) {
                        if ($debug) {
                            $starline = $starline + "r"
                        } else {
                            $starline = $starline + " "
                        }
                    }
                }
            }
        }
    } elseif ($isSpaceshipLine) { # --------------------------------------------------------------------------------------- # The line only contains a spaceship part 
        if ($star.pos -lt $spaceship.x) {                                                                                   # The star is left from the ship
            for ($i = 1; $i -lt $star.pos; $i++) {
                if ($debug) {
                    $starline = $starline + "L"
                }else {
                    $starline = $starline + " "
                }
            }

            $starline = $starline + $star.appearance

            for ($i = $star.pos; $i -lt $spaceship.x - 1; $i++) {
                if ($debug) {
                    $starline = $starline + "R"
                } else {
                    $starline = $starline + " "
                }
            }

            $starline = $starline + $spaceship.appearance[$appIndex]

            for ($i = ($spaceship.x + $spaceship.appearance[$appIndex].Length); $i -lt $windowWidth + 1; $i++) {
                if ($debug) {
                    $starline = $starline + "R"
                } else {
                    $starline = $starline + " "
                }
            }
        } elseif ($star.pos -ge ($spaceship.x + $spaceship.appearance[$appIndex].Length)) {                                 # The star is right from the ship
            for ($i = 1; $i -lt $spaceship.x; $i++) {
                if ($debug) {
                    $starline = $starline + "L"
                } else {
                    $starline = $starline + " "
                }
            }

            $starline = $starline + $spaceship.appearance[$appIndex]
                                                                                                                            # ???
            if ($star.pos -eq $windowWidth) {                                                                               # Draw one space less, if the star is at maxium position
                for ($i = (($spaceship.x + $spaceship.appearance[$appIndex].Length)); $i -lt $star.pos; $i++) {
                    if ($debug) {
                        $starline = $starline + "L"
                    } else {
                        $starline = $starline + " "
                    }
                }
            } else {
                for ($i = (($spaceship.x + $spaceship.appearance[$appIndex].Length) - 1); $i -lt $star.pos - 1; $i++) {     # -1 for the star
                    if ($debug) {
                        $starline = $starline + "L"
                    } else {
                        $starline = $starline + " "
                    }
                }
            }

            $starline = $starline + $star.appearance

            for ($i = $star.pos; $i -lt $windowWidth; $i++) {
                if ($debug) {
                    $starline = $starline + "R"
                } else {
                    $starline = $starline + " "
                }
            }
        }
    } elseif ($isShotLine) { # -------------------------------------------------------------------------------------------- # The line only contains a shot
        if ($shot.x -lt $star.pos) {                                                                                        # Shot is left from the star
            for ($i = 0; $i -lt $shot.x - 1; $i++) {                                                                        # -1 for the shot
                if ($debug) {
                    $starline = $starline + "l"
                } else {
                    $starline = $starline + " "
                }
            }

            if ($shot.x -lt $windowWidth) {
                $starline = $starline + $shot.appearance

                for ($i = $shot.x; $i -lt $star.pos - 1; $i++) {                                                                # -1 for the star
                    if ($debug) {
                        $starline = $starline + "x"
                    } else {
                        $starline = $starline + " "
                    }
                }
            } else {
                for ($i = $shot.x; $i -lt $star.pos; $i++) {
                    if ($debug) {
                        $starline = $starline + "x"
                    } else {
                        $starline = $starline + " "
                    }
                }
            }

            $starline = $starline + $star.appearance

            for ($i = $star.pos; $i -lt $windowWidth; $i++) {
                if ($debug) {
                    $starline = $starline + "r"
                } else {
                    $starline = $starline + " "
                }
            }
        } elseif ($shot.x -gt $star.pos) {                                                                                  # Shot is right from the star
            for ($i = 0; $i -lt $star.pos - 1; $i++) {                                                                      # -1 for the star
                if ($debug) {
                    $starline = $starline + "l"
                } else {
                    $starline = $starline + " "
                }
            }

            $starline = $starline + $star.appearance

            for ($i = $star.pos; $i -lt $shot.x - 1; $i++) {                                                                # -1 for the shot
                if ($debug) {
                    $starline = $starline + "x"
                } else {
                    $starline = $starline + " "
                }
            }

            if ($shot.x -lt $windowWidth) {
                $starline = $starline + $shot.appearance

                for ($i = $shot.x; $i -lt $windowWidth; $i++) {
                    if ($debug) {
                        $starline = $starline + "r"
                    } else {
                        $starline = $starline + " "
                    }
                }
            } else {
                for ($i = $shot.x; $i -lt $windowWidth + 1; $i++) {
                    if ($debug) {
                        $starline = $starline + "r"
                    } else {
                        $starline = $starline + " "
                    }
                }
            }
        }
    } else {                                                                                                                # For all lines without the spaceship and a shot
        for ($i = 0; $i -lt $star.pos - 1; $i++) {                                                                          # -1 for the star
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
            } else {
                $starline = $starline + " "
            }
        }
    }

    return $starline
}