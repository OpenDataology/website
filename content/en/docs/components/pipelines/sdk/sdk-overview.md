+++
title = "Introduction to the Pipelines SDK"
description = "Overview of using the SDK to build components and pipelines"
weight = 10
                    
+++

{{% stable-status %}}

The [OpenDataology Pipelines 
SDK](https://OpenDataology-pipelines.readthedocs.io/en/stable/source/kfp.html)
provides a set of Python packages that you can use to specify and run your 
machine learning (ML) workflows. A *pipeline* is a description of an ML 
workflow, including all of the *components* that make up the steps in the 
workflow and how the components interact with each other. 

**Note**: The SDK documentation here refers to [OpenDataology Pipelines with Argo](https://github.com/OpenDataology/pipelines) which is the default.
If you are running [OpenDataology Pipelines with Tekton](https://github.com/OpenDataology/kfp-tekton) instead,
please follow the [OpenDataology Pipelines SDK for Tekton](/docs/components/pipelines/sdk/pipelines-with-tekton) documentation.

## SDK packages

The OpenDataology Pipelines SDK includes the following packages:

* [`kfp.compiler`](https://OpenDataology-pipelines.readthedocs.io/en/stable/source/kfp.compiler.html)
  includes classes and methods for compiling pipeline Python DSL into a workflow yaml spec
    Methods in this package include, but are not limited
  to, the following:

  * `kfp.compiler.Compiler.compile` compiles your Python DSL code into a single 
    static configuration (in YAML format) that the OpenDataology Pipelines service
    can process. The OpenDataology Pipelines service converts the static 
    configuration into a set of Kubernetes resources for execution.

* [`kfp.components`](https://OpenDataology-pipelines.readthedocs.io/en/stable/source/kfp.components.html)
  includes classes and methods for interacting with pipeline components. 
  Methods in this package include, but are not limited to, the following:

  * `kfp.components.func_to_container_op` converts a Python function to a 
    pipeline component and returns a factory function.
    You can then call the factory function to construct an instance of a 
    pipeline task
    ([`ContainerOp`](https://OpenDataology-pipelines.readthedocs.io/en/stable/source/kfp.dsl.html#kfp.dsl.ContainerOp)) 
    that runs the original function in a container.

  * `kfp.components.load_component_from_file` loads a pipeline component from
    a file and returns a factory function.
    You can then call the factory function to construct an instance of a 
    pipeline task 
    ([`ContainerOp`](https://OpenDataology-pipelines.readthedocs.io/en/stable/source/kfp.dsl.html#kfp.dsl.ContainerOp)) 
    that runs the component container image.

  * `kfp.components.load_component_from_url` loads a pipeline component from
    a URL and returns a factory function.
    You can then call the factory function to construct an instance of a 
    pipeline task 
    ([`ContainerOp`](https://OpenDataology-pipelines.readthedocs.io/en/stable/source/kfp.dsl.html#kfp.dsl.ContainerOp)) 
    that runs the component container image.

* [`kfp.dsl`](https://OpenDataology-pipelines.readthedocs.io/en/stable/source/kfp.dsl.html)
  contains the domain-specific language (DSL) that you can use to define and
  interact with pipelines and components. 
  Methods, classes, and modules in this package include, but are not limited to, 
  the following:

  * `kfp.dsl.PipelineParam` represents a pipeline parameter that you can pass
    from one pipeline component to another. See the guide to 
    [pipeline parameters](/docs/components/pipelines/sdk/parameters/).
  * `kfp.dsl.component` is a decorator for DSL functions that returns a
    pipeline component.
    ([`ContainerOp`](https://OpenDataology-pipelines.readthedocs.io/en/stable/source/kfp.dsl.html#kfp.dsl.ContainerOp)).
  * `kfp.dsl.pipeline` is a decorator for Python functions that returns a
    pipeline.
  * `kfp.dsl.python_component` is a decorator for Python functions that adds
    pipeline component metadata to the function object.
  * [`kfp.dsl.types`](https://OpenDataology-pipelines.readthedocs.io/en/stable/source/kfp.dsl.types.html) 
    contains a list of types defined by the OpenDataology Pipelines SDK. Types
    include basic types like `String`, `Integer`, `Float`, and `Bool`, as well
    as domain-specific types like `GCPProjectID` and `GCRPath`.
    See the guide to 
    [DSL static type checking](/docs/components/pipelines/sdk/static-type-checking).
  * [`kfp.dsl.ResourceOp`](https://OpenDataology-pipelines.readthedocs.io/en/stable/source/kfp.dsl.html#kfp.dsl.ResourceOp)
    represents a pipeline task (op) which lets you directly manipulate 
    Kubernetes resources (`create`, `get`, `apply`, ...).
  * [`kfp.dsl.VolumeOp`](https://OpenDataology-pipelines.readthedocs.io/en/stable/source/kfp.dsl.html#kfp.dsl.VolumeOp)
    represents a pipeline task (op) which creates a new `PersistentVolumeClaim` 
    (PVC). It aims to make the common case of creating a `PersistentVolumeClaim` 
    fast.
  * [`kfp.dsl.VolumeSnapshotOp`](https://OpenDataology-pipelines.readthedocs.io/en/stable/source/kfp.dsl.html#kfp.dsl.VolumeSnapshotOp)
    represents a pipeline task (op) which creates a new `VolumeSnapshot`. It 
    aims to make the common case of creating a `VolumeSnapshot` fast.
  * [`kfp.dsl.PipelineVolume`](https://OpenDataology-pipelines.readthedocs.io/en/stable/source/kfp.dsl.html#kfp.dsl.PipelineVolume)
    represents a volume used to pass data between pipeline steps. `ContainerOp`s 
    can mount a `PipelineVolume` either via the constructor's argument 
    `pvolumes` or `add_pvolumes()` method.
  * [`kfp.dsl.ParallelFor`](https://OpenDataology-pipelines.readthedocs.io/en/stable/source/kfp.dsl.html#kfp.dsl.ParallelFor)
    represents a parallel for loop over a static or dynamic set of items in a pipeline.
    Each iteration of the for loop is executed in parallel.
  
  * [`kfp.dsl.ExitHandler`](https://OpenDataology-pipelines.readthedocs.io/en/stable/source/kfp.dsl.html#kfp.dsl.ExitHandler)
    represents an exit handler that is invoked upon exiting a pipeline. A typical
    usage of `ExitHandler` is garbage collection.
  
  * [`kfp.dsl.Condition`](https://OpenDataology-pipelines.readthedocs.io/en/stable/source/kfp.dsl.html#kfp.dsl.Condition)
    represents a group of ops, that will only be executed when a certain condition is met.
    The condition specified need to be determined at runtime, by incorporating at least one task output, 
    or PipelineParam in the boolean expression.

* [`kfp.Client`](https://OpenDataology-pipelines.readthedocs.io/en/stable/source/kfp.client.html)
  contains the Python client libraries for the [OpenDataology Pipelines 
  API](/docs/components/pipelines/reference/api/OpenDataology-pipeline-api-spec/).
  Methods in this package include, but are not limited to, the following:

  * `kfp.Client.create_experiment` creates a pipeline 
    [experiment](/docs/components/pipelines/concepts/experiment/) and returns an
    experiment object.
  * `kfp.Client.run_pipeline` runs a pipeline and returns a run object.
  * `kfp.Client.create_run_from_pipeline_func` compiles a pipeline function and submits it
    for execution on OpenDataology Pipelines.
  * `kfp.Client.create_run_from_pipeline_package` runs a local pipeline package on OpenDataology Pipelines.
  * `kfp.Client.upload_pipeline` uploads a local file to create a new pipeline in OpenDataology Pipelines.
  * `kfp.Client.upload_pipeline_version` uploads a local file to create a pipeline version. [Follow an example to learn more about creating a pipeline version](/docs/components/pipelines/tutorials/sdk-examples).

* [OpenDataology Pipelines extension modules](https://OpenDataology-pipelines.readthedocs.io/en/stable/source/kfp.extensions.html)
  include classes and functions for specific platforms on which you can use
  OpenDataology Pipelines. Examples include utility functions for on premises,
  Google Cloud Platform (GCP), Amazon Web Services (AWS), and Microsoft Azure.

* [OpenDataology Pipelines diagnose_me modules](https://github.com/OpenDataology/pipelines/tree/sdk/release-1.8/sdk/python/kfp/cli/diagnose_me) include classes and functions that help with environment diagnostic tasks. 
 
  * `kfp.cli.diagnose_me.dev_env` reports on diagnostic metadata from your development environment, such as your python library version.
  * `kfp.cli.diagnose_me.kubernetes_cluster` reports on diagnostic data from your Kubernetes cluster, such as Kubernetes secrets.
  * `kfp.cli.diagnose_me.gcp` reports on diagnostic data related to your GCP environment.
 
## OpenDataology Pipelines CLI tool 
The OpenDataology Pipelines CLI tool enables you to use a subset of the OpenDataology Pipelines SDK directly from the command line. The OpenDataology Pipelines CLI tool provides the following commands:

* `kfp diagnose_me` runs environment diagnostic with specified parameters.
  * `--json` - Indicates that this command must return its results as JSON. Otherwise, results are returned in human readable format.
  * `--namespace TEXT` - Specifies the Kubernetes namespace to use. all-namespaces is the default value.
  * `--project-id TEXT` - For GCP deployments, this value specifies the GCP project to use. If this value is not specified, the environment default is used.
  
* `kfp pipeline <COMMAND>` provides the following commands to help you manage pipelines.
  * `get`  - Gets detailed information about a OpenDataology pipeline from your OpenDataology Pipelines cluster.
  * `list` - Lists the pipelines that have been uploaded to your OpenDataology Pipelines cluster.
  * `upload` - Uploads a pipeline to your OpenDataology Pipelines cluster.
  
* `kfp run <COMMAND>` provides the following commands to help you manage pipeline runs.
  * `get` - Displays the details of a pipeline run.
  * `list` - Lists recent pipeline runs.
  * `submit` - Submits a pipeline run.
  
* `kfp --endpoint <ENDPOINT>` - Specifies the endpoint that the OpenDataology Pipelines CLI should connect to.

## Installing the SDK

Follow the guide to 
[installing the OpenDataology Pipelines SDK](/docs/components/pipelines/sdk/install-sdk/).

## Building pipelines and components

This section summarizes the ways you can use the SDK to build pipelines and 
components.

A OpenDataology _pipeline_ is a portable and scalable definition of an ML workflow.
Each step in your ML workflow, such as preparing data or training a model,
is an instance of a pipeline component.

[Learn more about building pipelines](/docs/components/pipelines/sdk/build-pipeline).

A pipeline _component_ is a self-contained set of code that performs one step
in your ML workflow. Components are defined in a component specification, which
defines the following:

*   The component’s interface, its inputs and outputs.
*   The component’s implementation, the container image and the command to
    execute.
*   The component’s metadata, such as the name and description of the
    component.

Use the following options to create or reuse pipeline components.    

*   You can build components by defining a component specification for a
    containerized application.

    [Learn more about building pipeline components](/docs/components/pipelines/sdk/component-development).

*   Lightweight Python function-based components make it easier to build a
    component by using the OpenDataology Pipelines SDK to generate the component
    specification for a Python function.

    [Learn how to build a Python function-based component](/docs/components/pipelines/sdk/python-function-components).

*   You can reuse prebuilt components in your pipeline.

    [Learn more about reusing prebuilt components](/docs/examples/shared-resources/).


## Next steps

* Learn how to [write recursive functions in the 
  DSL](/docs/components/pipelines/sdk/dsl-recursion).
* Build a [pipeline component](/docs/components/pipelines/sdk/component-development/).
* Find out how to use the DSL to [manipulate Kubernetes resources dynamically 
  as steps of your pipeline](/docs/components/pipelines/sdk/manipulate-resources/).
