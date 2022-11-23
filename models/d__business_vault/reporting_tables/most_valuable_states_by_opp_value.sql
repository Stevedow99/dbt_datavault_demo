select
    state,
    sum(amount) as opportunity_amount
from {{ ref('opportunities_accounts_contacts_details') }}
where state is not null
    group by
        state