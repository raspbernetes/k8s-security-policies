package cis_1_2_5

import data.lib.kubernetes

default_parameters = {
    "key": "--kubelet-client-certificate",
    "key2": "--kubelet-client-key"
}

params = object.union(default_parameters, kubernetes.parameters)

violation[msg] {
    kubernetes.apiserver[container]
    is_argument_not_set(container)
    msg = kubernetes.format(sprintf("%s in the %s %s should have %s and %s", [container.name, kubernetes.kind, kubernetes.name, params.key, params.key2]))
}

is_argument_not_set(container) {
    not kubernetes.contains_element(container.command, params.key)
}

is_argument_not_set(container) {
    not kubernetes.contains_element(container.command, params.key2)
}