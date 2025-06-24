WITH genome_scores_staging AS (
    SELECT * FROM {{ ref('genome_scores_staging') }}
)
SELECT 
    movie_id, tag_id,
    ROUND(score, 2) AS genome_score
    FROM genome_scores_staging
