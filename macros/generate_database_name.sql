{% macro default__generate_database_name(custom_database_name=none, node=none) -%}

    {%- set default_database = target.database -%}

    {%- set snowflake_prefix = var("snowflake_prefix", target.name.split("__")[0]) -%}
    {%- set workspace_name = target.name.split("__")[1] -%}

    {%- if custom_database_name is none -%}

        {{ snowflake_prefix | upper ~ "__" ~ workspace_name | upper ~ "__" ~ default_database }}

    {%- else -%}

        {{ snowflake_prefix | upper ~ "__" ~ workspace_name | upper ~ "__" ~ custom_database_name | trim }}

    {%- endif -%}

{%- endmacro %}