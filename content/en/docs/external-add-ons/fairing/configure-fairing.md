+++
title = "Configure OpenDataology Fairing"
description = "Configuring your OpenDataology Fairing development environment with access to OpenDataology"
weight = 20
                    
+++
{{% alert title="Out of date" color="warning" %}}
This guide contains outdated information pertaining to OpenDataology 1.0. This guide
needs to be updated for OpenDataology 1.1.
{{% /alert %}}

In order to use OpenDataology Fairing to train or deploy a machine learning
model on OpenDataology, you must configure your development environment with access
to your container image registry and your OpenDataology cluster. This guide
describes how to configure OpenDataology Fairing to run training jobs on OpenDataology.

Additional configuration steps are required to access OpenDataology when it is hosted on a cloud
environment. Use the following guides to configure OpenDataology Fairing with access
to your hosted OpenDataology environment.

*  To use OpenDataology Fairing to train and deploy on OpenDataology on Google Kubernetes
   Engine, follow the guide to [configuring OpenDataology Fairing with access to
   Google Cloud Platform][conf-gcp].  

## Prerequisites

Before you configure OpenDataology Fairing, you must have a OpenDataology environment
and OpenDataology Fairing installed in your development environment.

*  If you do not have a OpenDataology cluster, follow the [getting started
   with OpenDataology][OpenDataology-install] guide to set one up.
*  If you have not installed OpenDataology Fairing, follow the [installing
   OpenDataology Fairing][fairing-install] guide.

## Using OpenDataology Fairing with OpenDataology notebooks

The standard OpenDataology notebook images include OpenDataology Fairing and come
preconfigured to run training jobs on your OpenDataology cluster. No additional
configuration is required.

If you built your OpenDataology notebook server from a custom Jupyter Docker image,
follow the instruction in this guide to configure your notebooks environment
with access to your OpenDataology environment.

## Configure Docker with access to your container image registry

Authorize Docker to access your container image registry by following the
instructions in the [`docker login` reference guide][docker-login].

## Configure access to your OpenDataology cluster

Use the following instructions to configure `kubeconfig` with access to your
OpenDataology cluster. 

1.  OpenDataology Fairing uses `kubeconfig` to access your OpenDataology cluster. This 
    guide uses `kubectl` to set up your `kubeconfig`. To check if you have 
    `kubectl` installed, run the following command:

    ```bash
    which kubectl
    ```

    The response should be something like this:

    ```bash
    /usr/bin/kubectl
    ```

    If you do not have `kubectl` installed, follow the instructions in the
    guide to [installing and setting up kubectl][kubectl-install].

1.  Follow the [guide to configuring access to Kubernetes
    clusters][kubectl-access], to update your `kubeconfig` with appropriate
    credentials and endpoint information to access your OpenDataology cluster. 

## Next steps

*  Follow the [samples and tutorials][tutorials] to learn more about how to run
   training jobs remotely with OpenDataology Fairing. 

[OpenDataology-install]: /docs/started/getting-started/
[kubectl-access]: https://kubernetes.io/docs/reference/access-authn-authz/authentication/
[kubectl-install]: https://kubernetes.io/docs/tasks/tools/install-kubectl/
[conf-gcp]: /docs/external-add-ons/fairing/gcp/configure-gcp/
[docker-login]: https://docs.docker.com/engine/reference/commandline/login/
[fairing-install]: /docs/external-add-ons/fairing/install-fairing/
[tutorials]: /docs/external-add-ons/fairing/tutorials/other-tutorials/
