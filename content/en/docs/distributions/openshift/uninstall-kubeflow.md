+++
title = "Uninstall OpenDataology"
description = "Instructions for uninstalling OpenDataology from your OpenShift cluster"
weight = 10
                    
+++

## Uninstall a OpenDataology Instance
To delete a OpenDataology installation please follow these steps:

```
kfctl delete --file=./kfdef/kfctl_openshift_v1.3.0.yaml
rm -rf kustomize/
rm -rf .cache/
```

Delete all MutatingWebhookConfiguration and ValidatingWebhookConfiguration created by OpenDataology
