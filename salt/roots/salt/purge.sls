/etc/apache2/ports.conf:
  file.managed:
    - source: salt://packages/apache2/ports.conf
    - user: root
    - group: root
    - mode: '0640'