{% macro generate_alias_name(custom_alias_name=none, node=none) -%}

    {#
        Macroen brukes hovedsakelig for CI-kjøring for å prefikse tabellnavn med pr-referanse.
        Dette gjøres i to steg:
        1) Sett alias_name til custom_alias_name hvis det er spesifisert, ellers sett alias_name til nodenavn.
        2) Hvis CI-kjøring, prefiks alias_name med target_schema, som inneholder PR-referanse.
    #}

    {%- if custom_alias_name -%}

        {%- set alias_name = custom_alias_name | trim -%}

    {%- else -%}

        {%- set alias_name = node.name -%}

    {%- endif -%}

    {%- if target.name == "CI" -%}

        {{ target.schema ~ '_' ~ alias_name  }}

    {%- else -%}

        {{ alias_name }}

    {%- endif -%}

{%- endmacro %}