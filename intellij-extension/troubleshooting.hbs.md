# Troubleshoot Tanzu Developer Tools for IntelliJ

This topic helps you troubleshoot issues with Tanzu Developer Tools for IntelliJ.

## <a id="cannot-view-workloads"></a> Unable to view workloads on the panel when connected to GKE cluster

{{> 'partials/ide-extensions/ki-cannot-view-workloads' }}

## <a id="dsbl-lnch-ctrl"></a> Deactivated launch controls after running a launch configuration

### Symptom

When you run or debug a launch configuration, IntelliJ deactivates the launch controls.

### Cause

IntelliJ deactivates the launch controls to prevent other launch configurations from being launched
at the same time.
These controls are reactivated when the launch configuration is started.
As such, starting multiple Tanzu debug and live update sessions is a synchronous activity.

## <a id='dbg-fail-crrpt-lnch-conf'></a> Starting a Tanzu Debug session fails with `Unable to open debugger port`

### Symptom

You try to start a Tanzu Debug session and it immediately fails with an error message similar to:

```console
Error running 'Tanzu Debug - fortune-teller-fortune-service': Unable to open debugger port (localhost:5005): java.net.ConnectException "Connection refused"
```

### Cause

Old Tanzu Debug launch configurations sometimes appear to be corrupted after installing a later
version of the plug-in.
You can see whether this is the problem you are experiencing by opening the launch configuration:

1. Right-click `workload.yaml`.
1. Click **Modify Run Configuration...** in the menu.
1. Scroll down and expand the **Before Launch** section of the dialog.
1. Verify that it contains the two Unknown Task entries
   `com.vmware.tanzu.tanzuBeforeRunPortForward` and `com.vmware.tanzu.tanzuBeforeRunWorkloadApply`.

Because these two tasks are unknown causes, these steps of the debug launch are not run.
This in turn means that the target application is not deployed and accessible on the expected port,
which causes an error when the debugger tries to connect to it.

It might be that although the launch configuration appears corrupt when seen in the launch config
editor, in fact there is no corruption.
It's suspected that this problem only occurs when you install a new version of the plug-in and start
using it before first restarting IntelliJ.

There is possibly an issue in the IntelliJ platform that prevents completely or correctly initializing
the plug-in when the plug-in is hot-swapped into an active session instead of loaded on startup.

### Solution

Closing and restarting IntelliJ typically fixes this problem.
If that doesn't work for you, delete the old corrupted launch configuration and recreate it.

## <a id="live-update-timeout"></a> Timeout error when Live Updating

{{> 'partials/ide-extensions/ki-timeout-err-live-updating' }}

## <a id="panel-empty-gke"></a> Tanzu Panel empty when using a GKE cluster on macOS

### Symptom

On macOS, the Tanzu Panel doesn't display workloads or any other resources when using a GKE cluster.
Other tools, such as the [Tanzu CLI Apps plug-in](../cli-plugins/apps/overview.hbs.md), display
resources correctly.

### Cause

`gke-cloud-auth-plugin` is required to properly authenticate to a GKE cluster.
However, when starting IntelliJ from Dock or Spotlight, environment variables set by using
`.profile`, `.bash_profile`, or `.zshrc` are not available. For more information, see this
[YouTrack issue](https://youtrack.jetbrains.com/issue/IDEA-99154).

This might cause `gke-cloud-auth-plugin` to be missing from `PATH` when launching IntelliJ and prevent
the Tanzu Panel from reaching the cluster.

### Solution

Open IntelliJ from the CLI. Example command:

```console
open /Applications/IntelliJ\ IDEA.app
```

## <a id="panel-empty-kubeconfig"></a> Tanzu Panel empty when context is set using KUBECONFIG env variable

### Symptom

On macOS, the Tanzu Panel doesn't display workloads or any other resources when setting Kubernetes context via KUBECONFIG env variable.
Other tools, such as the [Tanzu CLI Apps plug-in](../cli-plugins/apps/overview.hbs.md), display
resources correctly.

### Cause

When starting IntelliJ from Dock or Spotlight, environment variables set by using
`.profile`, `.bash_profile`, or `.zshrc` are not available, this causes the panels to be empty because the extension can't find the right Kubernetes context. For more information, see this
[YouTrack issue](https://youtrack.jetbrains.com/issue/IDEA-99154).

### Solution

Open IntelliJ from the CLI. Example command:

```console
open /Applications/IntelliJ\ IDEA.app
```

## <a id="tnz-panel-k8s-rsrc-fail"></a> Tanzu panel shows workloads but doesn't show Kubernetes resources

### Symptom

The Tanzu panel shows workloads but doesn't show Kubernetes resources in the center panel of the
activity pane.

### Cause

When switching the Kubernetes context, the activity pane doesn't automatically update the namespace,
but the workload pane detects the new namespace.
Therefore, the Tanzu panel shows workloads but doesn't show Kubernetes resources in the center panel
of the activity pane.

### Solution

Restart IntelliJ to properly detect the context change.

## <a id="tnz-panel-actions-unavail"></a> Tanzu Workloads panel workloads only have describe and delete action

{{> 'partials/ide-extensions/ki-tnz-panel-actions-unavail' }}

## <a id="projects-with-spaces"></a> Workload actions do not work when in a project with spaces in the name

{{> 'partials/ide-extensions/ki-projects-with-spaces' }}