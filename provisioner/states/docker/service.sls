#
# docker.service
#
# Docker Service Management
#

.docker_service:
  service:
    - running
    - name: docker
    - enable: True
    - reload: True
    - watch:
      - pkg: .install::lxc-docker
      - file: .config::docker_service_config
    - require:
      - stateconf: docker.config::goal
