Select 
    *,
    12 as new_column,
    'this is a great column' as new_column_two
from {{ ref('my_first_model') }}