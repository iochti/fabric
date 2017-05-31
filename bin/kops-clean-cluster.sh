export KOPS_STATE_STORE="s3://k844-net-state-store"
export NAME="iochticluster.k844.net"

kops delete cluster --name $NAME --state $KOPS_STATE_STORE --yes
