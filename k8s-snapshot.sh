NAME=fibos-node-1
PRODUCER_ENABLE=false
PRODUCER_NAME=fibos123comm
PUBLIC_KEY=
PRIVATE_KEY=
PRODUCER_API_ENABLE=false
SNAPSHOT_ENABLE=true
SNAPSHOT_URL=https://github.com/andy-backup/fibos/raw/master/snapshot.bin

# install k3s (Lightweight Kubernetes)
curl -sfL https://get.k3s.io | sh -
# install helm
curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash
# setup helm
mkdir ~/.kube
sudo kubectl config view --raw >~/.kube/config
# add helm repo
helm repo add mingfunwong https://mingfunwong.github.io/helm-charts
# install fibos-node
helm install $NAME mingfunwong/fibos-node \
  --set PRODUCER_ENABLE=$PRODUCER_ENABLE\
  --set PRODUCER_NAME=$PRODUCER_NAME\
  --set PUBLIC_KEY=$PUBLIC_KEY\
  --set PRIVATE_KEY=$PRIVATE_KEY\
  --set PRODUCER_API_ENABLE=$PRODUCER_API_ENABLE\
  --set SNAPSHOT_ENABLE=$SNAPSHOT_ENABLE\
  --set SNAPSHOT_URL=$SNAPSHOT_URL 
