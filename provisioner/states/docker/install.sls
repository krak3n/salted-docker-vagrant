#
# docker.install
#
# Installs Docker
#

.docker_repo:
  pkgrepo:
    - managed
    - name: 'deb http://get.docker.io/ubuntu docker main'
    - key_url: 'https://get.docker.io/gpg'
    - require:
      - pkg: .dependencies::python-software-properties

.linux-image-generic-lts-raring:
  pkg:
    - installed
    - require:
      - pkgrepo: .docker_repo

.linux-headers-generic-lts-raring:
  pkg:
    - installed
    - require:
      - pkgrepo: .docker_repo

.lxc-docker:
  pkg:
    - installed
    - require:
      - pkg: .linux-image-generic-lts-raring
      - pkg: .linux-headers-generic-lts-raring
