param(
    [Parameter(Mandatory = $true)]
    [string]$Task
)

Write-Host "Running task: $Task"

$script = ".\scripts\$Task.ps1"

if (-not (Test-Path $script)) {
    Write-Error "Task script not found: $script"
    exit 1
}

Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass -Force
& $script

Write-Host "Task completed: $Task"
