# First of all, setup PSReadline
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -HistorySearchCursorMovesToEnd
Set-PSReadLineOption -HistoryNoDuplicates
Set-PSReadLineOption -MaximumHistoryCount 99999

Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward

# Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete
# ^ replace backslashes with forward slashes to work with commands like "wsl"
Set-PSReadLineKeyHandler -Key Tab ` -ScriptBlock {
  $content = ""
  $index = 0
  [Microsoft.PowerShell.PSConsoleReadLine]::MenuComplete()
  [Microsoft.PowerShell.PSConsoleReadLine]::GetBufferState([ref] $content, [ref] $index)
  [Microsoft.PowerShell.PSConsoleReadLine]::RevertLine()
  [Microsoft.PowerShell.PSConsoleReadLine]::Insert($content.Replace('\','/'))
  [Microsoft.PowerShell.PSConsoleReadLine]::SetCursorPosition($index)
}

# Instant Prompt like powerlevel10k: https://sidneys1.com/programming/2022/09/29/powershell-profile-instant-prompt.html
# The function below executes the command:
oh-my-posh init pwsh --config C:\Users\kiva\AppData\Local\Programs\oh-my-posh\themes\robbyrussel.omp.json | Invoke-Expression
# in the background.
# function prompt {
#   if (Test-Path variable:global:ompjob) {
#     Receive-Job -Wait -AutoRemoveJob -Job $global:ompjob | Invoke-Expression;
#     Remove-Variable ompjob -Scope Global;
#     Enable-PoshTransientPrompt
#     Enable-PoshLineError
#     return " ";
#   }
#   $global:ompjob = Start-Job {(@(& '%LOCALAPPDATA%/Programs/oh-my-posh/bin/oh-my-posh.exe' init pwsh --config='C:\Users\kiva\AppData\Local\Programs\oh-my-posh\themes\robbyrussel.omp.json' --print) -join "`n")};
#   Write-Host -ForegroundColor Blue "Loading `$profile in the background..."
#   Write-Host -ForegroundColor Green -NoNewline "  $($executionContext.SessionState.Path.CurrentLocation) ".replace($HOME, '~');
#   Write-Host -ForegroundColor Red -NoNewline "ᓚᘏᗢ"
#   return " ";
# }

# git aliases like gcl, gst, gpr
Import-Module git-aliases -DisableNameChecking
Import-Module Terminal-Icons

# useful command aliases
function ls_git  { & 'C:\Program Files\Git\usr\bin\ls' --color=auto -hF     $args }
function la_git  { & 'C:\Program Files\Git\usr\bin\ls' --color=auto -hF -a  $args }
function ll_git  { & 'C:\Program Files\Git\usr\bin\ls' --color=auto -hF -l  $args }
function lla_git { & 'C:\Program Files\Git\usr\bin\ls' --color=auto -hF -la $args }
Set-Alias -Name ls  -Value ls_git  -Option Private
Set-Alias -Name la  -Value la_git  -Option Private
Set-Alias -Name ll  -Value ll_git  -Option Private
Set-Alias -Name lla -Value lla_git -Option Private

# I need them all, but not system-wide.
$env:PATH="$env:PATH;C:\Program Files\Git\usr\bin"

# "conda activate"
if ($env:computername -eq 'KIVA-DESKTOP') {
  $Env:CONDA_EXE = "C:/Users/kiva/Documents/anaconda\Scripts\conda.exe"
  $Env:_CE_M = ""
  $Env:_CE_CONDA = ""
  $Env:_CONDA_ROOT = "C:/Users/kiva/Documents/anaconda"
  $Env:_CONDA_EXE = "C:/Users/kiva/Documents/anaconda\Scripts\conda.exe"
  $CondaModuleArgs = @{ChangePs1 = $False}
  Import-Module "$Env:_CONDA_ROOT\shell\condabin\Conda.psm1" -ArgumentList $CondaModuleArgs
  Remove-Variable CondaModuleArgs
}
