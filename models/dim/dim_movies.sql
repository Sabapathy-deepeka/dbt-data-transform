WITH movies_staging AS (
    SELECT * FROM {{ ref('movies_staging') }}
)
 SELECT 
    movie_id,INITCAP(TRIM(movie_title)) AS movie_title,SPLIT(movie_genres, '|') AS movie_genres,
    FROM movies_staging
