select 
    playlistid as playlist_id,
    trackid as track_id

from {{ source('exl_dbt_training', 'playlisttrack') }}