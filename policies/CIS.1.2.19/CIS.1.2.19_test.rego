package cis_1_2_19

import data.lib.test

test_violation {
    test.violations(violation) with input as policy_input("kube-apiserver", "--insecure-port=20")
}

test_no_violation {
    test.no_violations(violation) with input as policy_input("kube-apiserver", "--insecure-port=0")
}

test_no_violation_02 {
    test.no_violations(violation) with input as policy_input("kube-proxy", "--insecure-port=20")
}

policy_input(component, kv) = {
  "apiVersion": "v1",
  "kind": "Pod",
  "metadata": {
    "name": "kube-apiserver",
    "namespace": "kube-system",
    "labels": {
      "component": component,
      "tier": "control-plane"
    }
  },
  "spec": {
    "containers": [
      {
        "command": [
          "kube-apiserver",
          kv
        ],
        "image": "k8s.gcr.io/kube-apiserver:v1.18.3",
        "imagePullPolicy": "IfNotPresent",
        "name": "kube-apiserver"
      }
    ]
  }
}
