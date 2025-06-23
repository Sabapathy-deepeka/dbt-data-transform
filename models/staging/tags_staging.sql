WITH raw_tags AS(
    SELECT * FROM MOVIELENS.RAW.RAW_TAGS
)
SELECT 
    userId as user_id,
    movieId as movie_id,
    tag as user_tag,
    TIMESTAMP as tag_timestamp
FROM raw_tags