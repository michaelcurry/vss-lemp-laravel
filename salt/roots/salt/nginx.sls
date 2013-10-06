nginx_install:
  pkgrepo.managed:
    - ppa: nginx/stable
    - require:
      - pkg: python-software-properties
  file.managed:
    - name: /etc/nginx/nginx.conf
    - source: salt://packages/nginx/nginx.conf
    - user: root
    - group: root
    - mode: '0640'
    - require:
      - pkg: nginx_install
  pkg.installed:
    - name: nginx-extras
    - require:
      - pkgrepo: nginx_install
  service.running:
    - name: nginx
    - enable: True
    - reload: True
    - require:
      - file: nginx_install
    - watch:
      - file: nginx_install