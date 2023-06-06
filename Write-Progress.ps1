function Write-Progess {
    [CmdletBinding()]
    param (
        $Message
    )
    
    begin {
        $RotatingSymbol = @("|","/","-","\")
        $Emptystring =" " * [Console]::WindowWidth
    }
    
    process {
        #will make your progressline fancy
        if($Script:LastIndexSymbol -eq $null){
            $Script:LastIndexSymbol = 0
        }
        
        Write-Host "`r$emptystring" -NoNewline
        Write-Host "`r[$($Rotatingsymbol[$($Script:LastIndexSymbol)])]$Message" -NoNewline
        $Script:LastIndexSymbol+=1
        if($Script:LastIndexSymbol -eq $RotatingSymbol.Count){
            $Script:LastIndexSymbol = 0
        }
    }
    
    end {
        
    }
}
