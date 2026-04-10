{{- define "demo-app.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "demo-app.fullname" -}}
{{- printf "%s-%s" (include "demo-app.name" .) .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
