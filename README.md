<div align="center">

  # Kubernetes Security Policies

  A Comprehensive Library for Fortifying Cluster Configurations.

</div>

## Introduction

This repository offers a comprehensive library of security policies designed to fortify Kubernetes cluster configurations. These security policies are derived from the [CIS Kubernetes benchmark]((https://cloud.google.com/kubernetes-engine/docs/concepts/cis-benchmarks)) and rules specified by [Kubesec.io](https://kubesec.io/). The policies are crafted in REGO, a high-level declarative language tailored for defining policies over intricate hierarchical data structures. For an in-depth understanding of REGO, refer to the [Policy Language](https://www.openpolicyagent.org/docs/latest/policy-language/) documentation.

## Why use Kubernetes Security Policies?

Kubernetes Security Policies are crucial for:

1. **Enhancing Security**: They protect clusters against threats, misconfigurations, and vulnerabilities by applying predefined rules and best practices.

2. **Ensuring Consistency**: Policies enforce standardized configurations across clusters, simplifying management and reducing configuration drift.

3. **Maintaining Compliance**: By implementing established benchmarks like CIS Kubernetes, policies help adhere to industry-specific regulatory requirements.

4. **Automating Enforcement**: Policies automate the enforcement of security best practices, reducing human error and streamlining deployments.

5. **Simplifying Auditing**: They provide a clear approach to defining and enforcing configurations, enabling easier auditing and monitoring of clusters.

Kubernetes Security Policies are essential for a robust security strategy and promoting a proactive security culture within organizations.

## Repository Structure

The `policies` directory houses numerous folders, each representing a distinct policy. Folders are named according to the benchmark standard, followed by a number to ensure differentiation. For instance, the `1.2.1 Ensure that the --anonymous-auth argument is set to false` policy from the CIS benchmark is verified by REGO files located in the `CIS1.2.1` directory. To explore each policy further, consult the [Policy Inventory](policies/POLICIES.md).

Within each folder, you will find a `.rego` file and a unit test `.rego` file. Additionally, there is a separate `lib` folder containing two .rego files that feature general functions importable into other `.rego` files. The `kubernetes.rego` file encompasses functions and rules employed in security control `.rego` files, while the `test.rego` file houses functions that can be imported into unit test files.

## Policy Implementation Process

### Identifying Violations

Each REGO policy examines the manifests of resources deployable in a Kubernetes cluster. The `violation` block in each policy file typically includes:

* Identifying the resource object being examined and returning it.
* Verifying if the object breaches the controls defined in the benchmark.
* Displaying an error message if a violation is detected.

Here's a simplified example of a violation:

```rego
violation[msg] {
    kubernetes.pods[pod]
    not kubernetes.contains_element(params.allowedDeploymentsOrPods, kubernetes.name)
    is_automount_serviceaccount_token_enabled(pod)
    msg := kubernetes.format(sprintf("%v: %v - Automount Service account token must be set to false", [kubernetes.kind, kubernetes.name]))
}
```

The `kubernetes.` prefix indicates a function call from `kubernetes.rego`, which contains general functions. Control-specific logic is written in the corresponding REGO file.

### Configuring Parameters

Security policies use parameters to evaluate resources. These parameters can be external (e.g., defined in Gatekeeper `constraints`) or embedded as default values within the file. Parameters are standardized by combining them:

```rego
params = object.union(default_parameters, kubernetes.parameters)
```

### Testing Policies

To validate policy accuracy, the `OPA` testing [framework](https://www.openpolicyagent.org/docs/v0.12.2/how-do-i-test-policies/) is used. Each unit test includes functions prefixed with `test` in the name, enabling `opa test` to recognize them. Positive cases start with `test_no_violation` and negative cases with `test_violation`. Tests use `policy_input` formatted like the manifests:

```rego
test_violation {
    test.violations(violation) with input as policy_input(true)
}

test_no_violation {
    test.no_violations(violation) with input as policy_input(false)
}
```

Unit test files share the same package as the REGO policy, ensuring the test verifies policy input against the violation block within the same package.

The `opa test` output displays whether all tests passed:

```rego
$ opa test policies -v
data.spec_volumes_hostpath_path_var_run_docker_sock.test_no_violation: PASS (318.786µs)
data.containers_image_tag.test_violation_1: PASS (512.689µs)
data.containers_image_tag.test_violation_2: PASS (515.964µs)
data.containers_image_tag.test_no_violation: PASS (389.822µs)
data.containers_securitycontext_allowprivilegedeescalation_true.test_violation: PASS (474.668µs)
data.containers_securitycontext_allowprivilegedeescalation_true.test_no_violation: PASS (361.12µs)
--------------------------------------------------------------------------------
PASS: 5/5
```

## Integration with Policy Enforcement Tools

This policy library is designed to be compatible with various tools, such as Conftest and Gatekeeper.

### Gatekeeper

Rego policies can serve as a schema in Gatekeeper `ConstraintTemplate`. Based on the template, `constraints` can be deployed onto Kubernetes clusters to monitor `CREATE` and `UPDATE` operations against the API server. Gatekeeper also offers `AUDIT` functionality to evaluate existing resources against the `constraints`. To learn more about creating `constraints`, visit the [Gatekeeper](https://github.com/open-policy-agent/gatekeeper) repository.


### Conftest

Conftest enables the evaluation of structured YAML manifest files intended for deployment to your clusters. To use Conftest, first install [Conftest](https://github.com/open-policy-agent/conftest) and then run `conftest test` on a YAML file against the policy library:


```shell
$ conftest test deployment.yaml -p policies/. --all-namespaces
```

The output indicates whether the tests have passed. Here's an example:

```log
FAIL - deployment.yaml - Containers must not run as root
FAIL - deployment.yaml - Deployments are not allowed

2 tests, 0 passed, 0 warnings, 2 failure
```
