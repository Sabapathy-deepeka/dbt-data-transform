WITH genome_tags_staging AS (
    SELECT * FROM {{ ref('genome_tags_staging') }}
)
SELECT tag_id,INITCAP(TRIM(tag_name)) AS tag_name FROM genome_tags_staging