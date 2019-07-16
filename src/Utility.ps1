function setWindowSize {
    $pshost = get-host
    $pswindow = $pshost.ui.rawui

    if ($pswindow.windowsize.Width -lt 120) {
        $newsize = $pswindow.buffersize
        $newsize.height = 3000
        $newsize.width = 120
        $pswindow.buffersize = $newsize
    }
    
    $newsize = $pswindow.windowsize
    $newsize.height = 40
    $newsize.width = 120
    $pswindow.windowsize = $newsize
}

function dotNumber ([int] $number) {
    $numberDotted = ""
    $numberString = $number.ToString()

    if ($number -ge 1000 -and $number -lt 10000) {
        $numberDotted = $numberDotted + $numberString.subString(0,1)
        $numberDotted = $numberDotted + "."
        $numberDotted = $numberDotted + $numberString.subString(1,3)
    } elseif ($number -ge 10000 -and $number -lt 100000) {
        $numberDotted = $numberDotted + $numberString.subString(0,2)
        $numberDotted = $numberDotted + "."
        $numberDotted = $numberDotted + $numberString.subString(2,3)
    } elseif ($number -ge 100000 -and $number -lt 1000000) {
        $numberDotted = $numberDotted + $numberString.subString(0,3)
        $numberDotted = $numberDotted + "."
        $numberDotted = $numberDotted + $numberString.subString(2,3)
    } elseif ($number -ge 1000000 -and $number -lt 10000000) {
        $numberDotted = $numberDotted + $numberString.subString(0,1)
        $numberDotted = $numberDotted + "."
        $numberDotted = $numberDotted + $numberString.subString(1,3)
        $numberDotted = $numberDotted + "."
        $numberDotted = $numberDotted + $numberString.subString(4,3)
    } elseif ($number -ge 10000000 -and $number -lt 100000000) {
        $numberDotted = $numberDotted + $numberString.subString(0,2)
        $numberDotted = $numberDotted + "."
        $numberDotted = $numberDotted + $numberString.subString(2,3)
        $numberDotted = $numberDotted + "."
        $numberDotted = $numberDotted + $numberString.subString(5,3)
    } elseif ($number -ge 100000000 -and $number -lt 1000000000) {
        $numberDotted = $numberDotted + $numberString.subString(0,3)
        $numberDotted = $numberDotted + "."
        $numberDotted = $numberDotted + $numberString.subString(3,3)
        $numberDotted = $numberDotted + "."
        $numberDotted = $numberDotted + $numberString.subString(6,3)
    }

    return $numberDotted
}