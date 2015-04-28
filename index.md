
# Posh RabbitMQ

Powershell scripts for rabbitmq.


#Scripts

## queue status

Gets basic stats for a queue. 

Usage:

```
.\queue_status.ps1 queueName -username "basicAuthUserName" -password "basicAuthPassword" -hostUrl "http://machine:15672" [-vhost "vhost"]

```

vhost is optional. The default is "%2f" (i.e. "/").

The output is Orion compliant, and looks like:

```
Statistic.State: running
Statistic.Messages: 0
Statistic.MessagesReady: 0
Statistic.MessagesUnacknowledged: 0
Statistic.MessageRate: 0.0
Statistic.MessagesReadyRate: 0.0
Statistic.MessagesUnacknowledgedRate: 0.0
Statistic.AckRate: 41.2
Statistic.DeliverRate: 41.2
Statistic.DeliverGetRate: 41.2
Statistic.PublishRate: 29.6
Statistic.RedeliverRate: 0.0
```
