WITH raw_genome_tags AS (
    SELECT * FROM MOVIELENS.RAW.RAW_GENOME_TAGS
)   
SELECT
    tagId as tag_id,
    tag as tag_name
FROM raw_genome_tags