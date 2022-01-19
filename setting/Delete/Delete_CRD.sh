kubectl patch crd $1 -p '{"metadata":{"finalizers":null}}' --type=merge
