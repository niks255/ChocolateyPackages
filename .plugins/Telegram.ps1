param(
    [string]$Token = '',
    [string]$Chat_id = '',
    [switch]$Markdown = $false,
    [switch]$NoPreview = $false,
    [switch]$SendAlways = $false
)

if ($Token -eq '') {
    Write-Host 'Token is not set. This argument is mandatory'
    Return
}

if ($Chat_id -eq '') {
    Write-Host 'Chat ID is not set. This argument is mandatory'
    Return
}

if ($Info.error_count.total -gt 0 -Or $SendAlways) {
    $errors_word = if ($Info.error_count.total -eq 1) { 'error' } else { 'errors' }
    $text = if ($info.error_count.total -eq 0) { 
        "AU: run was OK"
    } else {
        "AU: $($info.error_count.total) $errors_word during update"
    }

    $payload = @{
        "chat_id" = $chat_id;
        "text" = $text
        "parse_mode" = if ($markdown) { 'Markdown' } else { '' };
        "disable_web_page_preview" = $NoPreview;
    }

    Invoke-WebRequest `
        -Uri ("https://api.telegram.org/bot{0}/sendMessage" -f $token) `
        -Method Post `
        -ContentType "application/json;charset=utf-8" `
        -Body (ConvertTo-Json -Compress -InputObject $payload) | Out-Null
}