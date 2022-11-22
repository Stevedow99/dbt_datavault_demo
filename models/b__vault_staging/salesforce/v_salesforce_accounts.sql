{{ config(materialized='view') }}

{%- set yaml_metadata -%}
source_model: stg_salesforce_accounts
derived_columns:
  RECORD_SOURCE: "!SALESFORCE-ACCOUNTS"
  LOAD_DATETIME: "datecreated"
  EFFECTIVE_FROM: "modifieddate"
  START_DATE: "modifieddate"
  END_DATE: "TO_DATE('9999-12-31')"
hashed_columns:
  ACCOUNT_PK_HASH: "ACCOUNTID"
  ACCOUNT_HASHDIFF:
    is_hashdiff: true
    columns:
      - "ACCOUNTID"
      - "COMPANY_NAME"
      - "CITY"
      - "STATE"
{%- endset -%}

{% set metadata_dict = fromyaml(yaml_metadata) %}

{{ dbtvault.stage(include_source_columns=true,
                  source_model=metadata_dict['source_model'],
                  derived_columns=metadata_dict['derived_columns'],
                  null_columns=none,
                  hashed_columns=metadata_dict['hashed_columns'],
                  ranked_columns=none) }}