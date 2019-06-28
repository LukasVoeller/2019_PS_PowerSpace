function createStarline ([Star] $star, [Spaceship] $spaceship, $row) {
    $windowWidth = $Host.UI.RawUI.WindowSize.Width
    $windowHeight = $Host.UI.RawUI.WindowSize.Height
    $starline = ""

    # Handeling the lines without a star ------------------------------------------------------------------------------------
    if ($row -eq $spaceship.y) {                                                                                            # First spaceship line
        for ($i = 0; $i -lt $spaceship.appearance1.Length; $i++) {
            if ($star.pos -eq ($spaceship.x + $i)) {                                                                        # star is a the same position the ship is
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
    } elseif ($row -eq ($spaceship.y + 1)) {                                                                                # Second spaceship line
        for ($i = 0; $i -lt $spaceship.appearance2.Length; $i++) {
            if ($star.pos -eq ($spaceship.x + $i)) {                                                                        # star is a the same position the ship is
                for ($i = 0; $i -lt $spaceship.x; $i++) {
                    if ($debug) {
                        $starline = $starline + "B"
                    } else {
                        $starline = $starline + " "
                    }
                }

                $starline = $starline + $spaceship.appearance2

                for ($i = (($spaceship.x + $spaceship.appearance2.Length)); $i -lt $windowWidth; $i++) {
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

            $starline = $starline + $spaceship.appearance2

            for ($i = (($spaceship.x + $spaceship.appearance2.Length)); $i -lt $windowWidth; $i++) {
                if ($debug) {
                    $starline = $starline + "O"
                } else {
                    $starline = $starline + " "
                }
            }

            return $starline
        }
    } elseif ($row -eq ($spaceship.y + 2)) {                                                                                # Third spaceship line
        for ($i = 0; $i -lt $spaceship.appearance3.Length; $i++) {
            if ($star.pos -eq ($spaceship.x + $i)) {                                                                        # star is a the same position the ship is
                for ($i = 0; $i -lt $spaceship.x; $i++) {
                    if ($debug) {
                        $starline = $starline + "B"
                    } else {
                        $starline = $starline + " "
                    }
                }

                $starline = $starline + $spaceship.appearance3

                for ($i = (($spaceship.x + $spaceship.appearance3.Length)); $i -lt $windowWidth; $i++) {
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

            $starline = $starline + $spaceship.appearance3

            for ($i = (($spaceship.x + $spaceship.appearance3.Length)); $i -lt $windowWidth; $i++) {
                if ($debug) {
                    $starline = $starline + "O"
                } else {
                    $starline = $starline + " "
                }
            }

            return $starline
        }
    } elseif ($row -eq ($spaceship.y +3)) {                                                                                 # Fourth spaceship line
        for ($i = 0; $i -lt $spaceship.appearance4.Length; $i++) {
            if ($star.pos -eq ($spaceship.x + $i)) {                                                                        # star is a the same position the ship is
                for ($i = 0; $i -lt $spaceship.x; $i++) {
                    if ($debug) {
                        $starline = $starline + "B"
                    } else {
                        $starline = $starline + " "
                    }
                }

                $starline = $starline + $spaceship.appearance4

                for ($i = (($spaceship.x + $spaceship.appearance4.Length)); $i -lt $windowWidth; $i++) {
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

            $starline = $starline + $spaceship.appearance4

            for ($i = (($spaceship.x + $spaceship.appearance4.Length)); $i -lt $windowWidth; $i++) {
                if ($debug) {
                    $starline = $starline + "O"
                } else {
                    $starline = $starline + " "
                }
            }

            return $starline
        }
    } elseif ($row -eq ($spaceship.y +4)) {                                                                                 # Fifth spaceship line
        for ($i = 0; $i -lt $spaceship.appearance5.Length; $i++) {
            if ($star.pos -eq ($spaceship.x + $i)) {                                                                        # star is a the same position the ship is
                for ($i = 0; $i -lt $spaceship.x; $i++) {
                    if ($debug) {
                        $starline = $starline + "B"
                    } else {
                        $starline = $starline + " "
                    }
                }

                $starline = $starline + $spaceship.appearance5

                for ($i = (($spaceship.x + $spaceship.appearance5.Length)); $i -lt $windowWidth; $i++) {
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

            $starline = $starline + $spaceship.appearance5

            for ($i = (($spaceship.x + $spaceship.appearance5.Length)); $i -lt $windowWidth; $i++) {
                if ($debug) {
                    $starline = $starline + "O"
                } else {
                    $starline = $starline + " "
                }
            }

            return $starline
        }
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
    
    # Main Handle -----------------------------------------------------------------------------------------------------------
    if ($row -eq $spaceship.y) {                                                                                            # First spaceship line
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

            $starline = $starline + $spaceship.appearance1

            for ($i = ($spaceship.x + $spaceship.appearance1.Length); $i -lt $windowWidth; $i++) {
                if ($debug) {
                    $starline = $starline + "L"
                } else {
                    $starline = $starline + " "
                }
            }
        } elseif ($star.pos -ge ($spaceship.x + $spaceship.appearance1.Length)) {                                           # the star is in front of the ship
            for ($i = 0; $i -lt $spaceship.x; $i++) {
                if ($debug) {
                    $starline = $starline + "R"
                } else {
                    $starline = $starline + " "
                }
            }

            $starline = $starline + $spaceship.appearance1

            if ($star.pos -eq $windowWidth){                                                                                # Draw one space less, if the star is at maxium position
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
    } elseif ($row -eq ($spaceship.y + 1)) {                                                                                # Second spaceship line
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

            $starline = $starline + $spaceship.appearance2

            for ($i = ($spaceship.x + $spaceship.appearance2.Length); $i -lt $windowWidth; $i++) {
                if ($debug) {
                    $starline = $starline + "L"
                } else {
                    $starline = $starline + " "
                }
            }
        } elseif ($star.pos -ge ($spaceship.x + $spaceship.appearance2.Length)) {                                           # the star is in front of the ship
            for ($i = 0; $i -lt $spaceship.x; $i++) {
                if ($debug) {
                    $starline = $starline + "R"
                } else {
                    $starline = $starline + " "
                }
            }

            $starline = $starline + $spaceship.appearance2

            if ($star.pos -eq $windowWidth){                                                                                # Draw one space less, if the star is at maxium position
                for ($i = (($spaceship.x + $spaceship.appearance2.Length) + 1); $i -lt $star.pos; $i++) {
                    if ($debug) {
                        $starline = $starline + "R"
                    } else {
                        $starline = $starline + " "
                    }
                }
            } else {
                for ($i = (($spaceship.x + $spaceship.appearance2.Length)); $i -lt $star.pos; $i++) {
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
    } elseif ($row -eq ($spaceship.y + 2)) {                                                                                # Third spaceship line
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

            $starline = $starline + $spaceship.appearance3

            for ($i = ($spaceship.x + $spaceship.appearance3.Length); $i -lt $windowWidth; $i++) {
                if ($debug) {
                    $starline = $starline + "L"
                } else {
                    $starline = $starline + " "
                }
            }
        } elseif ($star.pos -ge ($spaceship.x + $spaceship.appearance3.Length)) {                                           # the star is in front of the ship
            for ($i = 0; $i -lt $spaceship.x; $i++) {
                if ($debug) {
                    $starline = $starline + "R"
                } else {
                    $starline = $starline + " "
                }
            }

            $starline = $starline + $spaceship.appearance3

            if ($star.pos -eq $windowWidth){                                                                                # Draw one space less, if the star is at maxium position
                for ($i = (($spaceship.x + $spaceship.appearance3.Length) + 1); $i -lt $star.pos; $i++) {
                    if ($debug) {
                        $starline = $starline + "R"
                    } else {
                        $starline = $starline + " "
                    }
                }
            } else {
                for ($i = (($spaceship.x + $spaceship.appearance3.Length)); $i -lt $star.pos; $i++) {
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
    } elseif ($row -eq ($spaceship.y + 3)) {                                                                                # Fourth spaceship line
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

            $starline = $starline + $spaceship.appearance4

            for ($i = ($spaceship.x + $spaceship.appearance4.Length); $i -lt $windowWidth; $i++) {
                if ($debug) {
                    $starline = $starline + "L"
                } else {
                    $starline = $starline + " "
                }
            }
        } elseif ($star.pos -ge ($spaceship.x + $spaceship.appearance4.Length)) {                                           # the star is in front of the ship
            for ($i = 0; $i -lt $spaceship.x; $i++) {
                if ($debug) {
                    $starline = $starline + "R"
                } else {
                    $starline = $starline + " "
                }
            }

            $starline = $starline + $spaceship.appearance4

            if ($star.pos -eq $windowWidth){                                                                                # Draw one space less, if the star is at maxium position
                for ($i = (($spaceship.x + $spaceship.appearance4.Length) + 1); $i -lt $star.pos; $i++) {
                    if ($debug) {
                        $starline = $starline + "R"
                    } else {
                        $starline = $starline + " "
                    }
                }
            } else {
                for ($i = (($spaceship.x + $spaceship.appearance4.Length)); $i -lt $star.pos; $i++) {
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
    } elseif ($row -eq ($spaceship.y + 4)) {                                                                                # Fifth spaceship line
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

            $starline = $starline + $spaceship.appearance5

            for ($i = ($spaceship.x + $spaceship.appearance5.Length); $i -lt $windowWidth; $i++) {
                if ($debug) {
                    $starline = $starline + "L"
                } else {
                    $starline = $starline + " "
                }
            }
        } elseif ($star.pos -ge ($spaceship.x + $spaceship.appearance5.Length)) {                                           # the star is in front of the ship
            for ($i = 0; $i -lt $spaceship.x; $i++) {
                if ($debug) {
                    $starline = $starline + "R"
                } else {
                    $starline = $starline + " "
                }
            }

            $starline = $starline + $spaceship.appearance5

            if ($star.pos -eq $windowWidth){                                                                                # Draw one space less, if the star is at maxium position
                for ($i = (($spaceship.x + $spaceship.appearance5.Length) + 1); $i -lt $star.pos; $i++) {
                    if ($debug) {
                        $starline = $starline + "R"
                    } else {
                        $starline = $starline + " "
                    }
                }
            } else {
                for ($i = (($spaceship.x + $spaceship.appearance5.Length)); $i -lt $star.pos; $i++) {
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
    } elseif ($row -eq ($spaceship.y + 1)) {                                                                                # Second spaceship line
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

            $starline = $starline + $spaceship.appearance2

            for ($i = ($spaceship.x + $spaceship.appearance2.Length); $i -lt $windowWidth; $i++) {
                if ($debug) {
                    $starline = $starline + "L"
                } else {
                    $starline = $starline + " "
                }
            }
        } elseif ($star.pos -ge ($spaceship.x + $spaceship.appearance2.Length)) {                                           # the star is in front of the ship
            for ($i = 0; $i -lt $spaceship.x; $i++) {
                if ($debug) {
                    $starline = $starline + "R"
                } else {
                    $starline = $starline + " "
                }
            }

            $starline = $starline + $spaceship.appearance2

            if ($star.pos -eq $windowWidth){                                                                                # Draw one space less, if the star is at maxium position
                for ($i = (($spaceship.x + $spaceship.appearance2.Length) + 1); $i -lt $star.pos; $i++) {
                    if ($debug) {
                        $starline = $starline + "R"
                    } else {
                        $starline = $starline + " "
                    }
                }
            } else {
                for ($i = (($spaceship.x + $spaceship.appearance2.Length)); $i -lt $star.pos; $i++) {
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