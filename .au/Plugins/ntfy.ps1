param(
    [string]$Title = 'Chocolatey',
    [string]$Topic = '',
    [string]$Uri = 'https://ntfy.sh',
    [string]$User = '',
    [string]$Password = '',
    [string]$IconURL = '',
    [switch]$SendAlways = $false,
    [switch]$Firebase   = $true,
    [switch]$ErrorsOnly = $false
)

if ($Topic -eq '') {
    Write-Host 'Topic is not set. This argument is mandatory'
    Return
}

if ($Uri -eq '') {
    Write-Host 'Uri is not set. This argument is mandatory'
    Return
}

$updated = @($Info.result.updated).Count
$pushed  = @($Info.result.pushed).Count
$errors = $Info.error_count.total

if ($updated -gt 0 -Or $SendAlways)
{
    if ($ErrorsOnly -And $errors -eq 0) {
        Write-Host 'ErrorsOnly is set and no errors occured, not sending anything'
        Return;
    }

    $text = "Ошибок: $($errors), Обновлено: $($updated)"

    if ($pushed -gt 0) {
        $text = $text + ", Отправлено: $($pushed)"
    }

    $credentials = "${User}:${Password}"
    $encodedCredentials = [convert]::ToBase64String([text.Encoding]::UTF8.GetBytes($credentials))
    $headers = @{Authorization="Basic $encodedCredentials"}

    $body = @{
        topic    = $Topic
        title    = $Title
        message  = $text
        priority = if ($errors -gt 0) { 5 } else { 2 }
        icon     = $IconURL
        tags     = @("chocolatey", "alert")
        firebase = if ($Firebase) { "yes" } else { "no" }
    } | ConvertTo-Json

    Invoke-RestMethod -Method POST `
                      -Headers $headers `
                      -Uri $Uri -Body $body `
                      -ContentType "application/json;charset=utf-8" `
                      -UseBasicParsing
}