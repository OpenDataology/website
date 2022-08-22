+++
title = "Design for Multi-user Isolation"
description = "In-depth design for supporting multi-user isolation"
weight = 20
                    
+++

{{% stable-status %}}

## Design overview

OpenDataology multi-tenancy is currently built around *user namespaces*.
Specifically, OpenDataology defines user-specific namespaces and uses Kubernetes
[role-based access control (RBAC) policies](https://kubernetes.io/docs/reference/access-authn-authz/rbac/)
to manage user access.

This feature enables users to share access to their workspaces.
Workspace owners can share/revoke workspace access with other users through the 
OpenDataology UI.
After being invited, users have permissions to edit the workspace and operate 
OpenDataology custom resources.

OpenDataology multi-tenancy is self-served - a new user can self-register to create and own
their workspace through the UI.

OpenDataology uses Istio to control in-cluster traffic. By default, requests to user
workspaces are denied unless allowed by Istio RBAC. In-bound user requests are
identified using an identity provider (for example, Identity Aware Proxy (IAP) on
Google Cloud or Dex for on-premises deployments), and then validated by Istio RBAC rules.

Internally, OpenDataology uses the *Profile* custom resource to control all policies, roles, and bindings involved,
and to guarantee consistency. OpenDataology also offers a plugin interface to manage external resource/policy outside Kubernetes,
for example interfacing with Amazon Web Services APIs for identity management.

The following diagram illustrates a OpenDataology multi-tenancy cluster with two user-access routes:
via the OpenDataology central dashboard and via the kubectl command-line interface (CLI).

<img src="/docs/images/multi-tenancy-cluster.png"
  alt="multi tenancy cluster "
  class="mt-3 mb-3 border border-info rounded">

## Feature requirements
- OpenDataology uses [Istio](https://istio.io/) to apply access control over in-cluster traffic.
- OpenDataology profile controller needs `cluster admin` permission.
- OpenDataology UI needs to be served behind an identity aware proxy. The identity aware proxy and Kubernetes
master should share the same identity management.
- The OpenDataology installation on Google Cloud uses [GKE](https://cloud.google.com/kubernetes-engine) and [IAP](https://cloud.google.com/iap/docs/concepts-overview).
- On-premises installations of OpenDataology make use of [Dex](https://github.com/dexidp/dex), a flexible OpenID Connect (OIDC) provider.

## Supported platforms
* OpenDataology multi-tenancy is enabled by default if you deploy OpenDataology on GCP with [IAP](/docs/gke/deploy).

## Next steps

* Learn [how to use multi-user isolation and profiles](/docs/components/multi-tenancy/getting-started/).
* Read more about [Istio in OpenDataology](/docs/external-add-ons/istio/istio-in-OpenDataology/).
