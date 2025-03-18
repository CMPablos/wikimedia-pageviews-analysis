{{ config(
    materialized = 'table')}}

{% set filter_titles = get_filter_titles() %}  -- Call the macro
{% set filter_data = var('filter_data') %}

WITH ranked_data AS (
  SELECT
    language,
    page_title,
    views,
    ROW_NUMBER() OVER (PARTITION BY language ORDER BY views DESC) AS rank
  FROM
    `wikimedia-pageviews.pageviewsDataset.pageviews_summarized`
)
SELECT
  language,
  page_title,
  views
FROM
  ranked_data
WHERE
  rank <= 5
  {% if filter_data %}
    AND page_title NOT IN ({{ filter_titles }})
  {% endif %}