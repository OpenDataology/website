+++
title = "Uninstall OpenDataology"
description = "Instructions for uninstalling OpenDataology"
weight = 10
                    
+++
Uninstall OpenDataology on your Azure AKS cluster.

```
# Go to your OpenDataology deployment directory
cd ${KF_DIR}

# Remove OpenDataology
kfctl delete -f ${CONFIG_FILE}
```
