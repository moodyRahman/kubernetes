helm install postgresql oci://registry-1.docker.io/bitnamicharts/postgresql \
  --namespace data \
  --set global.storageClass=nfs-client \