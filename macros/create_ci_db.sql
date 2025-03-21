{% macro create_ci_db() %}

    {% set project_name = project_name.upper() %}

    {% set cnt_sql %}
        select count(1) from snowflake.information_schema.databases where database_name = '{{ project_name }}__CI__MAIN' 
    {% endset %}

    {% set cnt = run_query(cnt_sql).columns[0][0] %}

    {% set sql %}
        CALL IDENTIFIER('DATAPLATTFORM.{{ project_name }}.CREATE_DATABASE')('{{ project_name }}__CI__MAIN', ARRAY_CONSTRUCT('{{ project_name }}_COMMON_ROLE'))
    {% endset %}

    {% if cnt == 0 %}
        {{ run_query(sql) }} {% do log("Database sucessfully created", info=True) %}
    {% else %} {% do log("Database already exists", info=True) %}
    {% endif %}

    
{% endmacro %}
