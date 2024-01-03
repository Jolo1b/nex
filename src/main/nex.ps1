[byte] $global:loadFail = 0

function start-cmd(){
    try {
        # check the cmd process
        Get-Process -Name cmd -ErrorAction Stop
    } catch {
        $global:loadFail++
        # checks that the script ran fine
        if($global:loadFail -ge 3){
            Start-Process cmd -WindowStyle Maximized
            $global:loadFail--
            return $null
        }
        
        try {
            # checks if batchrc.bat exists *
            Start-Process $global:command -WindowStyle Maximized -ErrorAction Stop
        } catch {
            # otherwise run cmd instead of batchrc.bat *
            $global:command = "cmd"
            start-cmd
        }   
    }
}

function start-check(){
    while($true){
        start-cmd
        Wait-Event -Timeout 10
    }
}

[string] $global:command = "C:/Users/$env:username/batchrc.bat"
if(!(test-path $global:command)){ 
    Write-Host "`a"
    $global:command = "cmd"
} 

start-check  