
with source as (

    select * from {{ source('salesforce', 'contacts') }}

),

renamed as (

    select
    
        batchid,
        contactid,
        companyextid as accountid,
        first_name,
        last_name,
        email,
        country,
        datecreated,
        modifieddate

    from source

)

select * from renamed