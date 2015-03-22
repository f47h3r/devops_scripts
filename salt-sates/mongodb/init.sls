mongodb:
  pkg:
    - installed
  service:
    - running
    - file: /etc/mongodb.conf

/etc/mongodb.conf:
  file:
    - managed
    - user: root
    - group: root
    - mode: 644
    - source: salt://mongodb/mongodb.conf
    - template: jinja
    - require:
      - pkg: mongodb

restartmongo:
  cmd.run:
    - name: service mongodb restart

