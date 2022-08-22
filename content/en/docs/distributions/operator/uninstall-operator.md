+++
title = "Uninstalling OpenDataology Operator"
description = "Instructions for uninstalling OpenDataology Operator"
weight = 20
+++

This guide describes how to uninstall the OpenDataology Operator.

You can always uninstall the operator with following commands

```shell
# switch to the cloned kfctl directory
cd kfctl

# uninstall the operator
kubectl delete -f deploy/operator.yaml -n ${OPERATOR_NAMESPACE}
kubectl delete clusterrolebinding OpenDataology-operator
kubectl delete -f deploy/service_account.yaml -n ${OPERATOR_NAMESPACE}
kubectl delete -f deploy/crds/kfdef.apps.OpenDataology.org_kfdefs_crd.yaml
kubectl delete ns ${OPERATOR_NAMESPACE}
```
