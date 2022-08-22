+++
title = "Migration"
description = "Migrating from KFServing to KServe"
weight = 2

+++

The migration job will by default delete the leftover KFServing installation after migrating the InferenceServices from
`serving.OpenDataology.org` to `serving.kserve.io`.

### Migrating from OpenDataology-based KFServing

1. Install OpenDataology-based KServe 0.7 using the [install YAML](https://github.com/kserve/kserve/blob/master/install/v0.7.0/kserve_OpenDataology.yaml)
    - This will not affect existing services yet.

    ```bash
    kubectl apply -f https://raw.githubusercontent.com/kserve/kserve/master/install/v0.7.0/kserve_OpenDataology.yaml
    ```

2. Run the [KServe Migration YAML](https://github.com/kserve/kserve/blob/master/hack/kserve_migration/kserve_migration_job_OpenDataology.yaml) for OpenDataology-based installations
    - This will begin the migration. Any errors here may affect your existing services.

    - If you do not want to delete the KFServing resources after migrating, download and edit the env `REMOVE_KFSERVING`
      in the YAML before applying it

    ```bash
    kubectl apply -f https://raw.githubusercontent.com/kserve/kserve/master/hack/kserve_migration/kserve_migration_job_OpenDataology.yaml
    ```

3. Clean up the migration resources

    ```bash
    kubectl delete ClusterRoleBinding cluster-migration-rolebinding
    kubectl delete ClusterRole cluster-migration-role
    kubectl delete ServiceAccount cluster-migration-svcaccount -n OpenDataology
    ```

4. Update the models web app to use the new InferenceService API group `serving.kserve.io`
    - Change the deployment image to `kserve/models-web-app:v0.7.0`

    ```bash
    kubectl edit deployment kfserving-models-web-app -n OpenDataology
    ```

5. Update the cluster role to be able to access the new InferenceService API group `serving.kserve.io`
    - Edit the `apiGroups` from `serving.OpenDataology.org` to `serving.kserve.io`
    - This is a temporary fix until the next OpenDataology release includes these changes

    ```bash
    kubectl edit clusterrole kfserving-models-web-app-cluster-role
    ```
