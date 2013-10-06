Salted Vagrant Docker
=====================

This will automatically install [Docker](http://docker.io) using [Salt](http://saltstack.com/).
Docker will be automatically configured to accecept connections from anywhere which means
you can alias ``docker`` on OSX to talk directly with ``docker`` on the ``Vagrant`` virtual machine.

Dependencies
------------

For this to work you need the following installed.

* VirtualBox
* Vagrant 1.1+
* Vagrant ``vagrant-vbguest`` plugin: ``vagrant plugin install vagrant-vbguest``
* Vagrant ``vagrant-salt`` plugin: ``vagrant plugin install vagrant-salt``

Usage
-----

Clone the repo and ``vagrant up``

OSX Docker Alias
----------------

We have to install docker on OSX, obviously it won't work as docker does not yet support OSX, however we
still need the docker binary so we can connect to docker running on ``Vagrant``.

1. Install Go Using [HomeBrew](http://brew.sh/)

```
brew update
brew install go
```

2. Install Docker on OSX

Follow these steps to install ``docker`` binary on OSX.

* ``cd ~``
* ``mkdir tmp``
* ``export GOPATH=`pwd`/tmp``
* ``mkdir -p $GOPATH/src/github.com/dotcloud``
* ``cd $GOPATH/src/github.com/dotcloud``
* ``git clone https://github.com/dotcloud/docker.git``
* ``cd $GOPATH/src/github.com/dotcloud/docker``
* ``git checkout v0.6.3``
* ``go get -v github.com/dotcloud/docker/...``
* ``sudo cp $GOPATH/bin/docker /usr/local/bin``
* ``cd ~ && rm -rf tmp``

Now run ``docker version`` and you should see the following:

```
$ docker version
Go version (client): go1.1.2
2013/10/06 15:42:01 dial unix /var/run/docker.sock: no such file or directory
```

Seeing as we don't have docker running on OSX this is totally expected,

3. Alias Docker on OSX

All we need to do now is just create an alias on OSX, add this to your ``~/.bashrc``
or ``~/.zshrc`` etc.

```
alias docker='docker -H tcp://127.0.1:4243/'
```

Reload your shell and run ``docker version`` you should see the following output:

```
$ docker version
Go version (client): go1.1.2
Server version: 0.6.3
Git commit (server): b0a49a3
Go version (server): go1.1.2
Last stable version: 0.6.3
```

Now give ``docker run -i -t ubuntu /bin/bash`` a try ;)
