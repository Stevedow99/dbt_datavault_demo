with linked_hubs as (

Select
    hubo.OPPORTUNITY_PK_HASH,
    hubo.OPPORTUNITY_ID,
    linkoa.ACCOUNT_PK_HASH,
    linkca.CONTACT_PK_HASH
FROM {{ ref('hub_opportunity') }} hubo
    LEFT JOIN {{ ref('link_opportunity_account') }} linkoa
        ON hubo.OPPORTUNITY_PK_HASH = linkoa.OPPORTUNITY_PK_HASH
    LEFT JOIN {{ ref('link_contact_account') }} linkca
        ON linkoa.ACCOUNT_PK_HASH = linkca.ACCOUNT_PK_HASH
)

Select * from linked_hubs
    