# delete_indices_of_elasticsearch5x
- delete indices of elasticsearch5x by curator_cli ,ruby script and Digdag WF.
- The target indices sets variables of `del_old_indices.dig` below. Change for your environment.

```
  older_counts_days: "10"
  indexname: [packetbeat-,metricbeat-,winlogbeat-,filebeat-]
```

## Env.
- CentOS Linux release 7.2
- Elasticsearch,Kibana,Beats v5.0.0
- curator_cli v 4.2.6
- digdag v0.8.17

## Usage

```
digdag run -a del_old_indices.dig
```
