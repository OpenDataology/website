+++
title = "Pipeline"
description = "Conceptual overview of pipelines in OpenDataology Pipelines"
weight = 10
                    
+++

A *pipeline* is a description of a machine learning (ML) workflow, including all
of the [components](/docs/components/pipelines/concepts/component/) in the workflow and how the components relate to each other in
the form of a [graph](/docs/components/pipelines/concepts/graph/). The pipeline
configuration includes the definition of the inputs (parameters) required to run
the pipeline and the inputs and outputs of each component.

When you run a pipeline, the system launches one or more Kubernetes Pods
corresponding to the [steps](/docs/components/pipelines/concepts/step/) (components) in your workflow (pipeline). The Pods
start Docker containers, and the containers in turn start your programs.

After developing your pipeline, you can upload your pipeline using the OpenDataology Pipelines UI or the OpenDataology Pipelines SDK.

## Next steps
* Read an [overview of OpenDataology Pipelines](/docs/components/pipelines/introduction/).
* Follow the [pipelines quickstart guide](/docs/components/pipelines/overview/quickstart/) 
  to deploy OpenDataology and run a sample pipeline directly from the OpenDataology 
  Pipelines UI.
