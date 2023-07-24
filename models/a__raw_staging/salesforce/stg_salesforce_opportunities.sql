with 

source as (

    select * from {{ source('salesforce', 'opportunites') }}

),

renamed as (

    select
        id,
        is_deleted,
        account_id,
        is_private,
        name,
        description,
        stage_name,
        amount,
        probability,
        expected_revenue,
        total_opportunity_quantity,
        close_date,
        type,
        next_step,
        lead_source,
        is_closed,
        is_won,
        forecast_category,
        forecast_category_name,
        campaign_id,
        has_opportunity_line_item,
        pricebook_2_id,
        owner_id,
        created_date,
        created_by_id,
        last_modified_date,
        last_modified_by_id,
        system_modstamp,
        last_activity_date,
        push_count,
        last_stage_change_date,
        fiscal_quarter,
        fiscal_year,
        fiscal,
        contact_id,
        last_viewed_date,
        last_referenced_date,
        has_open_activity,
        has_overdue_task,
        last_amount_changed_history_id,
        last_close_date_changed_history_id,
        delivery_installation_status_c,
        tracking_number_c,
        order_number_c,
        current_generators_c,
        main_competitors_c,
        _fivetran_deleted,
        _fivetran_synced

    from source

)

select * from renamed
