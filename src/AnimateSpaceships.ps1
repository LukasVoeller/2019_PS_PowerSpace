function animateSpaceship ([Spaceship] $spaceship) {
    if ($spaceship.name -eq "Jet Engine I") {
        if ($spaceship.appearanceFrame -eq 0) {
            [String[]] $appearanceNew = $null
            $appearanceNew += @("   \--\")            # weaponPos/appearance 0
            $appearanceNew += @(" -=JE-I[O]>")        # weaponPos/appearance 1
            $appearanceNew += @("   /--/")            # weaponPos/appearance 2

            $spaceship.appearance = $appearanceNew
            $spaceship.appearanceFrame = 1
        } elseif ($spaceship.appearanceFrame -eq 1) {
            [String[]] $appearanceNew = $null
            $appearanceNew += @("   \--\")            # weaponPos/appearance 0
            $appearanceNew += @("-= JE-I[O]>")        # weaponPos/appearance 1
            $appearanceNew += @("   /--/")            # weaponPos/appearance 2

            $spaceship.appearance = $appearanceNew
            $spaceship.appearanceFrame = 2
        } elseif ($spaceship.appearanceFrame -eq 2) {
            [String[]] $appearanceNew = $null
            $appearanceNew += @("   \--\")            # weaponPos/appearance 0
            $appearanceNew += @("-  JE-I[O]>")        # weaponPos/appearance 1
            $appearanceNew += @("   /--/")            # weaponPos/appearance 2

            $spaceship.appearance = $appearanceNew
            $spaceship.appearanceFrame = 3
        } elseif ($spaceship.appearanceFrame -eq 3) {
            [String[]] $appearanceNew = $null
            $appearanceNew += @("   \--\")            # weaponPos/appearance 0
            $appearanceNew += @("   JE-I[O]>")        # weaponPos/appearance 1
            $appearanceNew += @("   /--/")            # weaponPos/appearance 2

            $spaceship.appearance = $appearanceNew
            $spaceship.appearanceFrame = 0
        }
    }

    if ($spaceship.name -eq "Jet Engine II") {
        if ($spaceship.appearanceFrame -eq 0) {
            [String[]] $appearanceNew = $null
            $appearanceNew += @("   \---\")           # weaponPos/appearance 0
            $appearanceNew += @(" -=JE-II\>")         # weaponPos/appearance 1
            $appearanceNew += @("     [   [O]")       # weaponPos/appearance 2
            $appearanceNew += @(" -=JE-II/>")         # weaponPos/appearance 3
            $appearanceNew += @("   /---/")           # weaponPos/appearance 4

            $spaceship.appearance = $appearanceNew
            $spaceship.appearanceFrame = 1
        } elseif ($spaceship.appearanceFrame -eq 1) {
            [String[]] $appearanceNew = $null
            $appearanceNew += @("   \---\")           # weaponPos/appearance 0
            $appearanceNew += @("-= JE-II\>")         # weaponPos/appearance 1
            $appearanceNew += @("     [   [O]")       # weaponPos/appearance 2
            $appearanceNew += @("-= JE-II/>")         # weaponPos/appearance 3
            $appearanceNew += @("   /---/")           # weaponPos/appearance 4

            $spaceship.appearance = $appearanceNew
            $spaceship.appearanceFrame = 2
        } elseif ($spaceship.appearanceFrame -eq 2) {
            [String[]] $appearanceNew = $null
            $appearanceNew += @("   \---\")           # weaponPos/appearance 0
            $appearanceNew += @("-  JE-II\>")         # weaponPos/appearance 1
            $appearanceNew += @("     [   [O]")       # weaponPos/appearance 2
            $appearanceNew += @("-  JE-II/>")         # weaponPos/appearance 3
            $appearanceNew += @("   /---/")           # weaponPos/appearance 4

            $spaceship.appearance = $appearanceNew
            $spaceship.appearanceFrame = 3
        } elseif ($spaceship.appearanceFrame -eq 3) {
            [String[]] $appearanceNew = $null
            $appearanceNew += @("   \---\")           # weaponPos/appearance 0
            $appearanceNew += @("   JE-II\>")         # weaponPos/appearance 1
            $appearanceNew += @("     [   [O]")       # weaponPos/appearance 2
            $appearanceNew += @("   JE-II/>")         # weaponPos/appearance 3
            $appearanceNew += @("   /---/")           # weaponPos/appearance 4

            $spaceship.appearance = $appearanceNew
            $spaceship.appearanceFrame = 0
        }
    }

    if ($spaceship.name -eq "Jet Engine III") {
        if ($spaceship.appearanceFrame -eq 0) {
            [String[]] $appearanceNew = $null
            $appearanceNew += @("   \----\")          # weaponPos/appearance 0
            $appearanceNew += @(" -=JE-III\>")        # weaponPos/appearance 1
            $appearanceNew += @("     [    [O]")      # weaponPos/appearance 2
            $appearanceNew += @("  -=JE-III-|>")      # weaponPos/appearance 3
            $appearanceNew += @("     [    [O]")      # weaponPos/appearance 4
            $appearanceNew += @(" -=JE-III/>")        # weaponPos/appearance 5
            $appearanceNew += @("   /----/")          # weaponPos/appearance 6

            $spaceship.appearance = $appearanceNew
            $spaceship.appearanceFrame = 1
        } elseif ($spaceship.appearanceFrame -eq 1) {
            [String[]] $appearanceNew = $null
            $appearanceNew += @("   \----\")          # weaponPos/appearance 0
            $appearanceNew += @("-= JE-III\>")        # weaponPos/appearance 1
            $appearanceNew += @("     [    [O]")      # weaponPos/appearance 2
            $appearanceNew += @(" -= JE-III-|>")      # weaponPos/appearance 3
            $appearanceNew += @("     [    [O]")      # weaponPos/appearance 4
            $appearanceNew += @("-= JE-III/>")        # weaponPos/appearance 5
            $appearanceNew += @("   /----/")          # weaponPos/appearance 6

            $spaceship.appearance = $appearanceNew
            $spaceship.appearanceFrame = 2
        } elseif ($spaceship.appearanceFrame -eq 2) {
            [String[]] $appearanceNew = $null
            $appearanceNew += @("   \----\")          # weaponPos/appearance 0
            $appearanceNew += @("-  JE-III\>")        # weaponPos/appearance 1
            $appearanceNew += @("     [    [O]")      # weaponPos/appearance 2
            $appearanceNew += @(" -  JE-III-|>")      # weaponPos/appearance 3
            $appearanceNew += @("     [    [O]")      # weaponPos/appearance 4
            $appearanceNew += @("-  JE-III/>")        # weaponPos/appearance 5
            $appearanceNew += @("   /----/")          # weaponPos/appearance 6

            $spaceship.appearance = $appearanceNew
            $spaceship.appearanceFrame = 3
        } elseif ($spaceship.appearanceFrame -eq 3) {
            [String[]] $appearanceNew = $null
            $appearanceNew += @("   \----\")          # weaponPos/appearance 0
            $appearanceNew += @("   JE-III\>")        # weaponPos/appearance 1
            $appearanceNew += @("     [    [O]")      # weaponPos/appearance 2
            $appearanceNew += @("    JE-III-|>")      # weaponPos/appearance 3
            $appearanceNew += @("     [    [O]")      # weaponPos/appearance 4
            $appearanceNew += @("   JE-III/>")        # weaponPos/appearance 5
            $appearanceNew += @("   /----/")          # weaponPos/appearance 6

            $spaceship.appearance = $appearanceNew
            $spaceship.appearanceFrame = 0
        }
    }

    if ($spaceship.name -eq "Heavy Cruiser") {
        if ($spaceship.appearanceFrame -eq 0) {
            [String[]] $appearanceNew = $null
            $appearanceNew += @("     _______")                     # weaponPos/appearance 0
            $appearanceNew += @("    / \\\___\________")            # weaponPos/appearance 1
            $appearanceNew += @(" O OO0 |||___|___\\__\__")         # weaponPos/appearance 2
            $appearanceNew += @("    \_///___/_|     \_\_\\-")      # weaponPos/appearance 3
            $appearanceNew += @("    / \\\___\_|_____/_/_//-")      # weaponPos/appearance 4
            $appearanceNew += @(" O OO0 |||___|___//__/")           # weaponPos/appearance 5
            $appearanceNew += @("    \_///___/")                    # weaponPos/appearance 6

            $spaceship.appearance = $appearanceNew
            $spaceship.appearanceFrame = 1
        } elseif ($spaceship.appearanceFrame -eq 1) {
            [String[]] $appearanceNew = $null
            $appearanceNew += @("     _______")                     # weaponPos/appearance 0
            $appearanceNew += @("    / \\\___\________")            # weaponPos/appearance 1
            $appearanceNew += @("O OO 0 |||___|___\\__\__")         # weaponPos/appearance 2
            $appearanceNew += @("    \_///___/_|     \_\_\\-")      # weaponPos/appearance 3
            $appearanceNew += @("    / \\\___\_|_____/_/_//-")      # weaponPos/appearance 4
            $appearanceNew += @("O OO 0 |||___|___//__/")           # weaponPos/appearance 5
            $appearanceNew += @("    \_///___/")                    # weaponPos/appearance 6

            $spaceship.appearance = $appearanceNew
            $spaceship.appearanceFrame = 2
        } elseif ($spaceship.appearanceFrame -eq 2) {
            [String[]] $appearanceNew = $null
            $appearanceNew += @("     _______")                     # weaponPos/appearance 0
            $appearanceNew += @("    / \\\___\________")            # weaponPos/appearance 1
            $appearanceNew += @(" OO  0 |||___|___\\__\__")         # weaponPos/appearance 2
            $appearanceNew += @("    \_///___/_|     \_\_\\-")      # weaponPos/appearance 3
            $appearanceNew += @("    / \\\___\_|_____/_/_//-")      # weaponPos/appearance 4
            $appearanceNew += @(" OO  0 |||___|___//__/")           # weaponPos/appearance 5
            $appearanceNew += @("    \_///___/")                    # weaponPos/appearance 6

            $spaceship.appearance = $appearanceNew
            $spaceship.appearanceFrame = 3
        } elseif ($spaceship.appearanceFrame -eq 3) {
            [String[]] $appearanceNew = $null
            $appearanceNew += @("     _______")                     # weaponPos/appearance 0
            $appearanceNew += @("    / \\\___\________")            # weaponPos/appearance 1
            $appearanceNew += @("OO   0 |||___|___\\__\__")         # weaponPos/appearance 2
            $appearanceNew += @("    \_///___/_|     \_\_\\-")      # weaponPos/appearance 3
            $appearanceNew += @("    / \\\___\_|_____/_/_//-")      # weaponPos/appearance 4
            $appearanceNew += @("OO   0 |||___|___//__/")           # weaponPos/appearance 5
            $appearanceNew += @("    \_///___/")                    # weaponPos/appearance 6

            $spaceship.appearance = $appearanceNew
            $spaceship.appearanceFrame = 4
        } elseif ($spaceship.appearanceFrame -eq 4) {
            [String[]] $appearanceNew = $null
            $appearanceNew += @("     _______")                     # weaponPos/appearance 0
            $appearanceNew += @("    / \\\___\________")            # weaponPos/appearance 1
            $appearanceNew += @("O    0 |||___|___\\__\__")         # weaponPos/appearance 2
            $appearanceNew += @("    \_///___/_|     \_\_\\-")      # weaponPos/appearance 3
            $appearanceNew += @("    / \\\___\_|_____/_/_//-")      # weaponPos/appearance 4
            $appearanceNew += @("O    0 |||___|___//__/")           # weaponPos/appearance 5
            $appearanceNew += @("    \_///___/")                    # weaponPos/appearance 6

            $spaceship.appearance = $appearanceNew
            $spaceship.appearanceFrame = 5
        } elseif ($spaceship.appearanceFrame -eq 5) {
            [String[]] $appearanceNew = $null
            $appearanceNew += @("     _______")                     # weaponPos/appearance 0
            $appearanceNew += @("    / \\\___\________")            # weaponPos/appearance 1
            $appearanceNew += @("     0 |||___|___\\__\__")         # weaponPos/appearance 2
            $appearanceNew += @("    \_///___/_|     \_\_\\-")      # weaponPos/appearance 3
            $appearanceNew += @("    / \\\___\_|_____/_/_//-")      # weaponPos/appearance 4
            $appearanceNew += @("     0 |||___|___//__/")           # weaponPos/appearance 5
            $appearanceNew += @("    \_///___/")                    # weaponPos/appearance 6

            $spaceship.appearance = $appearanceNew
            $spaceship.appearanceFrame = 0
        }
    }
}