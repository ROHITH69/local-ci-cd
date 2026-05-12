package main

deny[msg] {
    input.kind == "Deployment"
    not input.spec.template.spec.containers[_].resources.limits
    msg := "Resource limits are required"
}

deny[msg] {
    input.kind == "Deployment"
    input.spec.template.spec.containers[_].securityContext.privileged == true
    msg := "Privileged containers are not allowed"
}