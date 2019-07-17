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

}