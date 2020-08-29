# Security Policies
[![FOSSA Status](https://app.fossa.com/api/projects/git%2Bgithub.com%2Fraspbernetes%2Fk8s-security-policies.svg?type=shield)](https://app.fossa.com/projects/git%2Bgithub.com%2Fraspbernetes%2Fk8s-security-policies?ref=badge_shield)

## Introduction
This repository provides a security policies library that is used for securing Kubernetes clusters configurations. The security controls is created based on [CIS Kubernetes benchmark](https://cloud.google.com/kubernetes-engine/docs/concepts/cis-benchmarks) ,and rules defined in [Kubesce.io](https://kubesec.io/). 
The security controls are written in Rego, a high-level declarative language, its purpose-built for expressing policies over complex hierarchical data structures. For detailed information on Rego see the [Policy Language](https://www.openpolicyagent.org/docs/latest/policy-language/) documentation.  

## Structure of the repo
The policies directory contains a list of folders, which corresponds to the list of policies. The folder is named with the benchmark standard and a number to differentiate with each other. For example, the 1.2.1 Ensure that the --anonymous-auth argument is set to false that in CIS benchmark is checked by the REGO files in directory CIS1.2.1. Check more on each policy in [Policy Inventory](policies/POLICIES.md)

Each of these folders contains a rego file and unit test rego file. There is another `lib` folder which has two rego files that contain general functions that can be imported into other rego. `kubernetes.rego` contains functions and rules that will be used in security control rego files, `test.rego` contains functions that can be imported in the unit test files.

## How does this work ?

### Violations
Each of the rego policies checks against the manifests of resources that can be deployed in the K8s cluster, the `violation` block in each policy rego files will normally contain these statements that will do:
- Check what resource object the policy is checking against and return the object
- Check if the object violates that controls defined in the benchmark
- Display the error message if there is a violation
Here is a quick example of a violation:
```
violation[msg] {
    kubernetes.pods[pod]
    not kubernetes.contains_element(params.allowedDeploymentsOrPods, kubernetes.name)
    is_automount_serviceaccount_token_enabled(pod)
    msg := kubernetes.format(sprintf("%v: %v - Automount Service account token must be set to false", [kubernetes.kind, kubernetes.name]))
}
```
The `kubernetes.` indicates it is calling a function from `kubernetes.rego`, which put general functions. The logic that specific to this control will be written in the same rego files.

### Parameters
For each of the security policies, there will be parameters going to be used for checking against the resources. The parameters can be from external, for example, if these policies are going to be checked in gatekeeper engine, the parameters can be defined in the gatekeeper `constraints`, or we can directly have default parameters in the file itself, for standardizing the parameters, that we will union these parameters 
```
params = object.union(default_parameters, kubernetes.parameters)

```
### Unit tests 
To verify the correctness of the policies, we use `OPA` testing [framework](https://www.openpolicyagent.org/docs/v0.12.2/how-do-i-test-policies/) to write the unit tests.
Each unit tests will have test functions that need to start with the `test` in the function name, so they can be picked by the `op test` the positive case start with the name of `test_no_violation` and negative starts with `test_violation` and tests with a policy_input that will be in the same structure of the manifests. 
```
test_violation {
    test.violations(violation) with input as policy_input(true)
}

test_no_violation {
    test.no_violations(violation) with input as policy_input(false)
}
```
The unit tests files need to have the same package as the rego policy itself. e.g.
`package cis_5_2_5` will the package name for `CIS.5.2.5.rego` and `CIS.5.2.5_test.rego`, so that the unit test will check the policy input against that violation block under the same package.

The `opa test` output indicates that all of the tests passed or not.
```
$opa test policies -v
data.spec_volumes_hostpath_path_var_run_docker_sock.test_no_violation: PASS (318.786µs)
data.containers_image_tag.test_violation_1: PASS (512.689µs)
data.containers_image_tag.test_violation_2: PASS (515.964µs)
data.containers_image_tag.test_no_violation: PASS (389.822µs)
data.containers_securitycontext_allowprivilegedeescalation_true.test_violation: PASS (474.668µs)
data.containers_securitycontext_allowprivilegedeescalation_true.test_no_violation: PASS (361.12µs)
--------------------------------------------------------------------------------
PASS: 5/5
```

## How this can be used?
The policy library is written in a standard way that can be used by various tools, such as Conftest and Gatekeeper.
### Gatekeeper
The rego policies can be used as a schema in the gatekeeper `ConstraintTemplate` and `constraints` can be deployed based on the template onto the Kubernetes clusters for checking the `CREATE` and `UPDATE` operations against API server, and gatekeeper also provides `AUDIT` functions for checking the existing resources against the `constraints`. Check [Gatekeeper](https://github.com/open-policy-agent/gatekeeper) to understand more how the `constraints` can be created.

### Conftest
Using conftest to check the structured yaml manifests files that will be deployed to your clusters.
Make srue you have installed `Conftest`([Conftest](https://github.com/open-policy-agent/conftest)) and run `conftest test` a yaml file agaist the policy library
```
conftest test deployment.yaml -p policies/. --all-namespaces  
```
and the output will indicate if tests passed. An example:
```
FAIL - deployment.yaml - Containers must not run as root
FAIL - deployment.yaml - Deployments are not allowed

2 tests, 0 passed, 0 warnings, 2 failure
```


## License
[![FOSSA Status](https://app.fossa.com/api/projects/git%2Bgithub.com%2Fraspbernetes%2Fk8s-security-policies.svg?type=large)](https://app.fossa.com/projects/git%2Bgithub.com%2Fraspbernetes%2Fk8s-security-policies?ref=badge_large)