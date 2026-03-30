{% macro generate_schema_name(custom_schema_name, node) -%}

    {%- set default_schema = target.schema -%}
    {%- if custom_schema_name is none -%}

        {{ default_schema }}

    {%- else -%}
        {%- if target.name.endswith('__CI') -%} 
            {{ default_schema }}_{{ custom_schema_name | trim }}
            {% do log("Default schema", info=True) %}
        {%- else -%}
            {{ custom_schema_name | trim }}
            {% do log("trimmet schema", info=True) %}
        {%- endif -%}
       {# {{ default_schema }}_{{ custom_schema_name | trim }}  #} {# dette er den originale hvor custom_schema legges til #}

    {%- endif -%}

{%- endmacro %}
