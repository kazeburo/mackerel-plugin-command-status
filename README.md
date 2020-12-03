# mackerel-plugin-command-status
Mackerel custom plugin for exec command and get exit status as metrics

## Usage

```
Usage:
  mackerel-plugin-command-status mackerel-plugin-command-status [OPTIONS] -- command args1 args2 ...

Application Options:
      --timeout= Timeout to connect mysql (default: 30s)
  -n, --name=    Metrics name
  -v, --version  Show version

Help Options:
  -h, --help     Show this help message
```

Sample

```
$ mackerel-plugin-command-status --name update-cache -- /path/to/cmd-fetch-cache
command-status.exit-code.update-cache  0       1606958816
```

```
$ mackerel-plugin-command-status -n sleep --timeout 3s -- sleep 30
2020/12/03 10:29:11 Command sleep timeout. killed
command-status.exit-code.sleep  137     1606958948
```

Configure for mackerel-agent to use mackerel-agent as crontab and get their exit status code as metrics.

```
[plugin.metrics.update-cache]
command = "/path/to/mackerel-plugin-command-status --name update-cache --timeout 10s -- /path/to/cmd-fetch-cache"
```

and set a monitor with `warning(critical)  > 0` and `maxCheckAttempts` appropriate to your SLO.

## Install

Please download release page or `mkr plugin install kazeburo/mackerel-plugin-command-status`.