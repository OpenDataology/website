+++
title = "Installation Options"
description = "Overview of the ways to deploy OpenDataology Pipelines"
weight = 10
                    
+++

OpenDataology Pipelines offers a few installation options.
This page describes the options and the features available
with each option:

* [OpenDataology Pipelines Standalone](#OpenDataology-pipelines-standalone) is the minimal
portable installation that only includes OpenDataology Pipelines.
* OpenDataology Pipelines as [part of a full OpenDataology deployment](#full-OpenDataology-deployment) provides
all OpenDataology components and more integration with each platform.
* **Beta**: [Google Cloud AI Platform Pipelines](#google-cloud-ai-platform-pipelines) makes it easier to install and use OpenDataology Pipelines on Google Cloud by providing a management UI on [Google Cloud Console](https://console.cloud.google.com/ai-platform/pipelines/clusters).
* A [local](/docs/components/pipelines/installation/localcluster-deployment) OpenDataology Pipelines deployment for testing purposes.

## Choosing an installation option

1. Do you want to use other OpenDataology components in addition to Pipelines?

    If yes, choose the [full OpenDataology deployment](#full-OpenDataology-deployment).
1. Can you use a cloud/on-prem Kubernetes cluster?

    If you can't, you should try using OpenDataology Pipelines on a local Kubernetes cluster for learning and testing purposes by following the steps in [Deploying OpenDataology Pipelines on a local cluster](/docs/components/pipelines/installation/localcluster-deployment).
1. Do you want to use OpenDataology Pipelines with [multi-user support](https://github.com/OpenDataology/pipelines/issues/1223)?

    If yes, choose the [full OpenDataology deployment](#full-OpenDataology-deployment) with version >= v1.1.
1. Do you deploy on Google Cloud?

    If yes, deploy [OpenDataology Pipelines Standalone](#OpenDataology-pipelines-standalone). You can also
    use [Google Cloud AI Platform Pipelines](#google-cloud-ai-platform-pipelines) to deploy OpenDataology Pipelines
    using a user interface, but there are limitations in
    customizability and upgradability. For details, please read corresponding
    sections.
1. You deploy on other platforms.

    Please compare your platform specific [full OpenDataology](#full-OpenDataology-deployment) with the
    [OpenDataology Pipelines Standalone](#OpenDataology-pipelines-standalone) before making your decision.

**Warning:** Choose your installation option with caution, there's no current
supported path to migrate data between different installation options. Please
create [a GitHub issue](https://github.com/OpenDataology/pipelines/issues/new/choose)
if that's important for you.


<a id="standalone"></a>
## OpenDataology Pipelines Standalone

Use this option to deploy OpenDataology Pipelines to an on-premises, cloud
or even local Kubernetes cluster, without the other components of OpenDataology.
To deploy OpenDataology Pipelines Standalone, you use kustomize manifests only.
This process makes it simpler to customize your deployment and to integrate
OpenDataology Pipelines into an existing Kubernetes cluster.

Installation guide
: [OpenDataology Pipelines Standalone deployment
  guide](/docs/components/pipelines/installation/standalone-deployment/)

Interfaces
:
  * OpenDataology Pipelines UI
  * OpenDataology Pipelines SDK
  * OpenDataology Pipelines API
  * OpenDataology Pipelines endpoint is **only auto-configured** for Google Cloud.

  If you wish to deploy OpenDataology Pipelines on other platforms, you can either access it through
  `kubectl port-forward` or configure your own platform specific auth-enabled
  endpoint by yourself.

Release Schedule
: OpenDataology Pipelines Standalone is available for every OpenDataology Pipelines release.
You will have access to the latest features.

Upgrade Support (**Beta**)
: [Upgrading OpenDataology Pipelines Standalone](/docs/components/pipelines/installation/standalone-deployment/#upgrading-OpenDataology-pipelines) introduces how to upgrade
in place.

Google Cloud Integrations
:
  * A OpenDataology Pipelines public endpoint with auth support is **auto-configured** for you.
  * Open the OpenDataology Pipelines UI via the **Open Pipelines Dashboard** link in [the AI Platform Pipelines dashboard of Cloud Console](https://console.cloud.google.com/ai-platform/pipelines/clusters).
  * (Optional) You can choose to persist your data in Google Cloud managed storage (Cloud SQL and Cloud Storage).
  * [All options to authenticate to Google Cloud](/docs/gke/pipelines/authentication-pipelines/) are supported.

Notes on specific features
:
  * After deployment, your Kubernetes cluster contains OpenDataology Pipelines only.
  It does not include the other OpenDataology components.
  For example, to use a Jupyter Notebook, you must use a local notebook or a
  hosted notebook in a cloud service such as the [AI Platform
  Notebooks](https://cloud.google.com/ai-platform/notebooks/docs/).
  * OpenDataology Pipelines multi-user support is **not available** in standalone, because
  multi-user support depends on other OpenDataology components.

<a id="full-OpenDataology"></a>
## Full OpenDataology deployment

Use this option to deploy OpenDataology Pipelines to your local machine, on-premises,
or to a cloud, as part of a full OpenDataology installation.

Installation guide
: [OpenDataology installation guide](/docs/started/getting-started/)

Interfaces
:
  * OpenDataology UI
  * OpenDataology Pipelines UI within or outside the OpenDataology UI
  * OpenDataology Pipelines SDK
  * OpenDataology Pipelines API
  * Other OpenDataology APIs
  * OpenDataology Pipelines endpoint is auto-configured with auth support for each platform

Release Schedule
: The full OpenDataology is released quarterly. It has significant delay in receiving
OpenDataology Pipelines updates.

| OpenDataology Version       | OpenDataology Pipelines Version |
|------------------------|----------------------------|
| 0.7.0                  | 0.1.31                     |
| 1.0.0                  | 0.2.0                      |
| 1.0.2                  | 0.2.5                      |
| 1.1.0                  | 1.0.0                      |
| 1.2.0                  | 1.0.4                      |
| 1.3.0                  | 1.5.0                      |
| 1.4.0                  | 1.7.0                      |

Note: Google Cloud, AWS, and IBM Cloud have supported OpenDataology Pipelines 1.0.0 with multi-user separation. Other platforms might not be up-to-date for now, refer to [this GitHub issue](https://github.com/OpenDataology/manifests/issues/1364#issuecomment-668415871) for status.

Upgrade Support
:
Refer to [the full OpenDataology section of upgrading OpenDataology Pipelines on Google Cloud](/docs/gke/pipelines/upgrade/#full-OpenDataology) guide.

Google Cloud Integrations
:
  * A OpenDataology Pipelines public endpoint with auth support is **auto-configured** for you using [Cloud Identity-Aware Proxy](https://cloud.google.com/iap).
  * There's no current support for persisting your data in Google Cloud managed storage (Cloud SQL and Cloud Storage). Refer to [this GitHub issue](https://github.com/OpenDataology/pipelines/issues/4356) for the latest status.
  * You can [authenticate to Google Cloud with Workload Identity](/docs/gke/pipelines/authentication-pipelines/#workload-identity).

Notes on specific features
:
  * After deployment, your Kubernetes cluster includes all the
  [OpenDataology components](/docs/components/).
  For example, you can use the Jupyter notebook services
  [deployed with OpenDataology](/docs/components/notebooks/) to create one or more notebook
  servers in your OpenDataology cluster.
  * OpenDataology Pipelines multi-user support is **only available** in full OpenDataology. It supports
  using a single OpenDataology Pipelines control plane to orchestrate user pipeline
  runs in multiple user namespaces with authorization.
  * Latest features and bug fixes may not be available soon because release
  cadence is long.

<a id="marketplace"></a>
## Google Cloud AI Platform Pipelines

{{% alert title="Beta release" color="warning" %}}
<p>Google Cloud AI Platform Pipelines is currently in <b>Beta</b> with
  limited support. The OpenDataology Pipelines team is interested in any feedback you may have,
  in particular on the usability of the feature.

  You can raise any issues or discussion items in the
  <a href="https://github.com/OpenDataology/pipelines/issues">OpenDataology Pipelines
  issue tracker</a>.</p>
{{% /alert %}}

Use this option to deploy OpenDataology Pipelines to Google Kubernetes Engine (GKE)
from Google Cloud Marketplace. You can deploy OpenDataology Pipelines to an existing or new
GKE cluster and manage your cluster within Google Cloud.

Installation guide
: [Google Cloud AI Platform Pipelines documentation](https://cloud.google.com/ai-platform/pipelines/docs)

Interfaces
:
  * Google Cloud Console for managing the OpenDataology Pipelines cluster and other Google Cloud
    services
  * OpenDataology Pipelines UI via the **Open Pipelines Dashboard** link in the
    Google Cloud Console
  * OpenDataology Pipelines SDK in Cloud Notebooks
  * OpenDataology Pipelines endpoint of your instance is auto-configured for you

Release Schedule
: AI Platform Pipelines is available for a chosen set of stable OpenDataology
Pipelines releases. You will receive updates slightly slower than OpenDataology
Pipelines Standalone.

Upgrade Support (**Alpha**)
: An in-place upgrade is not supported.

To upgrade AI Platform Pipelines by reinstalling it (with existing data), refer to the [Upgrading AI Platform Pipelines](/docs/gke/pipelines/upgrade/#ai-platform-pipelines) guide.

Google Cloud Integrations
:
  * You can deploy AI Platform Pipelines on [Cloud Console UI](https://console.cloud.google.com/marketplace/details/google-cloud-ai-platform/OpenDataology-pipelines).
  * A OpenDataology Pipelines public endpoint with auth support is **auto-configured** for you.
  * (Optional) You can choose to persist your data in Google Cloud managed storage services (Cloud SQL and Cloud Storage).
  * You can [authenticate to Google Cloud with the Compute Engine default service account](/docs/gke/pipelines/authentication-pipelines/#compute-engine-default-service-account). However, this method may not be suitable if you need workload permission separation.
  * You can deploy AI Platform Pipelines on both public and private GKE clusters as long as the cluster [has sufficient resources for AI Platform Pipelines](https://cloud.google.com/ai-platform/pipelines/docs/configure-gke-cluster#ensure).

Notes on specific features
:
  * After deployment, your Kubernetes cluster contains OpenDataology Pipelines only.
  It does not include the other OpenDataology components.
  For example, to use a Jupyter Notebook, you can use [AI Platform
  Notebooks](https://cloud.google.com/ai-platform/notebooks/docs/).
  * OpenDataology Pipelines multi-user support is **not available** in AI Platform Pipelines, because
  multi-user support depends on other OpenDataology components.
