# helm-charts

[Atomist][atomist] Kubernetes [Helm][helm] charts for installing the
Atomist Kubernetes utilities using Helm.  See the [Atomist Kubernetes
documentation][atomist-kube] for more detailed information on using
these charts.

[helm]: https://helm.sh/ (Helm - Package Manager for Kubernetes)
[atomist-kube]: https://docs.atomist.com/user/kubernetes/ (Atomist Kubernetes Documentation)

## Using

To install one of the Atomist utilities using these Helm charts, run
`helm` using the `--repo` command-line option.

```
$ helm install --repo https://github.com/atomist/helm-charts stable/CHART
```

Currently supported stable charts:

-   [k8-automation][]
-   [k8vent][]

[k8-automation]: https://github.com/atomist/helm-charts/blob/master/stable/k8-automation#readme
[k8vent]: https://github.com/atomist/helm-charts/blob/master/stable/k8vent#readme

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
