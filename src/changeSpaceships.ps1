function changeAppearance ([Spaceship] $spaceship) {
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

    #TODO
    #Animations for the other ships

}