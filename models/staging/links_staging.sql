WITH raw_links AS(
    SELECT * FROM MOVIELENS.RAW.RAW_LINKS
)
SELECT 
    movieId as movie_id,
    imdbId as imdb_id,
    tmdbId as tmdb_id
FROM raw_links