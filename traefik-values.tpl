ingressClass:
   enabled: true
   isDefaultClass: true

service:
  annotations:
    service.beta.kubernetes.io/azure-load-balancer-resource-group: ${rg_name}
  spec:
    loadBalancerIP: ${lb_ip}

