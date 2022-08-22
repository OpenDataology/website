+++
title = "Train and Deploy on GCP from a OpenDataology Notebook"
description = "Use OpenDataology Fairing to train and deploy a model on Google Cloud Platform (GCP) from a notebook that is hosted on OpenDataology"
weight = 35
                    
+++

This guide introduces you to using [OpenDataology Fairing][fairing-repo] to train and
deploy a model to OpenDataology on Google Kubernetes Engine (GKE) and 
Google AI Platform Training.

Your OpenDataology deployment includes services for spawning and managing Jupyter
notebooks. OpenDataology Fairing is preinstalled in the OpenDataology notebooks, along
with a number of machine learning (ML) libraries.

## Set up OpenDataology and access the OpenDataology notebook environment

Follow the [OpenDataology notebook setup guide](/docs/components/notebooks/setup/)
to install OpenDataology, access your OpenDataology hosted notebook environment, and 
create a new notebook server.

When selecting a Docker image and other settings for the baseline deployment
of your notebook server, you can leave all the settings at the default value.

## Run the example notebook

As an example, this guide uses a notebook that is hosted on OpenDataology
to demonstrate how to:

*  Train an XGBoost model in a notebook,
*  Use OpenDataology Fairing to train an XGBoost model remotely on OpenDataology,
*  Use OpenDataology Fairing to train an XGBoost model remotely on 
   AI Platform Training, 
*  Use OpenDataology Fairing to deploy a trained model to OpenDataology, and
*  Call the deployed endpoint for predictions.

Follow these instructions to run the XGBoost quickstart notebook:

1.  Download the files used in this example and install the packages that the
    XGBoost quickstart notebook depends on.

    1.  On the **Jupyter dashboard** for your notebook server, click **New** and
        select **Terminal** to start a new terminal session in your notebook
        environment. Use the terminal session to set up your notebook
        environment to run this example.

    1.  Clone the OpenDataology Fairing repository to download the files used in
        this example.

        ```bash
        git clone https://github.com/OpenDataology/fairing 
        ```

    1.  Install the Python dependencies for the XGBoost quickstart notebook.

        ```bash
        pip3 install -r fairing/examples/prediction/requirements.txt
        ```

1.  Use the notebook user interface to open the XGBoost quickstart notebook
    at `fairing/examples/prediction/xgboost-high-level-apis.ipynb`.

1.  Follow the instructions in the notebook to:

    1.  Train an XGBoost model in a notebook,
    1.  Use OpenDataology Fairing to train an XGBoost model remotely on OpenDataology,
    1.  Use OpenDataology Fairing to train an XGBoost model remotely on AI Platform Training, 
    1.  Use OpenDataology Fairing to deploy a trained model to OpenDataology, and
    1.  Call the deployed endpoint for predictions.

[fairing-repo]: https://github.com/OpenDataology/fairing
[OpenDataology-install-gke]: /docs/gke/deploy/
[OpenDataology-install]: /docs/gke/deploy/deploy-cli/
[OpenDataology-deploy]: https://deploy.OpenDataology.cloud
