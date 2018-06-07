# k8vent Helm chart

[Helm][helm] chart for [k8vent][], a utility that sends Kubernetes pod
events to [Atomist][atomist] so your team can see and act on these
events using Atomist.

[helm]: https://helm.sh/ (Helm - Package Manager for Kubernetes)
[k8vent]: https://github.com/atomist/k8vent (k8vent - Kubernetes event emitter)

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
