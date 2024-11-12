# KasmWeb Ubuntu Desktop Helm Chart

This Helm chart deploys the KasmWeb Ubuntu desktop application in Kubernetes.

## Prerequisites
- Kubernetes 1.28+
- Helm 3.x

## Installation

```bash
helm install my-ubuntu-desktop ./my-ubuntu-desktop

# KasmWeb Helm Chart

This is the Helm chart for deploying KasmWeb. It contains the necessary configuration parameters for deploying KasmWeb services.

## Parameters

### Global Parameters

| Name                                                | Description                                                             | Value |
|-----------------------------------------------------|-------------------------------------------------------------------------|-------|
| `global.imageRegistry`                              | Global Docker image registry                                             | `""`  |
| `global.imagePullSecrets`                           | Global Docker registry secret names as an array                         | `[]`  |
| `global.compatibility.openshift.adaptSecurityContext` | Adapt the securityContext sections of the deployment to make them compatible with Openshift restricted-v2 SCC | `auto` |

### Common Parameters

| Name                                               | Description                                                            | Value                        |
|----------------------------------------------------|------------------------------------------------------------------------|------------------------------|
| `nameOverride`                                     | String to partially override `nginx.fullname` template                 | `""`                         |
| `fullnameOverride`                                 | String to fully override `nginx.fullname` template                     | `""`                         |
| `namespaceOverride`                                | String to fully override `common.names.namespace`                      | `""`                         |
| `kubeVersion`                                      | Force target Kubernetes version (using Helm capabilities if not set)    | `""`                         |
| `clusterDomain`                                    | Kubernetes Cluster Domain                                              | `cluster.local`              |
| `extraDeploy`                                      | Extra objects to deploy (value evaluated as a template)                | `[]`                         |
| `commonLabels`                                     | Add labels to all the deployed resources                                | `{}`                         |
| `commonAnnotations`                                | Add annotations to all the deployed resources                           | `{}`                         |
| `diagnosticMode.enabled`                           | Enable diagnostic mode (all probes will be disabled)                   | `false`                      |
| `diagnosticMode.command`                           | Command to override all containers in the deployment(s)/statefulset(s) | `["sleep"]`                  |
| `diagnosticMode.args`                              | Args to override all containers in the deployment(s)/statefulset(s)    | `["infinity"]`               |

### KasmWeb Parameters

| Name                                               | Description                                                            | Value                        |
|----------------------------------------------------|------------------------------------------------------------------------|------------------------------|
| `image.registry`                                   | KasmWeb image registry                                                 | `REGISTRY_NAME`              |
| `image.repository`                                 | KasmWeb image repository                                               | `REPOSITORY_NAME/kasmweb`    |
| `image.pullPolicy`                                 | KasmWeb image pull policy                                              | `IfNotPresent`               |
| `image.pullSecrets`                                | Specify docker-registry secret names as an array                       | `[]`                         |
| `image.debug`                                      | Set to true if you would like to see extra information on logs         | `false`                      |
| `automountServiceAccountToken`                     | Mount Service Account token in pod                                     | `false`                      |

### KasmWeb Deployment Parameters

| Name                                               | Description                                                            | Value                        |
|----------------------------------------------------|------------------------------------------------------------------------|------------------------------|
| `replicaCount`                                     | Number of KasmWeb replicas to deploy                                   | `1`                          |
| `revisionHistoryLimit`                             | The number of old history to retain to allow rollback                  | `10`                         |
| `updateStrategy.type`                              | KasmWeb deployment strategy type                                        | `RollingUpdate`              |
| `podLabels`                                        | Additional labels for KasmWeb pods                                     | `{}`                         |
| `podAnnotations`                                   | Annotations for KasmWeb pods                                          | `{}`                         |
| `podAffinityPreset`                                | Pod affinity preset. Ignored if affinity is set. Allowed values: soft or hard | `""`                         |
| `podAntiAffinityPreset`                            | Pod anti-affinity preset. Ignored if affinity is set. Allowed values: soft or hard | `soft`                       |
| `nodeSelector`                                     | Node labels for pod assignment. Evaluated as a template                | `{}`                         |

### TLS Parameters

| Name                                               | Description                                                            | Value                        |
|----------------------------------------------------|------------------------------------------------------------------------|------------------------------|
| `tls.enabled`                                      | Enable TLS transport                                                  | `true`                       |
| `tls.autoGenerated`                                | Auto-generate self-signed certificates                                  | `true`                       |
| `tls.existingSecret`                               | Name of a secret containing the certificates                           | `""`                         |
| `tls.certFilename`                                 | Path of the certificate file when mounted as a secret                  | `tls.crt`                    |
| `tls.certKeyFilename`                              | Path of the certificate key file when mounted as a secret              | `tls.key`                    |

### Pod Security and Container Security Context

| Name                                                       | Description                                                  | Value          |
|------------------------------------------------------------|--------------------------------------------------------------|----------------|
| `podSecurityContext.enabled`                               | Enabled KasmWeb pods' Security Context                       | `true`         |
| `containerSecurityContext.enabled`                         | Enabled containers' Security Context                         | `true`         |
| `containerSecurityContext.runAsUser`                       | Set containers' Security Context runAsUser                   | `1001`         |
| `containerSecurityContext.runAsGroup`                      | Set containers' Security Context runAsGroup                  | `1001`         |

### Resources

| Name                                               | Description                                                            | Value                        |
|----------------------------------------------------|------------------------------------------------------------------------|------------------------------|
| `resourcesPreset`                                  | Set container resources according to one common preset (e.g., nano, small, medium) | `nano`                      |
| `resources`                                        | Set container requests and limits for different resources like CPU or memory | `{}`                         |

### Service Parameters

| Name                                               | Description                                                            | Value                        |
|----------------------------------------------------|------------------------------------------------------------------------|------------------------------|
| `serviceAccount.create`                            | Enable creation of ServiceAccount for KasmWeb pod                      | `true`                       |
| `serviceAccount.name`                              | The name of the ServiceAccount to use.                                 | `""`                         |

---

## Usage

### Installing the Chart

```bash
helm install kasmweb ./kasm-web-desktop

Upgrading the Chart
bash
复制代码
helm upgrade kasmweb ./kasm-web-desktop
Uninstalling the Chart
bash
复制代码
helm uninstall kasmweb
