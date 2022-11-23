
with source as (

    select * from {{ source('salesforce', 'leads') }}

),

renamed as (

    select
    
        batchid,
        leadid,
        contactid,
        first_name,
        last_name,
        email,
        company,
        lead_status,
        datecreated,
        modifieddate

    from source

)

select * from renamed