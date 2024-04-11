SELECT
    AVG(salary_year_avg) ::NUMERIC(9,2) AS average_yearly_salary,
    AVG(salary_hour_avg) ::NUMERIC(9,2) AS average_hourly_salary,
    job_schedule_type
FROM job_postings_fact
WHERE
    job_posted_date > '01-06-2023'
    AND
        (salary_year_avg IS NOT NULL
     OR
         salary_hour_avg IS NOT NULL)
GROUP BY
    job_schedule_type;