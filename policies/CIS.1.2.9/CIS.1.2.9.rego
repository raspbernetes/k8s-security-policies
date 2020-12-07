package cis_1_2_9

import data.lib.kubernetes

default_parameters = {
    "key": "--authorization-mode",
    "includeValue": "RBAC"
}

params = object.union(default_parameters, kubernetes.parameters)

violation[msg] {
    kubernetes.apiserver[container]
    not kubernetes.flag_contains_string(container.command, params.key, params.includeValue)
    msg = kubernetes.format(sprintf("%s in the %s %s should have %s %s", [container.name, kubernetes.kind, kubernetes.name, params.key, params.includeValue]))
}
