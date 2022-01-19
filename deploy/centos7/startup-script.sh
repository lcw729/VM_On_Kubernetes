#cloud-config

#package_upgrade: true

#packages:
#  - git
#  - xrdp
#  -

runcmd:
 - [ sh, -c, "yum groupinstall -y 'GNOME Desktop' 'Graphical Administration Tools'" ]
 - [ sh, -c, "ln -sf /lib/systemd/system/runlevel5.target /etc/systemd/system/default.target" ]
 - [ sh, -c, "rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm" ]
 - [ sh, -c, "yum -y install xrdp tigervnc-server" ]
 - [ sh, -c, "systemctl start xrdp" ]
 - [ sh, -c, "systemctl enable xrdp" ]
 - [ sh, -c, "systemctl enable firewalld" ]
 - [ sh, -c, "systemctl start firewalld" ]
 - [ sh, -c, "firewall-cmd --permanent --add-port=3389/tcp" ]
 - [ sh, -c, "firewall-cmd --reload" ]
 - [ sh, -c, "sudo reboot" ]
 - [ sh, -c, "cd /usr/local/src"]
 - [ sh, -c, "wget https://go.dev/dl/go1.17.5.linux-amd64.tar.gz"]
 - [ sh, -c, "tar -C /usr/local -xzvf go1.17.5.linux-amd64.tar.gz"]
 - [ sh, -c, "sudo mv go /usr/local"]
 - [ sh, -c, "mkdir $HOME/go"]
 - [ sh, -c, "export GOROOT=/usr/local/go"]
 - [ sh, -c, "export GOPATH=$HOME/go"]
 - [ sh, -c, "GOBIN=$GOPATH/bin"]
 - [ sh, -c, "export PATH=$GOROOT/bin:$GOBIN:$PATH"]
 - [ sh, -c, "source ~/.profile"]
 - [ sh, -c, "cp /usr/local/go/bin/go /usr/bin/go"]
 - [ sh, -c, "go version"]


users:
  - name: centos
    gecos: centos
    password: password
    lock-passwd: false
    sudo: ALL=(ALL) NOPASSWD:ALL
    ssh_authorized_keys:
      - ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCyPAkKHyZv7gh/xSHwPhmJuQmMPbbu355Q2MOW0wkbjP6wfL2939VgsEk5CCy3/sKci+/VZHSwPgoB0EKBjYff4X4mdqECI++n6iBERHOvQctpCo8YPXgcyATooRTMHys2l3XhUBE55LOhEjEevXbc3vslErwNQBD+DH17DdHs3C2AS27QIysA8XB1OT2Hij1WplipKEBKYCT/b85CYsH/432qsDg5HREAyH1Cvyr85YjArprFCdEUjWQ7oU0A1MRwmFsvQlr6q7+WUjUSyml6UVblTbk8j7RyH24cUYYOmEXyBOtZfuFbGF/bX86qtoYctsRWYiLI9DP2Ze9Gy/71 root@unikernel-master
