package cis_1_2_9

import data.lib.test


test_violation {
    test.violations(violation) with input as policy_input("kube-apiserver", "--authorization-mode=AlwaysAllow")
}

test_no_violation {
    test.no_violations(violation) with input as policy_input("kube-apiserver", "--authorization-mode=RBAC,Node")
}

test_no_violatio_02 {
    test.no_violations(violation) with input as policy_input("kube-apiserver", "--authorization-mode=RBAC")
}

test_no_violation_03 {
    test.no_violations(violation) with input as policy_input("kube-proxy", "--authorization-mode=AlwaysAllow")
}

policy_input(component, kv) = {
  "apiVersion": "v1",
  "kind": "Pod",
  "metadata": {
    "labels": {
      "component": component,
      "tier": "control-plane"
    }
  },
  "spec": {
    "containers": [
      {
        "command": [kv],
        "image": "k8s.gcr.io/kube-apiserver:v1.18.3",
        "imagePullPolicy": "IfNotPresent",
        "name": "kube-apiserver"
      }
    ]
  }
}
