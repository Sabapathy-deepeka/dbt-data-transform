WITH ratings_staging AS (
    SELECT DISTINCT user_id FROM {{ ref('ratings_staging') }}
    ),
    tags_staging AS (
    SELECT DISTINCT user_id FROM {{ ref('tags_staging') }}
    )
 SELECT DISTINCT user_id FROM 
    ( 
        SELECT * FROM ratings_staging
        UNION
        SELECT * FROM tags_staging
    )


