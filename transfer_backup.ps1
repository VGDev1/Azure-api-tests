## ssh into the vm, using variable ip
  
param (
    [string]$ip,
    [string]$Username = "tetra",
    [string]$Password = "password"
    [string]$SourceFile = "encrypted_backup.json",
    [string]$DestinationPath "/home/tetra/backup.json"
)

# Check if the IP address is provided
if (-not $IPAddress) {
    Write-Host "Please provide an IP address using the -IPAddress parameter."
    exit 1
}

$sshCommand = "ssh -l $Username -pw $Password $Username@$IPAddress"
$scpCommand = "scp -l $Username -pw $Password $SourceFile $Username@$IPAddress:`"$DestinationPath`""
$dcpCommand = "docker cp $DestinationPath edgeAgent:/tmp/edgeAgent/backup.json"
$exitCommand = "exit"


# You can execute the SSH command here, e.g., using Invoke-Expression
# Invoke-Expression $sshCommand
Write-Host "SCP command: $scpCommand"
Write-Host "SSH command: $sshCommand"
Write-Host "DCP command: $dcpCommand"
Write-Host "Exit command: $exitCommand"









