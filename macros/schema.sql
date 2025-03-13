{% macro default__create_schema(relation) -%}
  {%- call statement('create_schema') -%}
    {% set project_name = target.name.split("__")[0] %}
    CALL dataplattform.{{ project_name }}.create_schema('{{ relation.database }}', '{{ relation.schema }}')
  {% endcall %}
{% endmacro %}

{% macro default__drop_schema(relation) -%}
  {%- call statement('drop_schema') -%}
    {% set project_name = target.name.split("__")[0] %}
    CALL dataplattform.{{ project_name }}.drop_schema('{{ relation.database }}', '{{ relation.schema }}')
  {% endcall %}
{% endmacro %}