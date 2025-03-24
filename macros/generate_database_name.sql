{% macro generate_database_name(custom_database_name=none, node=none) -%}

    {#
        Sikrer at databaser i Snowflake får navn på formen <prosjekt-prefix>__<workspace>__<database>.
    #}

    {%- set default_database = target.database -%}

    {%- set snowflake_prefix = var("snowflake_prefix") -%}

    {%- set workspace_name = target.name -%}

    {%- if custom_database_name is none -%}

        {{ snowflake_prefix | upper ~ "__" ~ workspace_name | upper ~ "__" ~ default_database }}

    {%- else -%}

        {{ snowflake_prefix | upper ~ "__" ~ workspace_name | upper ~ "__" ~ custom_database_name | trim }}

    {%- endif -%}

{%- endmacro %}