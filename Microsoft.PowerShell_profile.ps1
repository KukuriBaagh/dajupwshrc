# Aliases

Set-Alias ls dir


# Oh-My-Posh Windows 11

# source your config file
## Prompt Theme
oh-my-posh init pwsh --config 'C:/Users/dajupahadi/Documents/Powershell/omps/night-owl.omp.json' | Invoke-Expression
## Terminal Icons
Import-Module -Name Terminal-Icons

# List all entries
# Get-HostEntry
# # List matching entries
# Get-HostEntry *.local
# Get-HostEntry mysite.local

# # Test if an entry exists
# Test-HostEntry mysite.local

# # Add a localhost entry
# Add-HostEntry mysite.local -Loopback

# # Add a specific entry
# Add-HostEntry mysite.local 192.168.1.1

# # Change an entry's IP address
# Set-HostEntry mysite.local 127.0.0.2

# # Add a comment
# Set-HostEntry mysite.local -Comment Excellent

# # Rename a host
# Get-HostEntry mysite.local | Set-HostEntry mysite2.local

# # Disable (comment out) entries
# Disable-HostEntry mysite.local

# # Enable (uncomment) entries
# Enable-HostEntry mysite.local

# # Remove entries
# Remove-HostEntry mysite.local

# # Remove matching entries
# Remove-HostEntry *.local

# # Disable all loopback entries
# Get-HostEntry | ?{$_.IsLoopback} | Disable-HostEntry

if ($host.Name -eq 'ConsoleHost' -or $host.Name -eq 'Visual Studio Code Host' ) {

  Import-Module PSReadline
  Set-PSReadLineOption -EditMode Windows
  Set-PSReadLineOption -PredictionSource History

  Set-PSReadlineOption -Color @{
    "Command"          = [ConsoleColor]::Green
    "Parameter"        = [ConsoleColor]::Gray
    "Operator"         = [ConsoleColor]::Magenta
    "Variable"         = [ConsoleColor]::Yellow
    "String"           = [ConsoleColor]::Yellow
    "Number"           = [ConsoleColor]::Yellow
    "Type"             = [ConsoleColor]::Cyan
    "Comment"          = [ConsoleColor]::DarkCyan
    "InlinePrediction" = '#70A99F'
  }
    Set-PSReadLineKeyHandler -Function AcceptSuggestion -Key 'Ctrl+Spacebar'
    Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
    Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward 

    Set-PSReadLineKeyHandler -Key Ctrl+Shift+b `
                        -BriefDescription BuildCurrentDirectory `
                         -LongDescription "Build the current directory" `
                         -ScriptBlock {
      [Microsoft.PowerShell.PSConsoleReadLine]::RevertLine()
      [Microsoft.PowerShell.PSConsoleReadLine]::Insert("dotnet build")
      [Microsoft.PowerShell.PSConsoleReadLine]::AcceptLine()
     }
}