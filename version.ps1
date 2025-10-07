#!/usr/bin/env pwsh

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$gitSha1 = ''

try {
    & git status *> $null
    if ($LASTEXITCODE -eq 0) {
        $gitSha1 = (& git rev-parse HEAD).Trim()
    }
} catch {
    $gitSha1 = ''
}

$repoRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
$versionFile = Join-Path $repoRoot 'src/Pack/Version.idr'

$output = "version = ""$gitSha1"""
$output | Out-File -FilePath $versionFile -Encoding utf8 -Append
