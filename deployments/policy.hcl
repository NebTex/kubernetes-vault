path "auth/approle/role/*" {
  capabilities = ["update"]
}

path "auth/token/roles/kubernetes-vault" {
  capabilities = ["read"]
}