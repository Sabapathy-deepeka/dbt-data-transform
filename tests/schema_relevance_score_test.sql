--SELECT movie_id, tag_id, genome_score FROM {{ref('fact_genome_scores')}} WHERE genome_score < 0

{{no_nulls_in_columns(ref('fact_genome_scores'))}}