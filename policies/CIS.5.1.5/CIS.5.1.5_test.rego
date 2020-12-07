package cis_5_1_5

import data.lib.test

test_violation {
    test.violations(violation) with input as policy_input("Pod", false, "default")
}

test_violation_2 {
    test.violations(violation) with input as policy_input("ServiceAccount", true, "default")
}

test_no_violation {
    test.no_violations(violation) with input as policy_input("Pod", false, "example-service-account")
}

test_no_violation_2 {
    test.no_violations(violation) with input as policy_input("ServiceAccount", false, "default")
}

test_violation_3 {
    test.no_violations(violation) with input as policy_input("Pod", true, "example-service-account")
}

policy_input(kind, automountSetting, name) = {
    "apiVersion": "v1",
    "kind": kind,
    "automountServiceAccountToken": automountSetting,
    "metadata": {
        "name": name
    },
    "spec": {
        "serviceAccount": name,
        "automountServiceAccountToken": automountSetting
    }
}
