# Show all user log-ons for the past minute from remote machines

while ($true) {
    $now = Get-Date
    $then = $now.AddMinutes(-1)
    Get-WinEvent -Filterhashtable @{logname='security'; id='4624'; StartTime=$then; EndTime=$now} -ErrorAction SilentlyContinue | fl
    Start-Sleep -s 60
}