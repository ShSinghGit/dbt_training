select 
    genreid as	genre_id,
    name as genre_name

from {{ source('exl_dbt_training', 'genre') }}