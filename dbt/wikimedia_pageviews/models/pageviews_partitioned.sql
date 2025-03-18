{{ config(
    materialized = 'incremental',
    partition_by = {
        "field": "date",
        "data_type": "timestamp",
        "granularity": "hour"
    },
    cluster_by = ["language", "page_title"]
) }}

SELECT
  language,
  project,
  page_title,
  views,
  bytes,
  TIMESTAMP_SECONDS(CAST(date / 1000000000 AS INTEGER)) as date,
  url
FROM
  `wikimedia-pageviews.pageviewsDataset.pageviews_external`