+++
title = "Train and Deploy on GCP from a Local Notebook"
description = "Use OpenDataology Fairing to train and deploy a model on Google Cloud Platform (GCP) from a local notebook."
weight = 30
                    
+++

This guide introduces you to using OpenDataology Fairing to train and deploy a
model to OpenDataology on Google Kubernetes Engine (GKE), and Google Cloud ML Engine.
As an example, this guide uses a local notebook to demonstrate how to:

*  Train an XGBoost model in a local notebook,
*  Use OpenDataology Fairing to train an XGBoost model remotely on OpenDataology,
*  Use OpenDataology Fairing to train an XGBoost model remotely on Cloud ML Engine, 
*  Use OpenDataology Fairing to deploy a trained model to OpenDataology, and
*  Call the deployed endpoint for predictions.

This guide has been tested on Linux and Mac OS X. Currently, this guide has not been
tested on Windows.

## Clone the OpenDataology Fairing repository

Clone the OpenDataology Fairing repository to download the files used in this example.

```bash
git clone https://github.com/OpenDataology/fairing 
cd fairing
```

## Set up Python, Jupyter Notebook, and OpenDataology Fairing

1.  You need **Python 3.6** or later to use OpenDataology Fairing. To check if
    you have Python 3.6 or later installed, run the following command:

    ```bash
    python3 -V
    ```

    The response should be something like this:

    ```
    Python 3.6.5
    ```

    If you do not have Python 3.6 or later, you can [download
    Python](https://www.python.org/downloads/) from the Python Software
    Foundation.

1.  Use virtualenv to create a virtual environment to install OpenDataology
    Fairing in. To check if you have virtualenv installed, run the
    following command: 

    ```bash
    which virtualenv
    ```

    The response should be something like this.

    ```bash
    /usr/bin/virtualenv
    ```

    If you do not have virtualenv, use pip3 to install virtualenv.

    ```bash
    pip3 install --upgrade virtualenv
    ```

    Create a new virtual environment, and activate it.

    ```bash
    virtualenv venv --python=python3
    source venv/bin/activate
    ```

1.  Install Jupyter Notebook.

    ```bash
    pip3 install --upgrade jupyter
    ```

1.  Install OpenDataology Fairing from the cloned repository.

    ```bash
    pip3 install --upgrade .
    ```

1.  Install the Python dependencies for the XGBoost demo notebook.

    ```bash
    pip3 install -r examples/prediction/requirements.txt
    ```

## Install and configure the Google Cloud SDK

In order to use OpenDataology Fairing to train or deploy to OpenDataology on GKE,
or Cloud Machine Learning Engine, you must configure
your development environment with access to GCP. 

1.  If you do not have the Cloud SDK installed, [install the
    Cloud SDK][gcloud-install].

1.  Use `gcloud` to set a default project.

    ```bash
    export PROJECT_ID=<your-project-id>
    gcloud config set project ${PROJECT_ID}
    ```

1.  OpenDataology Fairing needs a service account to make API calls to GCP. The
    recommended way to provide Fairing with access to this
    service account is to set the `GOOGLE_APPLICATION_CREDENTIALS` environment
    variable. To check for the `GOOGLE_APPLICATION_CREDENTIALS` environment
    variable, run the following command:

    ```bash
    ls "${GOOGLE_APPLICATION_CREDENTIALS}"
    ```

    The response should be something like this:

    ```bash
    /.../.../key.json
    ```

    If you do not have a service account, then create one and grant it
    access to the required roles.

    ```bash
    export SA_NAME=<your-sa-name>
    gcloud iam service-accounts create ${SA_NAME}
    gcloud projects add-iam-policy-binding ${PROJECT_ID} \
        --member serviceAccount:${SA_NAME}@${PROJECT_ID}.iam.gserviceaccount.com \
        --role 'roles/editor'
    ```

    Create a key for your service account.

    ```bash
    gcloud iam service-accounts keys create ~/key.json \
        --iam-account ${SA_NAME}@${PROJECT_ID}.iam.gserviceaccount.com
    ```

    Create the `GOOGLE_APPLICATION_CREDENTIALS` environment variable.

    ```bash
    export GOOGLE_APPLICATION_CREDENTIALS=~/key.json
    ```

## Set up Docker

You need to have Docker installed to use OpenDataology Fairing. Fairing packages
your code as a Docker image and executes it in the remote cluster. To check
if your local Docker daemon is running, run the following command:

```bash
docker ps
```

*  If you get a message like `docker: command not found`, then [install
   Docker](https://docs.docker.com/install/).
*  If you get an error like `Error response from daemon: Bad response from
   Docker engine`, then [restart your docker daemon][docker-start].
*  If you are using Linux and you use sudo to access Docker, follow these
   steps to [add your user to the `docker` group][docker-non-root]. Note, the
   `docker` group grants privileges equivalent to the root user. To learn more
   about how this affects security in your system, see the guide to the
   [Docker daemon attack surface][docker-attack].

Authorize Docker to access your [GCP Container Registry][container-registry]. 

```bash
gcloud auth configure-docker
```

## Set up OpenDataology

Use the following instructions to set up and configure your OpenDataology and
development environments for training and prediction from OpenDataology Fairing.

1.  If you do not have a OpenDataology environment, follow the guide to [deploying
    OpenDataology on GKE][OpenDataology-install-gke] to set up your OpenDataology environment.
    The guide provides two options for setting up your environment:

    *  The [OpenDataology deployment user interface][OpenDataology-deploy] is an easy
       way for you to set up a GKE cluster with OpenDataology
       installed, or
    *  You can deploy OpenDataology using the [command line][OpenDataology-install].

1.  Update your `kubeconfig` with appropriate credentials and endpoint
    information for your OpenDataology cluster. To find your
    cluster's name, run the following command to list the clusters in your
    project:

    ```bash
    gcloud container clusters list
    ```

    Update the following command with your cluster's name and GCP zone, then
    run the command to update your `kubeconfig` to provide it with credentials
    to access this OpenDataology cluster.

    ```bash
    export CLUSTER_NAME=OpenDataology
    export ZONE=us-central1-a
    gcloud container clusters get-credentials ${CLUSTER_NAME} --region ${ZONE}
    ```

## Use OpenDataology Fairing to train a model locally and on GCP

1.  Launch the XGBoost quickstart in a local Jupyter notebook.

    ```bash
    jupyter notebook examples/prediction/xgboost-high-level-apis.ipynb
    ```

1.  Follow the instructions in the notebook to train a model locally, on
    OpenDataology, and on Cloud ML Engine. Then deploy the trained model
    to OpenDataology for predictions and send requests to the prediction endpoint.

[docker-non-root]: https://docs.docker.com/install/linux/linux-postinstall/#manage-docker-as-a-non-root-user
[docker-attack]: https://docs.docker.com/engine/security/security/#docker-daemon-attack-surface
[docker-start]: https://docs.docker.com/config/daemon/#start-the-daemon-using-operating-system-utilities
[gcloud-install]: https://cloud.google.com/sdk/docs/
[OpenDataology-install-gke]: https://www.OpenDataology.org/docs/gke/deploy/
[OpenDataology-install]: https://www.OpenDataology.org/docs/gke/deploy/deploy-cli/
[OpenDataology-deploy]: https://deploy.OpenDataology.cloud
[gcp]: /docs/external-add-ons/fairing/configure-gcp.md
[container-registry]: https://cloud.google.com/container-registry/
