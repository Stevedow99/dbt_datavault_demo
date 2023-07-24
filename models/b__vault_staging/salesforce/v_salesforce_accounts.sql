{{ config(materialized='view') }}

{%- set yaml_metadata -%}
source_model: stg_salesforce_accounts
derived_columns:
  RECORD_SOURCE: "!SALESFORCE-ACCOUNTS"
  LOAD_DATETIME: "CREATED_DATETIMESTAMP"
  EFFECTIVE_FROM: "MODIFIED_DATETIMESTAMP"
  START_DATE: "MODIFIED_DATETIMESTAMP"
  END_DATE: "TO_DATE('9999-12-31')"
hashed_columns:
  ACCOUNT_PK_HASH: "ID"
  ACCOUNT_HASHDIFF:
    is_hashdiff: true
    columns:
      - "ID"
      - "TYPE"
      - "BILLING_STREET"
      - "BILLING_CITY"
      - "BILLING_STATE"
      - "BILLING_POSTAL_CODE"
      - "BILLING_COUNTRY"
      - "INDUSTRY"
      - "EFFECTIVE_FROM"
{%- endset -%}

{% set metadata_dict = fromyaml(yaml_metadata) %}

{{ automate_dv.stage(include_source_columns=true,
                  source_model=metadata_dict['source_model'],
                  derived_columns=metadata_dict['derived_columns'],
                  null_columns=none,
                  hashed_columns=metadata_dict['hashed_columns'],
                  ranked_columns=none) }}