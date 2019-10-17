{% from "oxidized/map.jinja" import oxidized with context %}
{% set oxidized = oxidized.general %}

include:
 - oxidized
 - oxidized.systemd

oxidized_config:
  file.managed:
    - name: {{ oxidized.home }}/.config/oxidized/config
    - source: salt://oxidized/files/config
    - user: {{ oxidized.user }}
    - group: {{ oxidized.group }}
    - mode: 640
    - template: jinja
    - watch_in:
      - process: oxidized_systemd
