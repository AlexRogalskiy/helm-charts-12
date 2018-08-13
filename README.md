# helm-charts

[Atomist][atomist] Kubernetes [Helm][helm] charts for installing the
Atomist Kubernetes utilities using Helm.  See the [Atomist Kubernetes
documentation][atomist-kube] for more detailed information on using
these charts.

[helm]: https://helm.sh/ (Helm - Package Manager for Kubernetes)
[atomist-kube]: https://docs.atomist.com/user/kubernetes/ (Atomist Kubernetes Documentation)

## Using

The [Atomist Kubernetes documentation][atomist-kube] has complete
instructions for install the Atomist Kubernetes utilities using Helm.
Briefly, to install the Atomist utilities using these Helm charts, run
`helm` using the `--repo` command-line option.

```
$ helm upgrade --install --namespace=atomist atomist-utilities \
    --repo=https://atomist.github.io/helm-charts atomist-utilities \
    --set=global.atomist.apiKey="API_KEY" \
    --set=global.atomist.workspaceIds="{WORKSPACE_ID}" \
    --set=global.atomist.environment="CLUSTER_ENV"
```

Replace `API_KEY` with a valid Atomist API key, `WORKSPACE_ID` with
your Atomist workspace ID, and `CLUSTER_ENV` with a unique name for
your Kubernetes cluster.

You can also install the Atomist utilities individually.  The
currently supported stable charts are:

-   [k8-automation][]
-   [k8vent][]

[k8-automation]: stable/k8-automation/README.md (k8-automation Helm Chart)
[k8vent]: stable/k8vent/README.md (k8vent Helm Chart)

## Testing

To test changes, you can run the following command:

```
$ helm upgrade --install --namespace=atomist atomist-utilities \
    ./stable/atomist-utilities --set=global.atomist.apiKey="API_KEY" \
    --set=global.atomist.workspaceIds="{WORKSPACE_ID}" \
    --set=global.atomist.environment="CLUSTER_ENV"
$ helm delete atomist-utilities
$ kubectl create ns atm-test
$ helm upgrade --install --namespace="atm-test" "atomist-utilities-atm-test" \
    ./stable/atomist-utilities --set=global.atomist.apiKey="API_KEY" \
    --set=global.atomist.workspaceIds="{WORKSPACE_ID}" \
    --set=global.atomist.environment="CLUSTER_ENV" \
    --set=global.atomist.mode=namespace
$ helm delete atomist-utilities-atm-test
```

## Updating

If a new version of k8vent or k8-automation is released, perform the
following steps to update the Helm charts.

1.  Update the `appVersion` and increment the `version` in the
    appropriate `Chart.yaml`.
2.  Delete the old chart from `stable/atomist-utilities/charts`.
2.  Package the updated chart for the repo and the atomist-utilities
    chart.

        helm package -d docs stable/CHART
        helm package -d stable/atomist-utilities/charts stable/CHART

3.  Increment the `version` in `atomist-utilities/Chart.yaml`.
4.  Package atomist-utilities

        helm package -d docs stable/atomist-utilities

5.  Add, commit, and push.

See below for more details.

## Releasing

To release a new version of a chart, run the following commands,
replacing CHART with the subdirectory containing the chart.

```
$ helm package -d docs stable/CHART
$ helm repo index docs --url https://atomist.github.io/helm-charts
$ git add docs
$ git commit -m 'Release new version of CHART'
$ git push origin master
```

This repository is configured to serve the `docs` directory via GitHub
Pages.

---

Created by [Atomist][atomist].
Need Help?  [Join our Slack team][slack].

[atomist]: https://atomist.com/ (Atomist - How Teams Deliver Software)
[slack]: https://join.atomist.com/ (Atomist Community Slack)
