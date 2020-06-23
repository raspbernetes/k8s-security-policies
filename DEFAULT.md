<h1 align="center">
  <p align="center">Kubernetes 1.18.x Default Benchmark</p>
  <a href="https://raspbernetes.github.io/docs/"><img src="https://raspbernetes.github.io/img/logo.svg" alt="Raspbernetes"></a>
</h1>

# Control Plane Components

## Master Node Configuration Files

<span style="color:blue">[INFO]</span> 1 Master Node Security Configuration

<span style="color:blue">[INFO]</span> 1.1 Master Node Configuration Files

<span style="color:green">[PASS]</span> 1.1.1 Ensure that the API server pod specification file permissions are set to 644 or more restrictive (Scored)

<span style="color:green">[PASS]</span> 1.1.2 Ensure that the API server pod specification file ownership is set to root:root (Scored)

<span style="color:green">[PASS]</span> 1.1.3 Ensure that the controller manager pod specification file permissions are set to 644 or more restrictive (Scored)

<span style="color:green">[PASS]</span> 1.1.4 Ensure that the controller manager pod specification file ownership is set to root:root (Scored)

<span style="color:green">[PASS]</span> 1.1.5 Ensure that the scheduler pod specification file permissions are set to 644 or more restrictive (Scored)

<span style="color:green">[PASS]</span> 1.1.6 Ensure that the scheduler pod specification file ownership is set to root:root (Scored)

<span style="color:green">[PASS]</span> 1.1.7 Ensure that the etcd pod specification file permissions are set to 644 or more restrictive (Scored)

<span style="color:green">[PASS]</span> 1.1.8 Ensure that the etcd pod specification file ownership is set to root:root (Scored)

<span style="color:yellow">[WARN]</span> 1.1.9 Ensure that the Container Network Interface file permissions are set to 644 or more restrictive (Not Scored)

<span style="color:yellow">[WARN]</span> 1.1.10 Ensure that the Container Network Interface file ownership is set to root:root (Not Scored)

<span style="color:green">[PASS]</span> 1.1.11 Ensure that the etcd data directory permissions are set to 700 or more restrictive (Scored)

<span style="color:red">[FAIL]</span> 1.1.12 Ensure that the etcd data directory ownership is set to etcd:etcd (Scored)

<span style="color:green">[PASS]</span> 1.1.13 Ensure that the admin.conf file permissions are set to 644 or more restrictive (Scored)

<span style="color:green">[PASS]</span> 1.1.14 Ensure that the admin.conf file ownership is set to root:root (Scored)

<span style="color:green">[PASS]</span> 1.1.15 Ensure that the scheduler.conf file permissions are set to 644 or more restrictive (Scored)

<span style="color:green">[PASS]</span> 1.1.16 Ensure that the scheduler.conf file ownership is set to root:root (Scored)

<span style="color:green">[PASS]</span> 1.1.17 Ensure that the controller-manager.conf file permissions are set to 644 or more restrictive (Scored)

<span style="color:green">[PASS]</span> 1.1.18 Ensure that the controller-manager.conf file ownership is set to root:root (Scored)

<span style="color:yellow">[WARN]</span> 1.1.19 Ensure that the Kubernetes PKI directory and file ownership is set to root:root (Scored)

<span style="color:yellow">[WARN]</span> 1.1.20 Ensure that the Kubernetes PKI certificate file permissions are set to 644 or more restrictive (Scored)

<span style="color:yellow">[WARN]</span> 1.1.21 Ensure that the Kubernetes PKI key file permissions are set to 600 (Scored)

## API Server

<span style="color:blue">[INFO]</span> 1.2 API Server

<span style="color:yellow">[WARN]</span> 1.2.1 Ensure that the --anonymous-auth argument is set to false (Not Scored)

<span style="color:green">[PASS]</span> 1.2.2 Ensure that the --basic-auth-file argument is not set (Scored)

<span style="color:green">[PASS]</span> 1.2.3 Ensure that the --token-auth-file parameter is not set (Scored)

<span style="color:green">[PASS]</span> 1.2.4 Ensure that the --kubelet-https argument is set to true (Scored)

<span style="color:green">[PASS]</span> 1.2.5 Ensure that the --kubelet-client-certificate and --kubelet-client-key arguments are set as appropriate (Scored)

<span style="color:red">[FAIL]</span> 1.2.6 Ensure that the --kubelet-certificate-authority argument is set as appropriate (Scored)

<span style="color:green">[PASS]</span> 1.2.7 Ensure that the --authorization-mode argument is not set to AlwaysAllow (Scored)

<span style="color:green">[PASS]</span> 1.2.8 Ensure that the --authorization-mode argument includes Node (Scored)

<span style="color:green">[PASS]</span> 1.2.9 Ensure that the --authorization-mode argument includes RBAC (Scored)

<span style="color:yellow">[WARN]</span> 1.2.10 Ensure that the admission control plugin EventRateLimit is set (Not Scored)

<span style="color:green">[PASS]</span> 1.2.11 Ensure that the admission control plugin AlwaysAdmit is not set (Scored)

<span style="color:yellow">[WARN]</span> 1.2.12 Ensure that the admission control plugin AlwaysPullImages is set (Not Scored)

<span style="color:yellow">[WARN]</span> 1.2.13 Ensure that the admission control plugin SecurityContextDeny is set if PodSecurityPolicy is not used (Not Scored)

<span style="color:green">[PASS]</span> 1.2.14 Ensure that the admission control plugin ServiceAccount is set (Scored)

<span style="color:green">[PASS]</span> 1.2.15 Ensure that the admission control plugin NamespaceLifecycle is set (Scored)

<span style="color:red">[FAIL]</span> 1.2.16 Ensure that the admission control plugin PodSecurityPolicy is set (Scored)

<span style="color:green">[PASS]</span> 1.2.17 Ensure that the admission control plugin NodeRestriction is set (Scored)

<span style="color:green">[PASS]</span> 1.2.18 Ensure that the --insecure-bind-address argument is not set (Scored)

<span style="color:green">[PASS]</span> 1.2.19 Ensure that the --insecure-port argument is set to 0 (Scored)

<span style="color:green">[PASS]</span> 1.2.20 Ensure that the --secure-port argument is not set to 0 (Scored)

<span style="color:red">[FAIL]</span> 1.2.21 Ensure that the --profiling argument is set to false (Scored)

<span style="color:red">[FAIL]</span> 1.2.22 Ensure that the --audit-log-path argument is set (Scored)

<span style="color:red">[FAIL]</span> 1.2.23 Ensure that the --audit-log-maxage argument is set to 30 or as appropriate (Scored)

<span style="color:red">[FAIL]</span> 1.2.24 Ensure that the --audit-log-maxbackup argument is set to 10 or as appropriate (Scored)

<span style="color:red">[FAIL]</span> 1.2.25 Ensure that the --audit-log-maxsize argument is set to 100 or as appropriate (Scored)

<span style="color:green">[PASS]</span> 1.2.26 Ensure that the --request-timeout argument is set as appropriate (Scored)

<span style="color:green">[PASS]</span> 1.2.27 Ensure that the --service-account-lookup argument is set to true (Scored)

<span style="color:green">[PASS]</span> 1.2.28 Ensure that the --service-account-key-file argument is set as appropriate (Scored)

<span style="color:green">[PASS]</span> 1.2.29 Ensure that the --etcd-certfile and --etcd-keyfile arguments are set as appropriate (Scored)

<span style="color:green">[PASS]</span> 1.2.30 Ensure that the --tls-cert-file and --tls-private-key-file arguments are set as appropriate (Scored)

<span style="color:green">[PASS]</span> 1.2.31 Ensure that the --client-ca-file argument is set as appropriate (Scored)

<span style="color:green">[PASS]</span> 1.2.32 Ensure that the --etcd-cafile argument is set as appropriate (Scored)

<span style="color:red">[FAIL]</span> 1.2.33 Ensure that the --encryption-provider-config argument is set as appropriate (Scored)

<span style="color:yellow">[WARN]</span> 1.2.34 Ensure that encryption providers are appropriately configured (Scored)

<span style="color:yellow">[WARN]</span> 1.2.35 Ensure that the API Server only makes use of Strong Cryptographic Ciphers (Not Scored)

## Controller Manager

<span style="color:blue">[INFO]</span> 1.3 Controller Manager

<span style="color:red">[FAIL]</span> 1.3.1 Ensure that the --terminated-pod-gc-threshold argument is set as appropriate (Scored)

<span style="color:red">[FAIL]</span> 1.3.2 Ensure that the --profiling argument is set to false (Scored)

<span style="color:green">[PASS]</span> 1.3.3 Ensure that the --use-service-account-credentials argument is set
to true (Scored)

<span style="color:green">[PASS]</span> 1.3.4 Ensure that the --service-account-private-key-file argument is
set as appropriate (Scored)

<span style="color:green">[PASS]</span> 1.3.5 Ensure that the --root-ca-file argument is set as appropriate (Scored)

<span style="color:red">[FAIL]</span> 1.3.6 Ensure that the RotateKubeletServerCertificate argument is set to true (Scored)

<span style="color:green">[PASS]</span> 1.3.7 Ensure that the --bind-address argument is set to 127.0.0.1 (Scored)

## Scheduler

<span style="color:blue">[INFO]</span> 1.4 Scheduler

<span style="color:red">[FAIL]</span> 1.4.1 Ensure that the --profiling argument is set to false (Scored)

<span style="color:green">[PASS]</span> 1.4.2 Ensure that the --bind-address argument is set to 127.0.0.1 (Scored)

# Etcd

<span style="color:blue">[INFO]</span> 2 Etcd Node Configuration

<span style="color:blue">[INFO]</span> 2 Etcd Node Configuration Files

<span style="color:green">[PASS]</span> 2.1 Ensure that the --cert-file and --key-file arguments are set as appropriate (Scored)

<span style="color:green">[PASS]</span> 2.2 Ensure that the --client-cert-auth argument is set to true (Scored)

<span style="color:green">[PASS]</span> 2.3 Ensure that the --auto-tls argument is not set to true (Scored)

<span style="color:green">[PASS]</span> 2.4 Ensure that the --peer-cert-file and --peer-key-file arguments are set as appropriate (Scored)

<span style="color:green">[PASS]</span> 2.5 Ensure that the --peer-client-cert-auth argument is set to true (Scored)

<span style="color:green">[PASS]</span> 2.6 Ensure that the --peer-auto-tls argument is not set to true (Scored)

<span style="color:green">[PASS]</span> 2.7 Ensure that a unique Certificate Authority is used for etcd (Not Scored)

# Control Plane Configuration

## Authentication and Authorization

<span style="color:blue">[INFO]</span> 3 Control Plane Configuration

<span style="color:blue">[INFO]</span> 3.1 Authentication and Authorization

<span style="color:yellow">[WARN]</span> 3.1.1 Client certificate authentication should not be used for users (Not Scored)

## Logging

<span style="color:blue">[INFO]</span> 3.2 Logging

<span style="color:yellow">[WARN]</span> 3.2.1 Ensure that a minimal audit policy is created (Scored)

<span style="color:yellow">[WARN]</span> 3.2.2 Ensure that the audit policy covers key security concerns (Not Scored)

# Worker Nodes

## Worker Node Configuration Files

<span style="color:blue">[INFO]</span> 4 Worker Node Security Configuration

<span style="color:blue">[INFO]</span> 4.1 Worker Node Configuration Files

<span style="color:green">[PASS]</span> 4.1.1 Ensure that the kubelet service file permissions are set to 644 or more restrictive (Scored)

<span style="color:green">[PASS]</span> 4.1.2 Ensure that the kubelet service file ownership is set to root:root (Scored)

<span style="color:red">[FAIL]</span> 4.1.3 Ensure that the proxy kubeconfig file permissions are set to 644 or more restrictive (Scored)

<span style="color:red">[FAIL]</span> 4.1.4 Ensure that the proxy kubeconfig file ownership is set to root:root (Scored)

<span style="color:green">[PASS]</span> 4.1.5 Ensure that the kubelet.conf file permissions are set to 644 or more restrictive (Scored)

<span style="color:green">[PASS]</span> 4.1.6 Ensure that the kubelet.conf file ownership is set to root:root (Scored)

<span style="color:yellow">[WARN]</span> 4.1.7 Ensure that the certificate authorities file permissions are set to 644 or more restrictive (Scored)

<span style="color:green">[PASS]</span> 4.1.8 Ensure that the client certificate authorities file ownership is set to root:root (Scored)

<span style="color:green">[PASS]</span> 4.1.9 Ensure that the kubelet configuration file has permissions set to 644 or more restrictive (Scored)

<span style="color:green">[PASS]</span> 4.1.10 Ensure that the kubelet configuration file ownership is set to root:root (Scored)

## Kubelet

<span style="color:blue">[INFO]</span> 4.2 Kubelet

<span style="color:green">[PASS]</span> 4.2.1 Ensure that the --anonymous-auth argument is set to false (Scored)

<span style="color:green">[PASS]</span> 4.2.2 Ensure that the --authorization-mode argument is not set to AlwaysAllow (Scored)

<span style="color:green">[PASS]</span> 4.2.3 Ensure that the --client-ca-file argument is set as appropriate (Scored)

<span style="color:red">[FAIL]</span> 4.2.4 Ensure that the --read-only-port argument is set to 0 (Scored)

<span style="color:green">[PASS]</span> 4.2.5 Ensure that the --streaming-connection-idle-timeout argument is not set to 0 (Scored)

<span style="color:red">[FAIL]</span> 4.2.6 Ensure that the --protect-kernel-defaults argument is set to true (Scored)

<span style="color:green">[PASS]</span> 4.2.7 Ensure that the --make-iptables-util-chains argument is set to true (Scored)

<span style="color:green">[PASS]</span> 4.2.8 Ensure that the --hostname-override argument is not set (Not Scored)

<span style="color:yellow">[WARN]</span> 4.2.9 Ensure that the --event-qps argument is set to 0 or a level which ensures appropriate event capture (Not Scored)

<span style="color:red">[FAIL]</span> 4.2.10 Ensure that the --tls-cert-file and --tls-private-key-file arguments are set as appropriate (Scored)

<span style="color:green">[PASS]</span> 4.2.11 Ensure that the --rotate-certificates argument is not set to false (Scored)

<span style="color:red">[FAIL]</span> 4.2.12 Ensure that the RotateKubeletServerCertificate argument is set to true (Scored)

<span style="color:yellow">[WARN]</span> 4.2.13 Ensure that the Kubelet only makes use of Strong Cryptographic Ciphers (Not Scored)

# Policies

## RBAC and Service Accounts

<span style="color:blue">[INFO]</span> 5 Kubernetes Policies

<span style="color:blue">[INFO]</span> 5.1 RBAC and Service Accounts

<span style="color:yellow">[WARN]</span> 5.1.1 Ensure that the cluster-admin role is only used where required (Not Scored)

<span style="color:yellow">[WARN]</span> 5.1.2 Minimize access to secrets (Not Scored)

<span style="color:yellow">[WARN]</span> 5.1.3 Minimize wildcard use in Roles and ClusterRoles (Not Scored)

<span style="color:yellow">[WARN]</span> 5.1.4 Minimize access to create pods (Not Scored)

<span style="color:yellow">[WARN]</span> 5.1.5 Ensure that default service accounts are not actively used. (Scored)

<span style="color:yellow">[WARN]</span> 5.1.6 Ensure that Service Account Tokens are only mounted where necessary (Not Scored)

## Pod Security Policies

<span style="color:blue">[INFO]</span> 5.2 Pod Security Policies

<span style="color:yellow">[WARN]</span> 5.2.1 Minimize the admission of privileged containers (Not Scored)

<span style="color:yellow">[WARN]</span> 5.2.2 Minimize the admission of containers wishing to share the host process ID namespace (Scored)

<span style="color:yellow">[WARN]</span> 5.2.3 Minimize the admission of containers wishing to share the host IPC namespace (Scored)

<span style="color:yellow">[WARN]</span> 5.2.4 Minimize the admission of containers wishing to share the host network namespace (Scored)

<span style="color:yellow">[WARN]</span> 5.2.5 Minimize the admission of containers with allowPrivilegeEscalation (Scored)

<span style="color:yellow">[WARN]</span> 5.2.6 Minimize the admission of root containers (Not Scored)

<span style="color:yellow">[WARN]</span> 5.2.7 Minimize the admission of containers with the NET_RAW capability (Not Scored)

<span style="color:yellow">[WARN]</span> 5.2.8 Minimize the admission of containers with added capabilities (Not Scored)

<span style="color:yellow">[WARN]</span> 5.2.9 Minimize the admission of containers with capabilities assigned (Not Scored)

## Network Policies and CNI

<span style="color:blue">[INFO]</span> 5.3 Network Policies and CNI

<span style="color:yellow">[WARN]</span> 5.3.1 Ensure that the CNI in use supports Network Policies (Not Scored)

<span style="color:yellow">[WARN]</span> 5.3.2 Ensure that all Namespaces have Network Policies defined (Scored)

## Secrets Management

<span style="color:blue">[INFO]</span> 5.4 Secrets Management

<span style="color:yellow">[WARN]</span> 5.4.1 Prefer using secrets as files over secrets as environment variables (Not Scored)

<span style="color:yellow">[WARN]</span> 5.4.2 Consider external secret storage (Not Scored)

## Extensible Admission Control

<span style="color:blue">[INFO]</span> 5.5 Extensible Admission Control

<span style="color:yellow">[WARN]</span> 5.5.1 Configure Image Provenance using ImagePolicyWebhook admission controller (Not Scored)

## General Policies

<span style="color:blue">[INFO]</span> 5.6 General Policies

<span style="color:yellow">[WARN]</span> 5.6.1 Create administrative boundaries between resources using namespaces (Not Scored)

<span style="color:yellow">[WARN]</span> 5.6.2 Ensure that the seccomp profile is set to docker/default in your pod definitions (Not Scored)

<span style="color:yellow">[WARN]</span> 5.6.3 Apply Security Context to Your Pods and Containers (Not Scored)

<span style="color:yellow">[WARN]</span> 5.6.4 The default namespace should not be used (Scored)
