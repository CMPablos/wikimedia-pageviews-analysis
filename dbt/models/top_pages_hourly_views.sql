{{ config(
    materialized = 'table'
) }}

WITH top_pages AS (
    -- Model containing top 5 pages per language
    SELECT
        language,
        page_title
    FROM {{ ref('top_by_language') }}
),

pageviews AS (
    SELECT
        date,
        language,
        page_title,
        views
    FROM {{ ref('pageviews_partitioned') }}
)

SELECT
    p.date,
    t.language,
    p.page_title,
    SUM(p.views) AS total_views
FROM pageviews p
JOIN top_pages t
    ON p.language   = t.language
   AND p.page_title = t.page_title
GROUP BY
    date,
    language,
    page_title
ORDER BY
    date,
    language