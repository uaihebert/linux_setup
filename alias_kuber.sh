alias kdes='kubectl describe pod -n "$KUBERNET_DEFAULT_NAMESPACE"'
alias kget='kubectl get pods -n "$KUBERNET_DEFAULT_NAMESPACE"'
alias ksh='kubectl exec sh -ti -n "$KUBERNET_DEFAULT_NAMESPACE"'
alias ksh='_ksh(){kubectl exec -ti "$1" -n "$KUBERNET_DEFAULT_NAMESPACE" sh}; _ksh'
alias kalog='_kalog(){kubectl logs -l app="$1" --tail=100 -n "$KUBERNET_DEFAULT_NAMESPACE"}; _kalog'
alias kcc='kubectl config current-context'
alias kcs='kubectl config use-context '
alias kon='kubectl get nodes -n "$KUBERNET_DEFAULT_NAMESPACE"'
alias klog='_klog(){kubectl logs -f "$1" -n "$KUBERNET_DEFAULT_NAMESPACE"};_klog'
