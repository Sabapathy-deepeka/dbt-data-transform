{% snapshot snap_tags %}

{{
    config(
        target_schema='snapshots',
        unique_key=['user_id','movie_id','user_tag'],
        strategy='timestamp',
        updated_at='tag_timestamp',
        invalidate_hard_deletes=True,
        materialized='snapshot'
    )
}}

SELECT {{ dbt_utils.generate_surrogate_key(['user_id', 'movie_id', 'user_tag']) }} AS row_id, user_id, movie_id, user_tag, CAST(tag_timestamp AS TIMESTAMP_NTZ) AS tag_timestamp
FROM {{ref('tags_staging')}}
LIMIT 100

{% endsnapshot %}