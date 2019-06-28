function createStarline ([Star] $star, [Spaceship] $spaceship, $row) {
    $windowWidth = $Host.UI.RawUI.WindowSize.Width
    $windowHeight = $Host.UI.RawUI.WindowSize.Height
    $starline = ""

    # Handeling the lines without a star
    if ($row -eq $spaceship.y){                                                                                         # determines that we are in a spaceship row
        for ($i = 0; $i -lt $spaceship.appearance1.Length; $i++) {
            if ($star.pos -eq ($spaceship.x + $i)) {                                                                    # star is a the same position the ship is
                for ($i = 0; $i -lt $spaceship.x; $i++) {
                    if ($debug) {
                        $starline = $starline + "B"
                    } else {
                        $starline = $starline + " "
                    }
                }

                $starline = $starline + $spaceship.appearance1

                for ($i = (($spaceship.x + $spaceship.appearance1.Length)); $i -lt $windowWidth; $i++) {
                    if ($debug) {
                        $starline = $starline + "B"
                    } else {
                        $starline = $starline + " "
                    }
                }

                return $starline
            }
        }

        if ($star.pos -lt 1) {                                                                                              # star is out of bounds
            for ($i = 0; $i -lt $spaceship.x; $i++) {
                if ($debug) {
                    $starline = $starline + "O"
                } else {
                    $starline = $starline + " "
                }
            }

            $starline = $starline + $spaceship.appearance1

            for ($i = (($spaceship.x + $spaceship.appearance1.Length)); $i -lt $windowWidth; $i++) {
                if ($debug) {
                    $starline = $starline + "O"
                } else {
                    $starline = $starline + " "
                }
            }

            return $starline
        }
    } elseif (condition) {
        
    } elseif ($star.pos -lt 1) {                                                                                            # for non spacship rows
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

            if ($star.pos -eq $windowWidth){                                                                # Draw one space less, if the star is at maxium position
                for ($i = (($spaceship.x + $spaceship.appearance1.Length) + 1); $i -lt $star.pos; $i++) {
                    if ($debug) {
                        $starline = $starline + "R"
                    } else {
                        $starline = $starline + " "
                    }
                }
            } else {
                for ($i = (($spaceship.x + $spaceship.appearance1.Length)); $i -lt $star.pos; $i++) {
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