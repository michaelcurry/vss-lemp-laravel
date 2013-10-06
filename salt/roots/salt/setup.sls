setup:
  cmd.script:
    - source: salt://setup.sh
    - user: root
    - group: root
    - shell: /bin/bash
    - order: last