function Invoke-writeProgess {
<#
.SYNOPSIS
    Displays a rotating progress message.

.DESCRIPTION
    This function displays a rotating progress message on the console. The rotation is achieved by cycling through two arrays of symbols.

.PARAMETER Message
    The message to display next to the rotating symbol.

.PARAMETER RotatingSymbol
    The first array of symbols to cycle through for the rotation. If no array is provided, the default symbols are '|', '/', '-', and '\'.

.PARAMETER SecondRotatingSymbol
    The second array of symbols to cycle through for the rotation after the first array. 

.PARAMETER LoopCount
    The number of times to cycle through the rotating symbols. If no value is provided, the default is 1.

.EXAMPLE
    Invoke-writeProgess -Message "Processing..." -RotatingSymbol @('🌑', '🌒', '🌓', '🌔', '🌕', '🌖', '🌗', '🌘') -SecondRotatingSymbol @('❤️', '🧡', '💛', '💚') -LoopCount 2

    This command will display a rotating progress message that cycles through the phases of the moon emoji and number emojis five times.
#>

    [CmdletBinding()]
    param (
        [string]$Message,
        [string[]]$RotatingSymbol = @("|","/","-","\"),
        [string[]]$SecondRotatingSymbol = @('❤️', '🧡', '💛', '💚'),
        [int]$LoopCount = 1
    )
    
    begin {
        $Emptystring = " " * [Console]::WindowWidth
    }
    
    process {
        for($k = 0; $k -lt $SecondRotatingSymbol.Count; $k++) {
            for($j = 0; $j -lt $LoopCount; $j++) {
                #will make your progressline fancy
                for($i = 0; $i -lt $RotatingSymbol.Count; $i++) {
                    Write-Host "`r$Emptystring" -NoNewline
                    Write-Host "`r[$($Rotatingsymbol[$i])$Message $($SecondRotatingsymbol[$k])]" -NoNewline
                    Start-Sleep -Milliseconds 100
                }
            }
        }
    }
}
