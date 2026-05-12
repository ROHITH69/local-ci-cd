package main

deny[msg] {
    input.kind == "Deployment"
    not input.spec.template.spec.containers[0].resources.limits.memory
    msg := "Memory limit is required"
}