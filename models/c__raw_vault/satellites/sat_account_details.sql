
{{ config(materialized='incremental') }}

{%- set yaml_metadata -%}
source_model: "v_salesforce_accounts_one"
src_pk: "ACCOUNT_PK_HASH"
src_hashdiff: 
  source_column: "ACCOUNT_HASHDIFF"
  alias: "HASHDIFF"
src_payload:
    - "ACCOUNT_ID"
    - "COMPANY_NAME"
    - "TYPE"
    - "BILLING_STREET"
    - "BILLING_CITY"
    - "BILLING_STATE"
    - "BILLING_POSTAL_CODE"
    - "BILLING_COUNTRY"
    - "INDUSTRY"
src_eff: "MODIFIED_DATETIMESTAMP"
src_ldts: "CREATED_DATETIMESTAMP"
src_source: "RECORD_SOURCE"
{%- endset -%}

{% set metadata_dict = fromyaml(yaml_metadata) %}

{{ automate_dv.sat(src_pk=metadata_dict["src_pk"],
                src_hashdiff=metadata_dict["src_hashdiff"],
                src_payload=metadata_dict["src_payload"],
                src_eff=metadata_dict["src_eff"],
                src_ldts=metadata_dict["src_ldts"],
                src_source=metadata_dict["src_source"],
                source_model=metadata_dict["source_model"])   }}