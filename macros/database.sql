{% macro default__create_or_replace_database(database_name) %}
  {% set project_name = target.name.split("__")[0] %}
  {% set clean_user_name = target.user.split("@")[0] | replace('.', '') | replace('-', '') %}
  {% set upper_database_name = database_name | upper %}
  {% set full_database_name = project_name ~ '__' ~ clean_user_name ~ '__' ~ upper_database_name %}
    
  {%- call statement('create_or_replace_database') -%}
    CALL DATAPLATTFORM.{{ project_name }}.CREATE_OR_REPLACE_DATABASE(
      '{{ full_database_name }}',
      ARRAY_CONSTRUCT('{{ project_name }}_NON_PROD_ROLE')
    )
  {% endcall %}
  {{ log("Database " ~ full_database_name ~ " has been created", info=True) }}
{% endmacro %}

{% macro create_or_replace_database(database_name) %}
    {{ return(adapter.dispatch('create_or_replace_database')(database_name)) }}
{% endmacro %}


{% macro default__create_database(database_name) %}
  {% set project_name = target.name.split("__")[0] %}
  {% set clean_user_name = target.user.split("@")[0] | replace('.', '') | replace('-', '') %}
  {% set upper_database_name = database_name | upper %}
  {% set full_database_name = project_name ~ '__' ~ clean_user_name ~ '__' ~ upper_database_name %}
    
  {%- call statement('create_database') -%}
    CALL DATAPLATTFORM.{{ project_name }}.CREATE_DATABASE(
      '{{ full_database_name }}',
      ARRAY_CONSTRUCT('{{ project_name }}_NON_PROD_ROLE')
    )
  {% endcall %}
  {{ log("Database " ~ full_database_name ~ " has been created or already exsists", info=True) }}
{% endmacro %}

{% macro create_database(database_name) %}
    {{ return(adapter.dispatch('create_database')(database_name)) }}
{% endmacro %}


{% macro default__drop_database(database_name) %}
  {% set project_name = target.name.split("__")[0] %}
  {% set clean_user_name = target.user.split("@")[0] | replace('.', '') | replace('-', '') %}
  {% set upper_database_name = database_name | upper %}
  {% set full_database_name = project_name ~ '__' ~ clean_user_name ~ '__' ~ upper_database_name %}
    
  {%- call statement('drop_database') -%}
    CALL DATAPLATTFORM.{{ project_name }}.DROP_DATABASE(
      '{{ full_database_name }}'
    )
  {% endcall %}
  {{ log("Database " ~ full_database_name ~ " has been dropped", info=True) }}
{% endmacro %}

{% macro drop_database(database_name) %}
    {{ return(adapter.dispatch('drop_database')(database_name)) }}
{% endmacro %}


