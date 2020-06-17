package cis_1_2_5

import data.lib.test


test_violation {
    test.violations(violation) with input as policy_input("kube-apiserver", "","--kubelet-client-key=apiserver-kubelet-client.key")
}

test_violation_02 {
    test.violations(violation) with input as policy_input("kube-apiserver", "--kubelet-client-certificate=apiserver-kubelet-client.crt","")
}

test_violation_03 {
    test.violations(violation) with input as policy_input("kube-apiserver","","")
}

test_no_violation {
    test.no_violations(violation) with input as policy_input("kube-apiserver", "--kubelet-client-certificate=apiserver-kubelet-client.crt","--kubelet-client-key=apiserver-kubelet-client.key")
}

test_no_violation_02 {
    test.no_violations(violation) with input as policy_input("kube-proxy", "","")
}

policy_input(component, kv, kv2) = {
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
        "command": [kv,kv2],
        "image": "k8s.gcr.io/kube-apiserver:v1.18.3",
        "imagePullPolicy": "IfNotPresent",
        "name": "kube-apiserver"
      }
    ]
  }
}
