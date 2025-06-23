WITH raw_genome_scores AS (
    SELECT * FROM MOVIELENS.RAW.RAW_GENOME_SCORES
)
SELECT
    movieId as movie_id,
    tagId as tag_id,
    relevance as score
FROM raw_genome_scores