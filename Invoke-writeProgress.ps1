
function Invoke-writeProgess {
<#
.SYNOPSIS
    Displays a rotating progress message.

.DESCRIPTION
    This function displays a rotating progress message on the console. The rotation is achieved by cycling through two arrays of symbols.
    Additionally, this function now supports multiple stages of processing messages which change with each rotation of the second symbol.

.PARAMETER Message
    An array of messages to display next to the rotating symbol.

.PARAMETER RotatingSymbol
    The first array of symbols to cycle through for the rotation. If no array is provided, the default symbols are '|', '/', '-', and '\'.

.PARAMETER SecondRotatingSymbol
    The second array of symbols to cycle through for the rotation after the first array. 

.PARAMETER LoopCount
    The number of times to cycle through the rotating symbols. If no value is provided, the default is 1.

.EXAMPLE
    Invoke-writeProgess -Message @('Processing Stage 1...', 'Processing Stage 2...', 'Processing Stage 3...') -RotatingSymbol @('🌑', '🌒', '🌓', '🌔') -SecondRotatingSymbol @('❤️', '🧡', '💛') -LoopCount 2

    This command will display a rotating progress message that cycles through phases of the moon emojis and heart emojis with the provided messages.
#>
    [CmdletBinding()]
    param (
        [string[]]$Message,  # Array of messages to display
        [string[]]$RotatingSymbol = @("|","/","-","\"),  # First rotating symbol set
        [string[]]$SecondRotatingSymbol = @('❤️', '🧡', '💛', '💚', '💙', '💜'),  # Second rotating symbol set
        [int]$LoopCount = 1  # Number of times to rotate through symbols
    )
    
    begin {
        $Emptystring = " " * [Console]::WindowWidth  # Create an empty string as wide as the console
    }
    
    process {
        if ($Message.Count -ne $SecondRotatingSymbol.Count) {
            throw "Message array and SecondRotatingSymbol array must have the same length."  # Check that the number of messages matches the number of second rotating symbols
        }

        for($k = 0; $k -lt $SecondRotatingSymbol.Count; $k++) {
            for($j = 0; $j -lt $LoopCount; $j++) {
                for($i = 0; $i -lt $RotatingSymbol.Count; $i++) {
                    Write-Host "`r$Emptystring" -NoNewline  # Clear the current line
                    Write-Host "`r[$($Rotatingsymbol[$i]) $($Message[$k].PadRight(20)) $($SecondRotatingsymbol[$k])]" -NoNewline  # Write the current symbol, message, and second symbol

                    Start-Sleep -Milliseconds 100  # Pause before the next iteration
                }
            }
        }
    }
}
