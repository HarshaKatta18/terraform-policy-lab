terraform plan -out=tfplan

terraform show -json tfplan > tfplan.json

conftest test tfplan.json --policy policy/

if ($LASTEXITCODE -ne 0) {
    Write-Host "Policy violations found. Aborting."
    exit 1
}

Write-Host "All policies passed."