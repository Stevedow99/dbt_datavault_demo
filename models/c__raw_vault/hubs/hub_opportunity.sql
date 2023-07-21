
{{ config(materialized='incremental') }}

{%- set source_model = ["v_salesforce_opportunities"]   -%}

{%- set src_pk = "OPPURTUNITY_PK_HASH"                -%}
{%- set src_nk = "OPPURTUNITYID"                -%}
{%- set src_ldts = "DATECREATED"            -%}
{%- set src_source = "RECORD_SOURCE"          -%}

{{ dbtvault.hub(src_pk=src_pk, src_nk=src_nk, src_ldts=src_ldts,
                src_source=src_source, source_model=source_model) }}