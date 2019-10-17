{% from "oxidized/map.jinja" import oxidized with context %}

{% if oxidized.config.source.csv is defined %}

include:
  - oxidized.systemd

oxidized_router.db:
  file.managed:
    - name: {{ oxidized.config.source.csv.file }}
    - source: salt://oxidized/files/router.db
    - user: {{ oxidized.general.user }}
    - group: {{ oxidized.general.group }}
    - mode: 640
    - template: jinja
    - watch_in:
      - service: oxidized_systemd

{% endif %}
