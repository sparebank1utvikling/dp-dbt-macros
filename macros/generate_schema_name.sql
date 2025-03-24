{% macro generate_schema_name(custom_schema_name, node) -%}
    {#
        Hvis ingen schema er satt for aktuelt objekt, bruker vi target.schema.
        Hvis custom_schema_name er satt, altså at schema er satt eksplisitt i f.eks. dbt_project.yml, så bruker vi dette.
    #}

    {%- if custom_schema_name is none -%}

        {{ target.schema.lower() | trim }}

    {%- else -%}

        {{ custom_schema_name.lower() | trim }}

    {%- endif -%}

{%- endmacro %}