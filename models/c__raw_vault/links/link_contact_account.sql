
{{ config(materialized='incremental') }}

{%- set source_model = ["v_salesforce_contacts"]   -%}

{%- set src_pk = "CONTACT_PK_HASH"                -%}
{%- set src_fk = ["ACCOUNT_PKey_HASH"]              -%}
{%- set src_ldts = "DATECREATED"            -%}
{%- set src_source = "RECORD_SOURCE"          -%}

{{ dbtvault.link(src_pk=src_pk, src_fk=src_fk, src_ldts=src_ldts,
                 src_source=src_source, source_model=source_model) }}