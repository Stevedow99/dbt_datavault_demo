
with source as (

    select * from {{ source('salesforce', 'opportunites') }}

),

renamed as (

    select
    
        batchid,
        oppurtunityid as oppurtunityid,
        companextid as accountid,
        TO_DECIMAL(REPLACE(REPLACE(amount,'$',''),',',''),9,2) as amount,
        project_name,
        oppurtunity_name,
        stage,
        close_date,
        datecreated,
        modifieddate

    from source

)

select * from renamed