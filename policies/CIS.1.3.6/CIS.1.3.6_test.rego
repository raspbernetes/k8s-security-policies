package cis_1_3_6

import data.lib.test

test_violation {
    test.violations(violation) with input as policy_input("kube-controller-manager", "--feature-gates=RotateKubeletServerCertificate=false")
}

test_violation_02 {
    test.violations(violation) with input as policy_input("kube-controller-manager", "--feature-gates=RotateKubeletServerCertificate")
}

test_violation_03{
    test.violations(violation) with input as policy_input("kube-controller-manager", "")
}


test_no_violation {
    test.no_violations(violation) with input as policy_input("kube-controller-manager", "--feature-gates=RotateKubeletServerCertificate=true")
}

test_no_violation_02 {
    test.no_violations(violation) with input as policy_input("kube-proxy", "--enable-admission-plugins=NodeRestriction")
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
