param(
    [Parameter(Mandatory=$true, Position=1)]
    [string]$queue,

    [Parameter(Mandatory=$true)]
    [string]$username,

    [Parameter(Mandatory=$true)]
    [string]$password,

    [Parameter(Mandatory=$true)]
    [string]$hostUrl,

    [Parameter(Mandatory=$false)]
    [string]$vhost = "%2f"
)


$web = new-object System.Net.WebClient
$web.Credentials = New-Object System.Net.NetworkCredential $username,$password

$url = "$hostUrl/api/queues/$vhost/$queue"

$str = $web.DownloadString($url)

$json = ConvertFrom-Json $str

Write-Host "Statistic.State: $($json.state)";
Write-Host "Statistic.Messages: $($json.messages)";
Write-Host "Statistic.MessagesReady: $($json.messages_ready)";
Write-Host "Statistic.MessagesUnacknowledged: $($json.messages_unacknowledged)";
Write-Host "Statistic.MessageRate: $($json.messages_details.rate)";
Write-Host "Statistic.MessagesReadyRate: $($json.messages_ready_details.rate)";
Write-Host "Statistic.MessagesUnacknowledgedRate: $($json.messages_unacknowledged_details.rate)";

Write-Host "Statistic.AckRate: $($json.message_stats.ack_details.rate)"
Write-Host "Statistic.DeliverRate: $($json.message_stats.deliver_details.rate)"
Write-Host "Statistic.DeliverGetRate: $($json.message_stats.deliver_get_details.rate)"
Write-Host "Statistic.PublishRate: $($json.message_stats.publish_details.rate)"
Write-Host "Statistic.RedeliverRate: $($json.message_stats.redeliver_details.rate)"





	

