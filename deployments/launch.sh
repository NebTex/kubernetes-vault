#!/usr/bin/env bash

if kubectl get secrets --namespace vault | grep -q "kubernetes-vault"; then
    echo "kubernetes-vault secrets already exists"
else
    sigil -p -f kube-vault-secrets.yml secret_token="$(printf ${vault_token}| base64 -w 0)" |  kubectl  apply --validate --overwrite -f -
fi

kubectl apply -f kubernetes-vault-service.yml --validate --overwrite
kubectl apply -f kubernetes-vault.yml --validate --overwrite
