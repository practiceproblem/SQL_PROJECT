SELECT
    cd.name
FROM job_postings_fact AS jp
LEFT JOIN company_dim AS cd ON jp.company_id = cd.company_id
WHERE
    job_health_insurance = TRUE
    AND
    EXTRACT(QUARTER FROM jp.job_posted_date) = 2
    AND
    EXTRACT(year FROM jp.job_posted_date) = '2023'
GROUP BY
    cd.name;