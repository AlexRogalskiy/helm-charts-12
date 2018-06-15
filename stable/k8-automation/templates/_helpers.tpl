{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "k8-automation.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "k8-automation.fullname" -}}
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
{{- define "k8-automation.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create the name of the service account to use.
*/}}
{{- define "k8-automation.serviceAccountName" -}}
{{- if .Values.serviceAccount.create -}}
    {{ default (include "k8-automation.fullname" .) .Values.serviceAccount.name }}
{{- else -}}
    {{ default "default" .Values.serviceAccount.name }}
{{- end -}}
{{- end -}}

{{/*
Determine the deployment mode.  Global value takes precedence.
*/}}
{{- define "k8-automation.mode" -}}
{{- $mode := default .Values.config.kubernetes.mode .Values.global.atomist.mode -}}
{{- if and (ne $mode "cluster") (ne $mode "namespace") -}}
  {{- required (printf "Kubernetes mode (%s) must be either 'cluster' or 'namespace'" $mode) nil -}}
{{- end -}}
{{- $mode -}}
{{- end -}}

{{/*
Determine team IDs.  k8-automation value takes precedence.
*/}}
{{- define "k8-automation.teams" -}}
{{- $teams := default .Values.global.atomist.teamIds .Values.config.teamIds -}}
{{- if $teams -}}
  {{- join "," $teams -}}
{{- else if not .Values.config.groups -}}
  {{- required "You must supply at least one Atomist team ID or, less likely, group" nil -}}
{{- end -}}
{{- end -}}

{{/*
Determine environment.  Global value takes precedence.
*/}}
{{- define "k8-automation.env" -}}
{{- $env := default .Values.config.environment .Values.global.atomist.environment -}}
{{- if $env -}}
  {{- $env -}}
{{- end -}}
{{- end -}}

{{/*
Determine token.  k8-automation value takes precedence.
*/}}
{{- define "k8-automation.token" -}}
{{- $token := default .Values.global.atomist.token .Values.secret.token -}}
{{- required "You must supply a secret.token or global.atomist.token" $token -}}
{{- end -}}

{{/*
Determine role type.
*/}}
{{- define "k8-automation.role" -}}
{{- ternary "ClusterRole" "Role" (eq (include "k8-automation.mode" .) "cluster") -}}
{{- end -}}
