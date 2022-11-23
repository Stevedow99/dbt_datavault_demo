with linked_hubs_w_details as (

SELECT
    lhs.oppurtunity_pk_hash,
    lhs.account_pk_hash,
    lhs.contact_pk_hash,
    lhs.oppurtunityid,
    ad.company_name,
    ad.city,
    ad.state,
    od.amount,
    od.project_name,
    od.oppurtunity_name,
    od.stage,
    od.close_date,
    cd.contactid,
    cd.first_name,
    cd.last_name,
    cd.email,
    cd.country
FROM {{ ref('opportunities_accounts_contacts_linker') }} lhs 
    LEFT JOIN {{ ref('sat_opportunity_details') }} od 
        on lhs.OPPURTUNITY_PK_HASH = od.OPPURTUNITY_PK_HASH
    LEFT JOIN {{ ref('sat_contact_details') }} cd
        on lhs.CONTACT_PK_HASH = cd.CONTACT_PK_HASH
    LEFT JOIN {{ ref('sat_account_details') }} ad
        on lhs.ACCOUNT_PK_HASH = ad.ACCOUNT_PK_HASH
)

Select * from linked_hubs_w_details