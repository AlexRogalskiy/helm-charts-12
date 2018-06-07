# k8-automation Helm chart

[Helm][helm] chart for [k8-automation][], a utility that responds to
[Atomist][atomist] software delivery machine (SDM) events to deploy
and update resources from Kubernetes using Atomist.

[helm]: https://helm.sh/ (Helm - Package Manager for Kubernetes)
[k8-automation]: https://github.com/atomist/k8-automation (k8-automation - Atomist Kubernetes deployer)

## Prerequisites

You need an Atomist workspace and a Kubernetes cluster.  See the
[Atomist user documentation][atomist-user] for more information.

[atomist-user]: https://docs.atomist.com/user/ (Atomist User Documentation)

## Values

The [values.yaml](values.yaml) file documents all of the parameters
for this Helm chart.  The [Atomist Kubernetes
documentation][atomist-kube] contains information on why and how to
deploy using Helm.

[atomist-kube]: https://docs.atomist.com/user/kubernetes/ (Atomist Kubernetes Documentation)

---

Created by [Atomist][atomist].
Need Help?  [Join our Slack team][slack].

[atomist]: https://atomist.com/ (Atomist - How Teams Deliver Software)
[slack]: https://join.atomist.com/ (Atomist Community Slack)
