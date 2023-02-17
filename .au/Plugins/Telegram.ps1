param(
    [string]$Title = '',
    [string]$Token = '',
    [string]$Chat_id = '',
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

$updated = @($Info.result.updated).Count
$pushed  = @($Info.result.pushed).Count

if ($Info.error_count.total -gt 0 -Or $updated -gt 0 -Or `
                                $pushed -gt 0 -Or $SendAlways) {
    $errors_word = if ($Info.error_count.total -eq 1) { 
                       'error' } else { 'errors' }

    $text = "***${Title}***: $($info.error_count.total) $errors_word, " + `
            "$($updated) updated, " + `
            "$($pushed) pushed"

    $payload = @{
        "chat_id" = $chat_id;
        "text" = $text
        "parse_mode" = 'Markdown';
        "disable_web_page_preview" = $NoPreview;
        "disable_notification" = if ($Info.error_count.total -gt 0) { 'false' } else { 'true' };
    }

    Invoke-WebRequest `
        -Uri ("https://api.telegram.org/bot{0}/sendMessage" -f $token) `
        -Method Post `
        -ContentType "application/json;charset=utf-8" `
        -Body (ConvertTo-Json -Compress -InputObject $payload) | Out-Null
}