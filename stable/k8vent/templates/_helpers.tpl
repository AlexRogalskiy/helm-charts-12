{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "k8vent.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "k8vent.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "k8vent.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create the name of the service account to use.
*/}}
{{- define "k8vent.serviceAccountName" -}}
{{- if .Values.serviceAccount.create -}}
    {{ default (include "k8vent.fullname" .) .Values.serviceAccount.name }}
{{- else -}}
    {{ default "default" .Values.serviceAccount.name }}
{{- end -}}
{{- end -}}

{{/*
Determine the deployment mode.  Global value takes precedence.
*/}}
{{- define "k8vent.mode" -}}
{{- default .Values.mode .Values.global.atomist.mode -}}
{{- end -}}

{{/*
Determine workspace IDs.  k8vent value takes precedence.
*/}}
{{- define "k8vent.workspaces" -}}
{{- $workspaces := default .Values.global.atomist.workspaceIds .Values.workspaceIds -}}
{{- if $workspaces -}}
  {{- join "," $workspaces -}}
{{- end -}}
{{- end -}}

{{/*
Determine environment.  Global value takes precedence.
*/}}
{{- define "k8vent.env" -}}
{{- default .Values.environment .Values.global.atomist.environment -}}
{{- end -}}

{{/*
Determine role type.
*/}}
{{- define "k8vent.role" -}}
{{- ternary "ClusterRole" "Role" (eq (include "k8vent.mode" .) "cluster") -}}
{{- end -}}
