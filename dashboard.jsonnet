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
