# helm-charts

[Atomist][atomist] Kubernetes [Helm][helm] charts for installing the
Atomist Kubernetes utilities using Helm.

[helm]: https://helm.sh/ (Helm - Package Manager for Kubernetes)

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

---

Created by [Atomist][atomist].
Need Help?  [Join our Slack team][slack].

[atomist]: https://atomist.com/ (Atomist - How Teams Deliver Software)
[slack]: https://join.atomist.com/ (Atomist Community Slack)
