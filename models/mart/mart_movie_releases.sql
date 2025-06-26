{{config(materialized= "table")}}

WITH fact_ratings AS (
    SELECT * FROM {{ ref('fact_ratings') }}
),
seed_movie_releases AS (
    SELECT * FROM {{ ref('seeds_movie_releases') }}
)

SELECT r.*,
    CASE WHEN s.release_date IS NOT NULL THEN s.release_date ELSE '1999-12-31' 
    END AS release_date_info
FROM fact_ratings r
LEFT JOIN seed_movie_releases s ON r.movie_id = s.movie_id