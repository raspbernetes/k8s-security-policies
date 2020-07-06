package cis_5_1_6

import data.lib.kubernetes

default_parameters = {
    "allowedDeploymentsOrPods": [
    ],
    "allowedServiceAccounts": [
    ]
}

params = object.union(default_parameters, kubernetes.parameters)

violation[msg] {
    kubernetes.pods[pod]
    not kubernetes.contains_element(params.allowedDeploymentsOrPods, kubernetes.name)
    is_automount_serviceaccount_token_enabled(pod)
    msg := kubernetes.format(sprintf("%v: %v - Automount Service account token must be set to false", [kubernetes.kind, kubernetes.name]))
}

violation[msg] {
    kubernetes.serviceaccounts[serviceaccount]
    not kubernetes.contains_element(params.allowedServiceAccounts, kubernetes.name)
    is_automount_serviceaccount_token_enabled(serviceaccount)
    msg := kubernetes.format(sprintf("%v: %v - Automount Service account token must be set to false", [kubernetes.kind, kubernetes.name]))
}

is_automount_serviceaccount_token_enabled(pod) {
    pod.spec.automountServiceAccountToken == true
}

is_automount_serviceaccount_token_enabled(serviceaccount) {
    serviceaccount.automountServiceAccountToken == true
}
