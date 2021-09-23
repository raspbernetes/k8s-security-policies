package cis_1_3_1

import data.lib.kubernetes

default_parameters = {
    "key": "--terminated-pod-gc-threshold",
    "requiredValue": "1000" #This value could be changed based on system resources to activate garbage collection
}

params = object.union(default_parameters, kubernetes.parameters)

violation[msg] {
    kubernetes.controller[container]
    not kubernetes.flag_contains_string(container.command, params.key, params.requiredValue)
    msg = kubernetes.format(sprintf("%s in the %s %s should set %s to %s", [container.name, kubernetes.kind, kubernetes.name, params.key, params.requiredValue]))
}
