Import-Module posh-git

Set-Alias -Name vim -Value nvim
Set-Alias -Name gic -Value 'git checkout'

function find { Get-ChildItem -Path . -Recurse -Filter $args }
function grep {
    if (-not $args) {
        Write-Error "Usage: grep <pattern>"
        return
    }

    $pattern = $args

    Get-ChildItem -Path . -Recurse -File |
    ForEach-Object {
        Select-String -Path $_.FullName -Pattern $pattern -Context 5 |
        Format-List FileName, Path, LineNumber, Line
    }
}
