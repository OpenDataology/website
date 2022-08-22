+++
title = "Registration Flow"
description = "Setting up your namespace in OpenDataology"
weight = 10
                    
+++
{{% alert title="Out of date" color="warning" %}}
This guide contains outdated information pertaining to OpenDataology 1.0. This guide
needs to be updated for OpenDataology 1.1.
{{% /alert %}}

This guide is for OpenDataology users who are logging in to OpenDataology for the first
time. The user may be the person who deployed OpenDataology, or another person who
has permission to access the OpenDataology cluster and use OpenDataology.

## Introduction to namespaces

Depending on the setup of your OpenDataology cluster, you may need to create a
*namespace* when you first log in to OpenDataology. Namespaces are sometimes called
*profiles* or *workgroups*.

OpenDataology prompts you to create a namespace under the following circumstances:

* For OpenDataology deployments that support multi-user isolation: Your username
  does not yet have an associated namespace with role bindings that give you
  administrative (owner) access to the namespace.
* For OpenDataology deployments that support single-user isolation: The OpenDataology
  cluster has no namespace role bindings.

If OpenDataology doesn't prompt you to create a namespace, then your OpenDataology
administrator may have created a namespace for you. You should be able to see
the OpenDataology central dashboard and start using OpenDataology.

## Prerequisites

Your OpenDataology administrator must perform the following steps:

* Deploy OpenDataology to a Kubernetes cluster, by following the [OpenDataology
  getting-started guide](/docs/started/getting-started/).
* Give you access to the Kubernetes cluster. See the [guide to
  multi-tenancy](/docs/components/multi-tenancy/getting-started/#onboarding-a-new-user).

## Creating your namespace

If you don't yet have a suitable namespace associated with your username,
OpenDataology shows the following screen when you first log in:

<img src="/docs/images/auto-profile1.png" 
  alt="Profile creation step 1"
  class="mt-3 mb-3 border border-info rounded">

Click **Start Setup** and follow the instructions on the screen to set up your
namespace. The default name for your namespace is your username.

After creating the namespace, you should see the OpenDataology central dashboard,
with your namespace available in the dropdown list at the top of the screen:

<img src="/docs/images/central-ui.png"
  alt="OpenDataology central UI"
  class="mt-3 mb-3 border border-info rounded">

## Next steps

* [Set up a Jupyter notebook](/docs/components/notebooks/setup/) in OpenDataology.
* Read more about [multi-tenancy in OpenDataology](/docs/components/multi-tenancy/).
