## ssh into the vm, using variable ip
  
param (
    [string]$ip,
    [string]$Username = "tetra",
    [string]$Password = "password",
    [string]$SourceFile = "encrypted_backup.json",
    [string]$DestinationPath = "/home/tetra/backup.json"
)

# Check if the IP address is provided
if (-not $ip) {
    Write-Host "Please provide an IP address using the -IPAddress parameter."
    exit 1
}

$sshCommand = "ssh $Username@$ip 'sudo docker cp /home/tetra/backup.json edgeAgent:/tmp/edgeAgent/backup.json'"
$scpCommand = "scp $SourceFile $Username@${ip}:$DestinationPath"
$exitCommand = "exit"


# You can execute the SSH command here, e.g., using Invoke-Expression
# Invoke-Expression $sshCommand
Invoke-Expression "python main.py"
Write-Host "SCP command: $scpCommand"
Invoke-Expression $scpCommand
Write-Host "SSH command: $sshCommand"
Invoke-Expression $sshCommand
Write-Host "Exit command: $exitCommand"
Invoke-Expression $exitCommand
#run scp command







