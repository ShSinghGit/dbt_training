select 
    invoice_lines_joined_to_invoices.invoice_lineid,
    invoice_lines_joined_to_invoices.invoice_id,
    tracks_joined_to_albums_artists_genre_mediatype.track_id,
    tracks_joined_to_albums_artists_genre_mediatype.album_id,
    tracks_joined_to_albums_artists_genre_mediatype.mediatype_id,
    tracks_joined_to_albums_artists_genre_mediatype.genre_id,
    customers_joined_to_employees.customer_id,
    customers_joined_to_employees.employee_id,
    invoice_lines_joined_to_invoices.invoice_date_est,
    invoice_lines_joined_to_invoices.billing_state,
    invoice_lines_joined_to_invoices.billing_country,
    invoice_lines_joined_to_invoices.quantity_purchased,
    invoice_lines_joined_to_invoices.invoice_lineitem_revenue_usd,
    tracks_joined_to_albums_artists_genre_mediatype.track_name,
    tracks_joined_to_albums_artists_genre_mediatype.track_composer,
    tracks_joined_to_albums_artists_genre_mediatype.album_title,
    tracks_joined_to_albums_artists_genre_mediatype.artist_name,
    tracks_joined_to_albums_artists_genre_mediatype.mediatype_name,
    tracks_joined_to_albums_artists_genre_mediatype.genre_name,
    tracks_joined_to_albums_artists_genre_mediatype.track_length_ms,
    tracks_joined_to_albums_artists_genre_mediatype.track_length_seconds,
    tracks_joined_to_albums_artists_genre_mediatype.track_length_mins,
    tracks_joined_to_albums_artists_genre_mediatype.bytes,
    customers_joined_to_employees.customer_mailing_state,
    customers_joined_to_employees.customer_mailing_country,
    customers_joined_to_employees.customer_email_address,
    customers_joined_to_employees.employee_first_name,
    customers_joined_to_employees.employee_last_name,
    customers_joined_to_employees.employee_name,
    customers_joined_to_employees.employee_title,
    customers_joined_to_employees.employee_city,
    customers_joined_to_employees.employee_state,
    customers_joined_to_employees.employee_country
from {{ ref('int_invoice_lines_joined_to_invoices') }} invoice_lines_joined_to_invoices
left join {{ ref('int_customers_joined_to_employees') }} customers_joined_to_employees
    on 
        invoice_lines_joined_to_invoices.customer_id 
        = customers_joined_to_employees.customer_id
left join {{ ref('int_tracks_joined_to_albums_artists_genre_mediatype')}} tracks_joined_to_albums_artists_genre_mediatype
    on 
        invoice_lines_joined_to_invoices.track_id
        = tracks_joined_to_albums_artists_genre_mediatype.track_id