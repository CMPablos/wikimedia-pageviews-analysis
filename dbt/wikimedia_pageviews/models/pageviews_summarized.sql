{{ config(
    materialized = 'view',
    cluster_by = ["language"]
) }}
SELECT
  language,
  page_title,
  SUM(views),
  SUM(bytes)
FROM
  `wikimedia-pageviews.pageviewsDataset.pageviews_partitioned`
  GROUP BY language, page_title