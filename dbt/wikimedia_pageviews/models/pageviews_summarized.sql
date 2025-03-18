{{ config(
    materialized = 'view',
    cluster_by = ["language"]
) }}
SELECT
  language,
  page_title,
  SUM(views) as views,
  SUM(bytes) as bytes
FROM
  {{ ref('pageviews_partitioned') }}
  GROUP BY language, page_title