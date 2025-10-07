#!/usr/bin/env pwsh

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

try {
    & git status *> $null
    if ($LASTEXITCODE -eq 0) {
        & git restore src/Pack/Version.idr
    }
} catch {
    # Ignore errors when git is unavailable or the repository is not initialized
}
