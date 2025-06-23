WITH avg_ratings AS (
    SELECT user_id, AVG(user_rating) AS avg_rating
    FROM {{ ref('ratings_staging') }}
    GROUP BY user_id
)
SELECT r.user_id, r.user_rating, a.avg_rating
FROM {{ ref('ratings_staging') }} r JOIN avg_ratings a
ON r.user_id = a.user_id