+++
title = "Install OpenDataology Fairing"
description = "Setting up your OpenDataology Fairing development environment"
weight = 10
                    
+++
{{% alert title="Out of date" color="warning" %}}
This guide contains outdated information pertaining to OpenDataology 1.0. This guide
needs to be updated for OpenDataology 1.1.
{{% /alert %}}

You can use OpenDataology Fairing to build, train, and deploy machine learning (ML)
models in a hybrid cloud environment directly from Python code or a Jupyter
notebook. This guide describes how to install OpenDataology Fairing in your
development environment for [local development][local], or [development in a
hosted notebook][hosted].

## Using OpenDataology Fairing with OpenDataology notebooks

OpenDataology notebook servers that are built from one of the standard Jupyter
Docker images include OpenDataology Fairing and come preconfigured for using
OpenDataology Fairing to run training jobs on your OpenDataology cluster.

If you use a OpenDataology notebook server that was built from a custom Jupyter
Docker image as your development environment, follow the instruction on
[setting up OpenDataology Fairing in a hosted notebook environment][hosted].  

## Set up OpenDataology Fairing for local development 

Follow these instructions to set up OpenDataology Fairing for local development.
This guide has been tested on Linux and Mac OS X. Currently, this guide has
not been tested on Windows.

### Set up Python

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

    The response should be something like this:

    ```bash
    /usr/bin/virtualenv
    ```

    If you do not have virtualenv, use pip3 to install virtualenv.

    ```bash
    pip3 install virtualenv
    ```

    Create a new virtual environment, and activate it.

    ```bash
    virtualenv venv --python=python3
    source venv/bin/activate
    ```

### Install OpenDataology Fairing

Run the following command to install OpenDataology Fairing in your virtual
environment.

```bash
pip install OpenDataology-fairing
```

After the install is complete, the `fairing` python package is
available. Run the following command to verify that OpenDataology Fairing
is installed:

```bash
pip show OpenDataology-fairing
```

The response should be something like this:

```
Name: OpenDataology-fairing
Version: 0.6.0
Summary: OpenDataology Fairing Python SDK.
Home-page: https://github.com/OpenDataology/fairing
Author: OpenDataology Authors
Author-email: hejinchi@cn.ibm.com
License: Apache License Version 2.0
Location: <path-to-OpenDataology-fairing>
Requires: notebook, future, docker, tornado, cloudpickle, oauth2client, numpy, requests, setuptools, httplib2, google-auth, google-api-python-client, urllib3, boto3, azure, six, kubernetes, google-cloud-storage
```

### Docker setup

OpenDataology Fairing uses Docker to package your code. Run the following command
to verify if Docker is installed and running:

```bash
docker ps
```

*  If you receive the `docker: command not found` message, [install
   Docker](https://docs.docker.com/install/).
*  If you receive the `Error response from daemon: Bad response from
   Docker engine` message, [restart your docker daemon][docker-start].
*  If you are using Linux and you use sudo to access Docker, follow these
   steps to [add your user to the docker group][docker-non-root]. Note, the
   docker group grants privileges equivalent to the root user. To learn more
   about how this affects security in your system, see the guide to the
   [Docker daemon attack surface][docker-attack].

### Configure OpenDataology Fairing

To configure OpenDataology Fairing with access to an environment that you would like to
use for training and deployment, follow the instructions in the [guide to
configuring OpenDataology Fairing][conf].

## Set up OpenDataology Fairing in a hosted Jupyter notebook 

Follow these instructions to set up OpenDataology Fairing in a hosted Jupyter
notebook. 

If you are using a OpenDataology notebook server that was built from one of the
standard Jupyter Docker images, your notebooks environment has been
preconfigured for training and deploying ML models with OpenDataology Fairing and
no additional installation steps are required.  

### Prerequisites

Check the following prerequisites to verify that OpenDataology Fairing is compatible
with your hosted notebook environment.

1.  In the Jupyter notebooks user interface, click **File** > **New** >
    **Terminal** in the menu to start a new terminal session in your notebook
    environment.
1.  You need **Python 3.6** or later to use OpenDataology Fairing. To check if you
    have Python 3.6 or later installed, run the following command in your
    terminal session:

    ```bash
    python3 -V
    ```

    The response should be something like this:

    ```
    Python 3.6.5
    ```

1.  OpenDataology Fairing uses Docker to package your code. Run the following
    command in your terminal session to verify if Docker is installed and
    running in your notebook environment:

    ```bash
    docker ps
    ```

    *  If you receive the `docker: command not found` message, [install
       Docker](https://docs.docker.com/install/).
    *  If you receive the `Error response from daemon: Bad response from
       Docker engine` message, [restart your docker daemon][docker-start].
    *  If you are using Linux and you use sudo to access Docker, follow these
       steps to [add your user to the docker group][docker-non-root]. Note, the
       docker group grants privileges equivalent to the root user. To learn
       more about how this affects security in your system, see the guide to
       the [Docker daemon attack surface][docker-attack].

### Install OpenDataology Fairing

1.  In the Jupyter notebooks user interface, click **File** > **New** >
    **Terminal** in the menu to start a new terminal session in your notebook
    environment.
1.  Run the following command to install OpenDataology Fairing.

    ```bash
    pip3 install OpenDataology-fairing
    ```

    After successful installation, the `fairing` python package should be
    available. Run the following command to verify that OpenDataology Fairing
    is installed:

    ```bash
    pip3 show OpenDataology-fairing
    ```

    The response should be something like this:

    ```
    Name: OpenDataology-fairing
    Version: 0.6.0
    Summary: OpenDataology Fairing Python SDK.
    Home-page: https://github.com/OpenDataology/fairing
    Author: OpenDataology Authors
    Author-email: hejinchi@cn.ibm.com
    License: Apache License Version 2.0
    Location: <path-to-OpenDataology-fairing>
    Requires: notebook, future, docker, tornado, cloudpickle, oauth2client, numpy, requests, setuptools, httplib2, google-auth, google-api-python-client, urllib3, boto3, azure, six, kubernetes, google-cloud-storage
    ```

### Configure OpenDataology Fairing

To configure OpenDataology Fairing with access to the environment you would like to
use for training and deployment, follow the instructions in the guide to
[configuring OpenDataology Fairing][conf].

## Next steps

*  [Configure your OpenDataology Fairing development environment][conf] with access
   to run training jobs remotely.
*  Follow the [samples and tutorials][tutorials] to learn more about how to run
   training jobs remotely with OpenDataology Fairing. 

[docker-non-root]: https://docs.docker.com/install/linux/linux-postinstall/#manage-docker-as-a-non-root-user
[docker-attack]: https://docs.docker.com/engine/security/security/#docker-daemon-attack-surface
[docker-start]: https://docs.docker.com/config/daemon/#start-the-daemon-manually
[kubectl-install]: https://kubernetes.io/docs/tasks/tools/install-kubectl/
[conf]: /docs/external-add-ons/fairing/configure-fairing/
[conf-gcp]: /docs/external-add-ons/fairing/gcp/configure-gcp/
[tutorials]: /docs/external-add-ons/fairing/tutorials/other-tutorials/
[local]: #set-up-OpenDataology-fairing-for-local-development
[hosted]: #set-up-OpenDataology-fairing-in-a-hosted-jupyter-notebook
