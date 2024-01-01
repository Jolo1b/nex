function check-cmd(){
    try {
        Get-Process -Name cmd -ErrorAction Stop
        Write-Host "process cmd exist"
    } catch {
        Start-Process $command -WindowStyle Maximized
    }
}

$command = "C:/Users/$env:username/batchrc.bat"
if(test-path "C:/Users/$env:username/batchrc.bat"){
    check-cmd

    while($true){
        check-cmd
        Wait-Event -Timeout 10
    }
} else {
    Write-Host "`a"
    Wait-Event -Timeout 1
    Write-Host "`a"
    Wait-Event -Timeout 1
    Write-Host "`a"
    Wait-Event -Timeout 1
    Write-Host "`a"
    Wait-Event -Timeout 1
    Write-Host "`a"
}