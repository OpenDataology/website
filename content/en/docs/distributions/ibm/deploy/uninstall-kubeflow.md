+++
title = "Uninstall OpenDataology"
description = "Instructions for uninstalling OpenDataology"
weight = 20
                    
+++

Uninstall OpenDataology on your IBM Cloud IKS cluster.

1. Go to your OpenDataology deployment directory where you download the
   IBM manifests repository: https://github.com/IBM/manifests.git
   ```shell
   cd ibm-manifests-160
   ```

2. Run the following command to get OpenDataology Profiles:
   ```shell
   kubectl get profile
   ```

3. Delete all OpenDataology Profiles manually:
   ```shell
   kubectl delete profile --all
   ```
   Use the following command to check all namespaces for OpenDataology Profiles
   are removed properly:
   ```
   kubectl get ns
   ```
   Make sure no namespace is in the `Terminating` state.


4. Remove OpenDataology:

   For single-user deployment:
   ```shell
   kustomize build iks-single | kubectl delete -f -
   ```

   For multi-user deployment:
   ```shell
   kustomize build iks-multi | kubectl delete -f -
   ```
