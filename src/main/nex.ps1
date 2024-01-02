function start-cmd(){
    try {
        Get-Process -Name cmd -ErrorAction Stop
        Write-Host "process cmd exist"
    } catch {
        Start-Process $command -WindowStyle Maximized
    }
}

function start-check(){
    start-cmd

    while($true){
        start-cmd
        Wait-Event -Timeout 10
    }
}

$command = "C:/Users/$env:username/batchrc.bat"
if(test-path $command){
    start-check   
} else {
    Write-Host "`a"
    $command = "cmd"
    start-check    
}