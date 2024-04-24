select 
    artistid as artist_id,
    name as artist_name
from {{ source('exl_dbt_training', 'artist') }}