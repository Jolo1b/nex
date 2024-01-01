while($true){
    if(Get-Process -Name cmd){
        Write-Host "process cmd exist"
    } else {
        Start-Process cmd -WindowStyle Maximized
    }

    Wait-Event -Timeout 15
}