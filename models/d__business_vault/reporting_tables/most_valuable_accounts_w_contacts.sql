select
    company_name,
    concat_ws(' ', first_name, last_name) as contact_full_name,
    sum(amount) as opportunity_amount
from {{ ref('opportunities_accounts_contacts_details') }}
where company_name is not null
    group by
        company_name,
        concat_ws(' ', first_name, last_name)