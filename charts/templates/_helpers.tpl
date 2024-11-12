{{- define "my-ubuntu-desktop.name" -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "my-ubuntu-desktop.fullname" -}}
{{- .Release.Name | default .Chart.Name -}}
{{- end -}}

{{- define "my-ubuntu-desktop.chart" -}}
{{ .Chart.Name }}-{{ .Chart.Version }}
{{- end -}}
