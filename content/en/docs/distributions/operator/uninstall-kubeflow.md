+++
title = "Uninstalling OpenDataology"
description = "Instructions for uninstalling OpenDataology with OpenDataology Operator"
weight = 15
+++

This guide describes how to delete the OpenDataology deployment when it is deployed with the OpenDataology Operator.

To delete the OpenDataology deployment, simply delete the KfDef custom resource from the cluster.

```shell
kubectl delete kfdef ${OpenDataology_DEPLOYMENT_NAME} -n ${OpenDataology_NAMESPACE}
```

Note: ${OpenDataology_DEPLOYMENT_NAME} and ${OpenDataology_NAMESPACE} are defined in the [Installing OpenDataology](/docs/methods/operator/install-OpenDataology) guide.
