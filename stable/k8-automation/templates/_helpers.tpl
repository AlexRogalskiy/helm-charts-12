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
{{- default .Values.config.kubernetes.mode .Values.global.mode -}}
{{- end -}}

{{/*
Determine team IDs.  k8-automation value takes precedence.
*/}}
{{- define "k8-automation.teams" -}}
{{- default .Values.global.teamIds .Values.config.teamIds -}}
{{- end -}}

{{/*
Determine environment.  Global value takes precedence.
*/}}
{{- define "k8-automation.env" -}}
{{- default .Values.config.environment .Values.global.environment -}}
{{- end -}}

{{/*
Determine token.  k8-automation value takes precedence.
*/}}
{{- define "k8-automation.token" -}}
{{- default .Values.global.token .Values.config.token -}}
{{- end -}}

{{/*
Determine role type.
*/}}
{{- define "k8-automation.role" -}}
{{- ternary "ClusterRole" "Role" (eq (include "k8-automation.mode" .) "cluster") -}}
{{- end -}}

{{/*
Check to make sure all required values are set.
*/}}
{{- define "k8-automation.requiredValues" -}}
{{- if not .Values.secret.token -}}
{{- required "You must supply a secret.token" .Values.secret.token -}}
{{- end -}}
{{- if and (not (include "k8-automation.teams" .)) (not .Values.config.groups) -}}
{{- required "You must supply at least one Atomist team ID or, less likely, group" .Values.config.teamIds -}}
{{- end -}}
{{- $mode := include "k8-automation.mode" . -}}
{{- if and (not (eq $mode "cluster")) (not (eq $mode "namespace")) -}}
{{- required (printf "Kubernetes mode (.Values.config.kubernetes.mode=%s) must be either 'cluster' or 'namespace'" $mode) nil -}}
{{- end -}}
{{- end -}}
