insert into DATA_VAULT_DEMO_DEV.dbt_vault.hub_account ("ACCOUNT_PK_HASH", "ACCOUNT_ID", "LOAD_DATETIME", "RECORD_SOURCE")
        (
            select "ACCOUNT_PK_HASH", "ACCOUNT_ID", "LOAD_DATETIME", "RECORD_SOURCE"
            from DATA_VAULT_DEMO_DEV.dbt_vault.hub_account__dbt_tmp
        );