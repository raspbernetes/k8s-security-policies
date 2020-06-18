package cis_1_2_6

import data.lib.test


test_violation {
    test.violations(violation) with input as policy_input("kube-apiserver","")
}

test_no_violation {
    test.no_violations(violation) with input as policy_input("kube-apiserver", "--kubelet-certificate-authority=apiserver-kubelet-client.crt")
}

test_no_violation_02 {
    test.no_violations(violation) with input as policy_input("kube-proxy", "")
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
