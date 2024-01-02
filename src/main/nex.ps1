function start-cmd(){
    try {
        # check the cmd process
        Get-Process -Name cmd -ErrorAction Stop
        Write-Host "process cmd exist"
    } catch {
        try {
            # checks if batchrc.bat exists *
            Start-Process $command -WindowStyle Maximized -ErrorAction Stop
        } catch {
            # otherwise run cmd instead of batchrc.bat *
            $command = "cmd"
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

$command = "C:/Users/$env:username/batchrc.bat"
if(!(test-path $command)){ 
    Write-Host "`a"
    $command = "cmd"
} 

start-check  