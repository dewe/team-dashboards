local grafana = import 'grafonnet/grafana.libsonnet';
local dashboard = grafana.dashboard;
local row = grafana.row;
local template = grafana.template;
local graphPanel = grafana.graphPanel;
local singlestat = grafana.singlestat;
local prometheus = grafana.prometheus;


grafana.dashboard.new(
  'team-dashboard-template',
  refresh='1m',
  time_from='now-1h',
  tags=['postnord']
)
.addTemplate(
  grafana.template.datasource(
    'PROMETHEUS_DS',
    'prometheus',
    'Prometheus',
    hide='label',
  )
)
.addPanel(
  singlestat.new(
    'uptime',
    format='s',
    datasource='Prometheus',
    span=2,
    valueName='current',
  )
  .addTarget(
    prometheus.target(
      'time() - process_start_time_seconds{endpoint="metrics",instance="10.43.159.37:3030",job="flux-metrics",namespace="flex",pod="flux-5b5fc7966d-p8qxs",service="flux-metrics"}',
    )
  ),
  gridPos={
    x: 0,
    y: 0,
    w: 24,
    h: 3,
  }
)
