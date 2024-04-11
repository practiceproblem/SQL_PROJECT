SELECT
   job_title,
   job_location,
   salary_year_avg,
   CASE
        WHEN salary_year_avg >= 100000 THEN 'High'
        WHEN salary_year_avg >= 50000 THEN 'Standard'
        ELSE 'Low'
    END AS salary_category
FROM
    job_postings_fact
WHERE
    job_title_short = 'Data Analyst'
ORDER BY
    salary_year_avg;