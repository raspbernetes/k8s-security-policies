package cis_1_2_6

import data.lib.kubernetes

default_parameters = {
    "key": "--kubelet-certificate-authority"
}

params = object.union(default_parameters, kubernetes.parameters)

violation[msg] {
    kubernetes.apiserver[container]
    not kubernetes.contains_element(container.command, params.key)
    msg = kubernetes.format(sprintf("%s in the %s %s should have %s", [container.name, kubernetes.kind, kubernetes.name, params.key]))
}