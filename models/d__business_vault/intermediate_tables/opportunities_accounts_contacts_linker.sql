with linked_hubs as (

Select
    hubo.OPPURTUNITY_PK_HASH,
    hubo.OPPURTUNITYID,
    linkoa.ACCOUNT_PK_HASH,
    linkca.CONTACT_PK_HASH
FROM {{ ref('hub_opportunity') }} hubo
    LEFT JOIN {{ ref('link_opportunity_account') }} linkoa
        ON hubo.OPPURTUNITY_PK_HASH = linkoa.OPPURTUNITY_PK_HASH
    LEFT JOIN {{ ref('link_contact_account') }} linkca
        ON linkoa.ACCOUNT_PK_HASH = linkca.ACCOUNT_PK_HASH
)

Select * from linked_hubs
    