package main

deny[msg] {
    input.kind == "Deployment"
    container := input.spec.template.spec.containers[_]
    not container.resources.limits
    msg := "Resource limits are required"
}

deny[msg] {
    input.kind == "Deployment"
    container := input.spec.template.spec.containers[_]
    container.securityContext.privileged == true
    msg := "Privileged containers are not allowed"
}

deny[msg] {
    input.kind == "Deployment"
    container := input.spec.template.spec.containers[_]
    endswith(container.image, ":latest")
    msg := "Latest image tag is not allowed"
}

deny[msg] {
    input.kind == "Deployment"
    not input.metadata.labels
    msg := "Mandatory labels are required"
}

deny[msg] {
    input.kind == "Deployment"
    container := input.spec.template.spec.containers[_]
    not startswith(container.image, "localhost:5001/")
    msg := "Image must use approved local registry"
}