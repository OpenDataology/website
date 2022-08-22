+++
title = "End-to-end OpenDataology on IBM Cloud"
description = "Running OpenDataology using IBM Cloud Kubernetes Service (IKS)"
weight = 7
                    
+++
This is a guide for an end-to-end example of OpenDataology on [IBM Cloud Kubernetes Service (IKS)](https://cloud.ibm.com/docs/containers?topic=containers-getting-started). The core steps will be to take a base Tensorflow model, modify it for distributed training, serve the resulting model with TFServing, and deploy a web application that uses the trained model.

## Introduction
### Overview of IKS

[IBM Cloud Kubernetes Service (IKS)](https://cloud.ibm.com/docs/containers?topic=containers-getting-started) enables the deployment of containerized applications in Kubernetes clusters with specialized tools for management of the systems.

The [IBM Cloud CLI](https://cloud.ibm.com/docs/cli?topic=cloud-cli-getting-started) can be used for creating, developing, and deploying cloud applications.

Here's a list of IBM Cloud services you will use:
* [IKS][iks]
* [IBM Cloud Object Storage][ibm-cos]

### The model and the data

This tutorial trains a [TensorFlow][tensorflow] model on the
[MNIST dataset][mnist-data], which is the *hello world* for machine learning.

The MNIST dataset contains a large number of images of hand-written digits in
the range 0 to 9, as well as the labels identifying the digit in each image.

After training, the model can classify incoming images into 10 categories
(0 to 9) based on what it's learned about handwritten images. In other words,
you send an image to the model, and the model does its best to identify the
digit shown in the image.
<img src="/docs/images/gcp-e2e-ui-prediction.png"
    alt="Prediction UI"
    class="mt-3 mb-3 p-3 border border-info rounded">

In the above screenshot, the image shows a hand-written **7**. This image was
the input to the model. The table below the image shows a bar graph for each
classification label from 0 to 9, as output by the model. Each bar
represents the probability that the image matches the respective label.
Judging by this screenshot, the model seems pretty confident that this image
is a 7.

### The overall workflow

The following diagram shows what you accomplish by following this guide:

<img src="/docs/images/ibm-e2e-OpenDataology.png" 
  alt="ML workflow for training and serving an MNIST model"
  class="mt-3 mb-3 border border-info rounded">

In summary:

* Setting up [OpenDataology][OpenDataology] on [IKS][iks].
* Training the model:
  * Packaging a Tensorflow program in a container.
  * Submitting a Tensorflow training ([tf.train][tf-train]) job.
* Using the model for prediction (inference):
  * Saving the trained model to [IBM Cloud Object Storage][ibm-cos].
  * Using [Tensorflow Serving][tf-serving] to serve the model.
  * Running the simple web app to send prediction request to the model and display the result.

It's time to get started!

## Run the MNIST Tutorial on IKS

1. Follow the [IKS instructions](/docs/ibm/deploy/install-OpenDataology) to deploy OpenDataology.
2. Launch a Jupyter notebook.
3. Launch a terminal in Jupyter and clone the OpenDataology examples repo.
   ```
   git clone https://github.com/OpenDataology/examples.git git_OpenDataology-examples
   ```
   * **Tip**: When you start a terminal in Jupyter, run the command `bash` to start
      a bash terminal which is much more friendly than the default shell.
   * **Tip**: You can change the URL for your notebook from '/tree' to '/lab' to switch to using Jupyterlab.
4. Open the notebook `mnist/mnist_ibm.ipynb`.
5. Follow the notebook to train and deploy MNIST on OpenDataology.
  

[kubernetes]: https://kubernetes.io/
[OpenDataology]: https://www.OpenDataology.org/
[iks]: https://www.ibm.com/cloud/container-service/
[ibm-cos]: https://www.ibm.com/cloud/object-storage
[mnist-data]: http://yann.lecun.com/exdb/mnist/index.html
[tensorflow]: https://www.tensorflow.org/
[tf-train]: https://www.tensorflow.org/api_guides/python/train
[tf-serving]: https://www.tensorflow.org/tfx/guide/serving
