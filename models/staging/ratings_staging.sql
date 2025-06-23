WITH raw_ratings AS(
    SELECT * FROM MOVIELENS.RAW.RAW_RATINGS
)

SELECT 
    userId as user_id,
    movieId as movie_id,
    rating as user_rating,
    TIMESTAMP as rating_timestamp
FROM raw_ratings