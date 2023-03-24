icurl(){
  sudo apt update && sudo apt install vim curl git make -y
}

idocker(){
    sudo apt-get update
    sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

    sudo mkdir -p /etc/apt/keyrings
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

    echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

    sudo apt-get update
		sudo apt-get install docker-ce docker-ce-cli containerd.io -y
    sudo docker run hello-world
		sudo gpasswd -a $USER docker
}

BINARY="go1.19.5.linux-amd64.tar.gz"
igo(){
    curl -OL "https://go.dev/dl/$BINARY"
    sudo rm -rf /usr/local/go
    sudo tar -C /usr/local -xzf go1.19.5.linux-amd64.tar.gz
    rm $BINARY
    mkdir -p $HOME/go/bin
    echo "export PATH=\$PATH:\$HOME/go/bin" >> $HOME/.bashrc
    echo "export PATH=\$PATH:/usr/local/go/bin" >> $HOME/.bashrc
    . $HOME/.bashrc
    /usr/local/go/bin/go version
    echo " "
    echo "source ~/.bashrc"
}

ikind(){
  go install sigs.k8s.io/kind@v0.17.0
}

ikubectl(){
  curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
  curl -LO "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
  echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check
  sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
  kubectl version --client
}

next(){
  echo "check below"
  echo "$ kind version"
  echo "$ kubectl version"
  echo "$ kind create cluster (wait a while)"
  echo "$ kubectl get all (should show result)"
  echo "then see Makefile to use command"
}

icurl
idocker
igo
ikind
ikubectl
next
# curl
# docker
# go
# kind
# kubectl