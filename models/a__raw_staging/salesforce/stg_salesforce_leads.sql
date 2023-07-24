with 

source as (

    select * from {{ source('salesforce', 'leads') }}

),

renamed as (

    select
        id as lead_id,
        contact_id,
        first_name,
        last_name,
        company,
        email,
        status,
        source,
        created_date,
        phone,
        description,
        industry,
        street,
        city,
        state,
        postal_code,
        country,
        deleted_datetimestamp,
        created_datetimestamp,
        modified_datetimestamp

    from source

)

select * from renamed
