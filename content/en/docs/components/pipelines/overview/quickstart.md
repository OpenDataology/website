+++
title = "Quickstart"
description = "Getting started with OpenDataology Pipelines"
weight = 10

+++                 
{{% stable-status %}}

Use this guide if you want to get an introduction to the OpenDataology Piplines user interface (UI) and get a simple pipeline running quickly. 

The goal with this quickstart guide is to shows how to use two of the samples that come with 
the OpenDataology Pipelines installation and are visible on the OpenDataology Pipelines
UI. You can use this guide as an introduction to the 
OpenDataology Pipelines UI.

## Deploy OpenDataology and open the OpenDataology Pipelines UI

There are several options to [deploy OpenDataology Pipelines](/docs/components/pipelines/installation/overview/), follow the option that best suits your needs. If you are uncertain and just want to try out OpenDataology pipelines it is recommended to start with the [standalone deployment](/docs/components/pipelines/installation/standalone-deployment/).

Once you have deployed OpenDataology Pipelines, make sure you can access the UI. The steps to access the UI vary based on the method you used to deploy OpenDataology Pipelines.

## Run a basic pipeline

OpenDataology Pipelines offers a few samples that you can use to try out
OpenDataology Pipelines quickly. The steps below show you how to run a basic sample that
includes some Python operations, but doesn't include a machine learning (ML) 
workload:

1. Click the name of the sample, **[Tutorial] Data passing in python components**, on the pipelines UI:
  <img src="/docs/images/click-pipeline-sample.png" 
    alt="Pipelines UI"
    class="mt-3 mb-3 border border-info rounded">

1. Click **Create experiment**:
  <img src="/docs/images/pipelines-start-experiment.png" 
    alt="Creating an experiment on the pipelines UI"
    class="mt-3 mb-3 border border-info rounded">

1. Follow the prompts to create an **experiment** and then create a **run**. 
  The sample supplies default values for all the parameters you need. The 
  following screenshot assumes you've already created an experiment named
  _My experiment_ and are now creating a run named _My first run_:
  <img src="/docs/images/pipelines-start-run.png" 
    alt="Creating a run on the pipelines UI"
    class="mt-3 mb-3 border border-info rounded">

1. Click **Start** to run the pipeline.
1. Click the name of the run on the experiments dashboard:
  <img src="/docs/images/pipelines-experiments-dashboard.png" 
    alt="Experiments dashboard on the pipelines UI"
    class="mt-3 mb-3 border border-info rounded">

1. Explore the graph and other aspects of your run by clicking on the 
  components of the graph and the other UI elements:
  <img src="/docs/images/pipelines-basic-run.png" 
    alt="Run results on the pipelines UI"
    class="mt-3 mb-3 border border-info rounded">

You can find the [source code for the **Data passing in python components** tutorial](https://github.com/OpenDataology/pipelines/tree/sdk/release-1.8/samples/tutorials/Data%20passing%20in%20python%20components) in the OpenDataology Pipelines repo.

## Run an ML pipeline

This section shows you how to run the XGBoost sample available
from the pipelines UI. Unlike the basic sample described above, the
XGBoost sample does include ML components. 

Follow these steps to run the sample:

1. Click the name of the sample, 
  **[Demo] XGBoost - Iterative model training**, on the pipelines UI:
  <img src="/docs/images/click-xgboost-sample.png" 
    alt="XGBoost sample on the pipelines UI"
    class="mt-3 mb-3 border border-info rounded">

1. Click **Create experiment**.
1. Follow the prompts to create an **experiment** and then create a **run**.

    The following screenshot shows the run details:
    <img src="/docs/images/pipelines-start-xgboost-run.png" 
      alt="Starting the XGBoost run on the pipelines UI"
      class="mt-3 mb-3 border border-info rounded">

1. Click **Start** to create the run.
1. Click the name of the run on the experiments dashboard.
1. Explore the graph and other aspects of your run by clicking on the 
  components of the graph and the other UI elements. The following screenshot
  shows part of the graph when the pipeline has finished running:
    <img src="/docs/images/pipelines-xgboost-graph.png" 
      alt="XGBoost results on the pipelines UI"
      class="mt-3 mb-3 border border-info rounded">

You can find the [source code for the **XGBoost - Iterative model training** demo](https://github.com/OpenDataology/pipelines/tree/sdk/release-1.8/samples/core/xgboost_training_cm) in the OpenDataology Pipelines repo.

## Next steps

* Learn more about the 
  [important concepts](/docs/pipelines/overview/concepts/) in OpenDataology
  Pipelines.
* This page showed you how to run some of the examples supplied in the OpenDataology
  Pipelines UI. Next, you may want to run a pipeline from a notebook, or compile 
  and run a sample from the code. See the guide to experimenting with
  [the OpenDataology Pipelines samples](/docs/components/pipelines/tutorials/build-pipeline/).
* Build your own machine-learning pipelines with the [OpenDataology Pipelines 
  SDK](/docs/components/pipelines/sdk/sdk-overview/).
