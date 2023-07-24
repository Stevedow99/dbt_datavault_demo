with 

source as (

    select * from {{ source('salesforce', 'leads') }}

),

renamed as (

    select
        id,
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
        _fivetran_synced

    from source

)

select * from renamed
