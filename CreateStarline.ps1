function createStarline ([Star] $star, [Spaceship] $spaceship, $row) {
    $windowWidth = $Host.UI.RawUI.WindowSize.Width
    $windowHeight = $Host.UI.RawUI.WindowSize.Height
    $starline = ""
    $appIndex = 0

    # Handeling the lines without a star ------------------------------------------------------------------------------------
    if ($row -eq $spaceship.y -or $row -eq ($spaceship.y + 1) -or $row -eq ($spaceship.y + 2) -or $row -eq ($spaceship.y + 3) -or $row -eq ($spaceship.y + 4)) {   
        if ($row -eq ($spaceship.y + 1)) {
            $appIndex = 1
        } elseif ($row -eq ($spaceship.y + 2)) {
            $appIndex = 2
        } elseif ($row -eq ($spaceship.y + 3)) {
            $appIndex = 3
        } elseif ($row -eq ($spaceship.y + 4)) {
            $appIndex = 4
        }

        for ($i = 0; $i -lt $spaceship.appearance[$appIndex].Length; $i++) {
            if ($star.pos -eq ($spaceship.x + $i)) {                                                                        # Star is at the same position as the ship is
                for ($i = 0; $i -lt $spaceship.x; $i++) {
                    if ($debug) {
                        $starline = $starline + "B"
                    } else {
                        $starline = $starline + " "
                    }
                }

                $starline = $starline + $spaceship.appearance[$appIndex]

                for ($i = (($spaceship.x + $spaceship.appearance[$appIndex].Length)); $i -lt $windowWidth; $i++) {
                    if ($debug) {
                        $starline = $starline + "B"
                    } else {
                        $starline = $starline + " "
                    }
                }

                return $starline
            }
        }

        if ($star.pos -lt 1) {                                                                                              # Star is out of bounds
            for ($i = 0; $i -lt $spaceship.x; $i++) {
                if ($debug) {
                    $starline = $starline + "O"
                } else {
                    $starline = $starline + " "
                }
            }

            $starline = $starline + $spaceship.appearance[$appIndex]

            for ($i = (($spaceship.x + $spaceship.appearance[$appIndex].Length)); $i -lt $windowWidth; $i++) {
                if ($debug) {
                    $starline = $starline + "O"
                } else {
                    $starline = $starline + " "
                }
            }

            return $starline
        }
    } elseif ($star.pos -lt 1) {                                                                                            # For non spacship rows
        for ($i = 0; $i -lt $windowWidth; $i++) {
            if ($debug) {
                $starline = $starline + "-"
            }else {
                $starline = $starline + " "
            }
        }

        return $starline
    }

    $appIndex = 0
    
    # Main Handle -----------------------------------------------------------------------------------------------------------
    if ($row -eq $spaceship.y -or $row -eq ($spaceship.y + 1) -or $row -eq ($spaceship.y + 2) -or $row -eq ($spaceship.y + 3) -or $row -eq ($spaceship.y + 4)) {   
        if ($row -eq ($spaceship.y + 1)) {
            $appIndex = 1
        } elseif ($row -eq ($spaceship.y + 2)) {
            $appIndex = 2
        } elseif ($row -eq ($spaceship.y + 3)) {
            $appIndex = 3
        } elseif ($row -eq ($spaceship.y + 4)) {
            $appIndex = 4
        }

        if ($star.pos -lt $spaceship.x) {                                                                                   # the star is behind the ship
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

            $starline = $starline + $spaceship.appearance[$appIndex]

            for ($i = ($spaceship.x + $spaceship.appearance[$appIndex].Length); $i -lt $windowWidth; $i++) {
                if ($debug) {
                    $starline = $starline + "L"
                } else {
                    $starline = $starline + " "
                }
            }
        } elseif ($star.pos -ge ($spaceship.x + $spaceship.appearance[$appIndex].Length)) {                                           # the star is in front of the ship
            for ($i = 0; $i -lt $spaceship.x; $i++) {
                if ($debug) {
                    $starline = $starline + "R"
                } else {
                    $starline = $starline + " "
                }
            }

            $starline = $starline + $spaceship.appearance[$appIndex]

            if ($star.pos -eq $windowWidth){                                                                                # Draw one space less, if the star is at maxium position
                for ($i = (($spaceship.x + $spaceship.appearance[$appIndex].Length) + 1); $i -lt $star.pos; $i++) {
                    if ($debug) {
                        $starline = $starline + "R"
                    } else {
                        $starline = $starline + " "
                    }
                }
            } else {
                for ($i = (($spaceship.x + $spaceship.appearance[$appIndex].Length)); $i -lt $star.pos; $i++) {
                    if ($debug) {
                        $starline = $starline + "R"
                    } else {
                        $starline = $starline + " "
                    }
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
    } else {                                                                                                                # for all lines without the spaceship
        for ($i = 1; $i -lt $star.pos; $i++) {
            if ($debug) {
                $starline = $starline + "+"
            }else {
                $starline = $starline + " "
            }
        }

        $starline = $starline + $star.appearance
    }
    
    # Handling the space after a star. Only for non-spaceship lines --------------------------------------------------------
    if ($row -ne $spaceship.y -and $row -ne ($spaceship.y + 1) -and $row -ne ($spaceship.y + 2) -and $row -ne ($spaceship.y + 3) -and $row -ne ($spaceship.y + 4)) {
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