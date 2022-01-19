kubectl create namespace kubevirt

kubectl create configmap -n kubevirt kubevirt-config --from-literal debug.useEmulation=true --from-literal feature-gates="LiveMigration"
