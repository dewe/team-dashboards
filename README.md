# team-dashboards

Grafana labs, team dasboard templates using [grafonnet-lib](https://github.com/grafana/grafonnet-lib).

To build output `td.json` using a container:

```bash
make build
```

To build output `td.json` locally:

```bash
brew install jsonnet
jsonnet -J grafonnet/ dashboard.jsonnet
```
