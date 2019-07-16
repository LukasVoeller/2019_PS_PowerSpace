class Player {
    [string] $name = $null
    [int] $credits
    [Spaceship] $spaceship = $null

    Player ([String] $newName) {
        $this.name = $newName
    }
}

class Spaceship {
    [string] $name = $null
    [String[]] $appearance = $null
    [int] $appearanceFrame = 0
    [int[]] $weaponPos = $null
    [int] $weaponCount = $null
    [int] $width
    [int] $height
    [int] $x = 10
    [int] $y = 10

    Spaceship ([int] $newWeaponCount, [int[]] $newWeaponPos, [String[]] $newAppearance, [String] $newName, [int] $newX, [int] $newY) {
        $this.weaponCount = $newWeaponCount
        $this.weaponPos = $newWeaponPos

        $this.appearance = $newAppearance
        $this.name = $newName

        $this.x = $newX
        $this.y = $newY

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

class Shot {
    [string] $appearance = ">"
    [int] $moveSpeed = 2
    [int] $x
    [int] $y
    [bool] $fired = $false

    Shot ([int] $newX, [int] $newY) {
        $this.x = $newX
        $this.y = $newY
    }
}

class Star {
    [string] $appearance = "*"
    [int] $moveSpeed = 1
    [int] $pos

    Star ([int] $posNew) {
        $this.pos = $posNew
    }
}

class Asteroid {
    [String[]] $appearance = $null
    [int] $width
    [int] $height
    [int] $x = 30
    [int] $y = 10

    Asteroid ([int] $newX, [int] $newY) {
        $this.x = $newX
        $this.y = $newY

        $this.appearance += @("  ____")
        $this.appearance += @(" /. _I\")
        $this.appearance += @("|  - -_}")
        $this.appearance += @(" \_I-_/")

        $largestRow = 0                                                     # Determine the width of the asteroid by the largest row
        for ($i = 0; $i -lt $this.appearance.Length; $i++) {
            if ($this.appearance[$i].Length -gt $largestRow) {
                $largestRow = $this.appearance[$i].Length
            }
        }

        $this.width = $largestRow
        $this.height = $this.appearance.Length
    }
}