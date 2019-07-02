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
    [int[]] $weaponPos = $null
    [int] $weaponCount = 1
    [int] $width
    [int] $height
    [int]$x = 10
    [int]$y = 10

    Spaceship ([String] $newName, [int] $newX, [int] $newY) {
        $this.name = $newName
        $this.x = $newX
        $this.y = $newY

        $this.appearance += @("JE-I\")          # weaponPos 0
        $this.appearance += @(" [  [O]=")       # weaponPos 1
        $this.appearance += @("JE-I/")          # weaponPos 2

        $this.weaponPos += @(1)

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