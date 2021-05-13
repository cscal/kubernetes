kubeadm init --pod-network-cidr=10.244.0.0/16
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml
kubectl create -f class.yml
kubectl create -f persistentvolume.yml
kubectl create -f claim.yml
kubectl apply -f https://raw.githubusercontent.com/ansible/awx-operator/0.9.0/deploy/awx-operator.yaml
kubectl create -f my-awx.yml
