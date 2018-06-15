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
$ helm install --repo https://atomist.github.io/helm-charts --namespace=atomist \
     atomist-utilities --set=global.atomist.token="TOKEN" \
     --set=global.atomist.teamIds="{WORKSPACE_ID}"
```

Replace `TOKEN` with a valid Atomist authentication token and
`WORKSPACE_ID` with your Atomist workspace/team ID.

You can also install the Atomist utilities individually.  The
currently supported stable charts are:

-   [k8-automation][]
-   [k8vent][]

[k8-automation]: stable/k8-automationREADME.md (k8-automation Helm Chart)
[k8vent]: stable/k8ventREADME.md (k8vent Helm Chart)

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
