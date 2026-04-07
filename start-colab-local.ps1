$ErrorActionPreference = "Stop"

$projectRoot = Split-Path $PSScriptRoot -Parent
Set-Location $projectRoot

Write-Host ""
Write-Host "Project root:" $projectRoot -ForegroundColor Cyan
Write-Host "Starting a local Jupyter runtime that Google Colab can connect to..." -ForegroundColor Green
Write-Host ""
Write-Host "When Jupyter prints a URL like http://localhost:8888/?token=..., copy it." -ForegroundColor Yellow
Write-Host "In Colab: Connect > Connect to local runtime > paste that URL." -ForegroundColor Yellow
Write-Host ""

jupyter notebook `
  --notebook-dir="$projectRoot" `
  --NotebookApp.allow_origin="https://colab.research.google.com" `
  --NotebookApp.allow_credentials=True `
  --NotebookApp.port_retries=0 `
  --port=8888 `
  --no-browser
