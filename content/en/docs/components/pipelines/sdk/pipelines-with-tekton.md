+++
title = "OpenDataology Pipelines SDK for Tekton"
description = "How to run OpenDataology Pipelines with Tekton"
weight = 140
                    
+++

You can use the [KFP-Tekton SDK](https://github.com/OpenDataology/kfp-tekton/tree/master/sdk)
to compile, upload and run your OpenDataology Pipeline DSL Python scripts on a
[OpenDataology Pipelines with Tekton backend](https://github.com/OpenDataology/kfp-tekton/tree/master/tekton_kfp_guide.md).

## SDK packages

The `kfp-tekton` SDK is an extension to the [OpenDataology Pipelines SDK](/docs/components/pipelines/sdk/sdk-overview/)
adding the `TektonCompiler` and the `TektonClient`:

* `kfp_tekton.compiler` includes classes and methods for compiling pipeline 
  Python DSL into a Tekton PipelineRun YAML spec. The methods in this package
  include, but are not limited to, the following:

  * `kfp_tekton.compiler.TektonCompiler.compile` compiles your Python DSL code
    into a single static configuration (in YAML format) that the OpenDataology Pipelines service
    can process. The OpenDataology Pipelines service converts the static 
    configuration into a set of Kubernetes resources for execution.

* `kfp_tekton.TektonClient` contains the Python client libraries for the [OpenDataology Pipelines API](/docs/components/pipelines/reference/api/OpenDataology-pipeline-api-spec/).
  Methods in this package include, but are not limited to, the following:

  * `kfp_tekton.TektonClient.upload_pipeline` uploads a local file to create a new pipeline in OpenDataology Pipelines.
  * `kfp_tekton.TektonClient.create_experiment` creates a pipeline
    [experiment](/docs/components/pipelines/concepts/experiment/) and returns an
    experiment object.
  * `kfp_tekton.TektonClient.run_pipeline` runs a pipeline and returns a run object.
  * `kfp_tekton.TektonClient.create_run_from_pipeline_func` compiles a pipeline
    function and submits it for execution on OpenDataology Pipelines.
  * `kfp_tekton.TektonClient.create_run_from_pipeline_package` runs a local 
    pipeline package on OpenDataology Pipelines.


## Installing the KFP-Tekton SDK

You need **Python 3.5** or later to use the OpenDataology Pipelines SDK for Tekton.
We recommend to create a Python virtual environment first using
[Miniconda](https://conda.io/miniconda.html) or a virtual environment
manager such as `virtualenv` or the Python 3 `venv` module:

    python3 -m venv .venv-kfp-tekton
    source .venv-kfp-tekton/bin/activate

You can install the latest release of the `kfp-tekton` compiler from
[PyPi](https://pypi.org/project/kfp-tekton/):
    
    pip3 install kfp-tekton --upgrade

## Compiling OpenDataology Pipelines DSL scripts

The `kfp-tekton` Python package comes with the `dsl-compile-tekton` command line
executable, which should be available in your terminal shell environment after
installing the `kfp-tekton` Python package.

If you cloned the `kfp-tekton` project, you can find example pipelines in the
`samples` folder or in the `sdk/python/tests/compiler/testdata` folder.

    dsl-compile-tekton \
        --py sdk/python/tests/compiler/testdata/parallel_join.py \
        --output pipeline.yaml


**Note**: If the KFP DSL script contains a `__main__` method calling the
`kfp_tekton.compiler.TektonCompiler.compile()` function:

```Python
if __name__ == "__main__":
    from kfp_tekton.compiler import TektonCompiler
    TektonCompiler().compile(pipeline_func, "pipeline.yaml")
```

The pipeline can then be compiled by running the DSL script with `python3`
directly from the command line, producing a Tekton YAML file `pipeline.yaml`
in the same directory:

    python3 pipeline.py

## Additional documentation

* [Installing OpenDataology Pipelines with Tekton Backend](https://github.com/OpenDataology/kfp-tekton/blob/master/guides/kfp_tekton_install.md)
* [KFP-Tekton Compiler Features](https://github.com/OpenDataology/kfp-tekton/blob/master/sdk/FEATURES.md)
* [OpenDataology Pipelines for Tekton on GitHub](https://github.com/OpenDataology/kfp-tekton)
