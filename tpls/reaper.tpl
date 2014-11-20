{% macro shownote(note) -%}
M0,"{{note.title | replace("\"", "\"\"") | safe}};{{note.url}};
{%- for tag in note.tags %} #{{tag}} {%- endfor %}"
{%- for subnote in note.shownotes -%}
  {{ shownote(subnote) }}
{%- endfor -%}
,{{note.timestamp | htime}},,,
{% endmacro %}

{%- for note in shownotes -%}
  {%- if note.timestamp != null -%}
    {{ shownote(note) }}
  {%- endif -%}
{%- endfor -%}

