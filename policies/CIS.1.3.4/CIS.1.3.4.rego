package cis_1_3_4

import data.lib.kubernetes

default_parameters = {
    "key": "--service-account-private-key-file" # The value for this key must be set,by default is not set
}

params = object.union(default_parameters, kubernetes.parameters)

violation[msg] {
    kubernetes.controller[container]
    not kubernetes.contains_element(container.command, params.key)
    msg = kubernetes.format(sprintf("%s in the %s %s must set %s", [container.name, kubernetes.kind, kubernetes.name, params.key]))
}
