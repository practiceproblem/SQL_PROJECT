SELECT
    COUNT(job_id) AS job_posted_count,
    EXTRACT (MONTH FROM job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST' ) AS month
FROM
    job_postings_fact
GROUP BY
    month
ORDER BY
    month;