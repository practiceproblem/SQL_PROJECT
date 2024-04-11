WITH company_job_count AS (
SELECT
    company_id,
    COUNT(*) AS number_jobs
FROM
    job_postings_fact
GROUP BY
    company_id
)

SELECT
    company_dim.name AS company_name,
    company_job_count.number_jobs,
    CASE
        WHEN number_jobs <= 10 THEN 'Small'
        WHEN number_jobs <= 50 THEN 'Medium'
        ELSE 'Large'
    END AS size_category
FROM
    company_dim
LEFT JOIN company_job_count ON company_job_count.company_id = company_dim.company_id
ORDER BY
    number_jobs DESC