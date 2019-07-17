class Player {
    [string] $name = $null
    [Spaceship] $spaceship = $null
    [int] $credits = 0

    Player ([String] $newName) {
        $this.name = $newName
    }
}

class Spaceship {
    [string] $name = $null
    [int] $hp = $null
    [int] $moveSpeed = 1

    [String[]] $appearance = $null
    [int] $appearanceFrame = 0
    [int] $weaponCount = $null
    [int[]] $weaponPos = $null
    
    [int] $width
    [int] $height
    [int] $x = 10
    [int] $y = 10

    Spaceship ([int] $newWeaponCount, [int[]] $newWeaponPos, [String[]] $newAppearance, [String] $newName, [int] $newHp, [int] $newX, [int] $newY) {
        $this.name = $newName
        $this.hp = $newHp

        $this.appearance = $newAppearance
        $this.weaponCount = $newWeaponCount
        $this.weaponPos = $newWeaponPos

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
    [bool] $fired = $false

    [int] $x
    [int] $y
    
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
    [string] $name = $null
    [String[]] $appearance = $null
    [int] $hp
    [int] $width
    [int] $height
    [int] $x = 30
    [int] $y = 10

    Asteroid ([int] $newX, [int] $newY) {
        $this.x = $newX
        $this.y = $newY

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