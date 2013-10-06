#
# docker.config
#
# Docker configuration
#

.docker_service_config:
  file:
    - managed
    - name: /etc/init/docker.conf
    - source: salt://docker/files/docker.service.conf
    - user: root
    - group: root
    - mode: 644
    - require:
      - stateconf: docker.install::goal
