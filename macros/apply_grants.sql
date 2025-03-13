{% macro default__get_grant_sql(relation, privilege, grantees) %}
  {% set project_name = target.name.split("__")[0] %}
  CALL dataplattform.{{ project_name }}.grant_schema_object_privileges('{{ relation.database }}', '{{ relation.schema }}', '{{ relation.identifier }}', '{{ privilege }}', {{ grantees }})
{% endmacro %}

{% macro default__get_revoke_sql(relation, privilege, grantees) %}
  {% set project_name = target.name.split("__")[0] %}
  CALL dataplattform.{{ project_name }}.revoke_schema_object_privileges('{{ relation.database }}', '{{ relation.schema }}', '{{ relation.identifier }}', '{{ privilege }}', {{ grantees }})
{% endmacro %}