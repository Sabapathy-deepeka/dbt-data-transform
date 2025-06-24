{{
    config(
        materialized='incremental',
        on_schema_change='fail',
    )
}}

WITH ratings_staging AS (
    SELECT * FROM {{ ref('ratings_staging') }}
)
SELECT user_id,movie_id,user_rating,rating_timestamp
FROM ratings_staging WHERE user_rating IS NOT NULL

{% if is_incremental() %}
    AND rating_timestamp > (SELECT MAX(rating_timestamp) FROM {{ this }})
{% endif %}