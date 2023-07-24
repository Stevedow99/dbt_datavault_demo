
{{ config(materialized='incremental') }}

{%- set source_model = ["v_salesforce_contacts"]   -%}

{%- set src_pk = "CONTACT_ACCOUNT_PK"                -%}
{%- set src_fk = ["CONTACT_PK_HASH", "ACCOUNT_PK_HASH"]              -%}
{%- set src_ldts = "LOAD_DATETIME"            -%}
{%- set src_source = "RECORD_SOURCE"          -%}

{{ automate_dv.link(src_pk=src_pk, src_fk=src_fk, src_ldts=src_ldts,
                 src_source=src_source, source_model=source_model) }}