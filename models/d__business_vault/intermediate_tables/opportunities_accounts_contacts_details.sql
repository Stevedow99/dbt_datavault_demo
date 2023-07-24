with linked_hubs_w_details as (

SELECT
    lhs.opportunity_pk_hash,
    lhs.account_pk_hash,
    lhs.contact_pk_hash,
    lhs.opportunity_id,
    ad.company_name,
    ad.billing_city as city,
    ad.billing_state as state,
    od.amount,
    od.opportunity_name,
    od.stage_name as stage,
    od.close_date,
    cd.contact_id,
    cd.first_name,
    cd.last_name,
    cd.email
FROM {{ ref('opportunities_accounts_contacts_linker') }} lhs 
    LEFT JOIN {{ ref('sat_opportunity_details') }} od 
        on lhs.OPPORTUNITY_PK_HASH = od.OPPORTUNITY_PK_HASH
    LEFT JOIN {{ ref('sat_contact_details') }} cd
        on lhs.CONTACT_PK_HASH = cd.CONTACT_PK_HASH
    LEFT JOIN {{ ref('sat_account_details') }} ad
        on lhs.ACCOUNT_PK_HASH = ad.ACCOUNT_PK_HASH
)

Select * from linked_hubs_w_details