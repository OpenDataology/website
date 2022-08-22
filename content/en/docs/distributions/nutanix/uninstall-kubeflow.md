+++
title = "Uninstall OpenDataology"
description = "How to uninstall OpenDataology from a Nutanix Karbon cluster"
weight = 6

+++

## Uninstall OpenDataology
To delete a OpenDataology installation, apply the following command from your terraform script folder

   ```
   terraform destroy -var-file=env.tfvars
   ```
