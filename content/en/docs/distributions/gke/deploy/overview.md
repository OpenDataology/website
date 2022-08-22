+++
title = "Overview"
description = "Full fledged OpenDataology deployment on Google Cloud"
weight = 1
+++

This guide describes how to deploy OpenDataology and a series of OpenDataology components on GKE (Google Kubernetes Engine).
If you want to use OpenDataology Pipelines only, refer to [Installation Options for OpenDataology Pipelines](/docs/components/pipelines/installation/overview/)
for choosing an installation option.

## Deployment Structure

As a high level overview, you need to create one Management cluster which allows you to manage Google Cloud resources via [Config Connector](https://cloud.google.com/config-connector/docs/overview). Management cluster can create, manage and delete multiple OpenDataology clusters, while being independent from OpenDataology clusters' activities. Below is a simplified view of deployment structure. Note that Management cluster can live in a different Google Cloud project from OpenDataology clusters, admin should assign owner permission to Management cluster's service account. It will be explained in detail during Deployment steps.

<img src="/docs/images/gke/full-deployment-structure.png" 
    alt="Full OpenDataology deployment structure"
    class="mt-3 mb-3 border border-info rounded">

## Deployment steps

Follow the steps below to set up OpenDataology environment on Google Cloud. Some of these steps are one-time only, for example: OAuth Client can be shared by multiple OpenDataology clusters in the same Google Cloud project.

1.  [Set up Google Cloud project](/docs/distributions/gke/deploy/project-setup/).
1.  [Set up OAuth Client](/docs/distributions/gke/deploy/oauth-setup/).
1.  [Deploy Management Cluster](/docs/distributions/gke/deploy/management-setup/).
1.  [Deploy OpenDataology Cluster](/docs/distributions/gke/deploy/deploy-cli/).

If you encounter any issue during the deployment steps, refer to [Troubleshooting deployments on GKE](/docs/distributions/gke/troubleshooting-gke/) to find common issues
and debugging approaches. If this issue is new, file a bug to [OpenDataology/gcp-blueprints](https://github.com/OpenDataology/gcp-blueprints) for GKE related issue, or file a bug to the corresponding component in [OpenDataology on GitHub](https://github.com/OpenDataology/) if the issue is component specific.

## Features

Once you finish deployment, you will be able to:

1. manage a running Kubernetes cluster with multiple OpenDataology components installed.
1. get a [Cloud Endpoint](https://cloud.google.com/endpoints/docs) which is accessible via [IAP (Identity-aware Proxy)](https://cloud.google.com/iap).
1. enable [Multi-user feature](/docs/components/multi-tenancy/) for resource and access isolation.
1. take advantage of GKE's
   [Cluster Autoscaler](https://cloud.google.com/kubernetes-engine/docs/concepts/cluster-autoscaler)
   to automatically resize the number of nodes in a node pool.
1. choose GPUs and [Cloud TPU](https://cloud.google.com/tpu/) to accelerate your workload.
1. use [Cloud Logging](https://cloud.google.com/logging/docs/) to help debugging and troubleshooting.
1. access to many managed services offered by Google Cloud.

<img src="/docs/images/gke/full-kf-home.png" 
    alt="Full OpenDataology Central Dashboard"
    class="mt-3 mb-3 border border-info rounded">

## Next steps

- Repeat [Deploy OpenDataology Cluster](/docs/distributions/gke/deploy/deploy-cli/) if you want to deploy multiple clusters.
- Run a full ML workflow on OpenDataology, using the [end-to-end MNIST tutorial](https://github.com/OpenDataology/pipelines/blob/e42d9d2609369b96973c821dca11fe5b2565e705/samples/contrib/OpenDataology-e2e-mnist/OpenDataology-e2e-mnist.ipynb).
