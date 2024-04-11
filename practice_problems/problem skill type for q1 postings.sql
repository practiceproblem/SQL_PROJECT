WITH q1_postings AS (
SELECT
    january_jobs.job_id,
    job_title_short,
    company_id,
    job_location,
    skills_job_dim.skill_id
FROM
    january_jobs
LEFT JOIN skills_job_dim ON january_jobs.job_id = skills_job_dim.job_id
WHERE salary_year_avg > 70000

UNION ALL

SELECT
    february_jobs.job_id,
    job_title_short,
    company_id,
    job_location,
    skills_job_dim.skill_id
FROM
    february_jobs
LEFT JOIN skills_job_dim ON february_jobs.job_id = skills_job_dim.job_id
WHERE salary_year_avg > 70000

UNION ALL

SELECT
    march_jobs.job_id,
    job_title_short,
    company_id,
    job_location,
    skills_job_dim.skill_id
FROM
    march_jobs
LEFT JOIN skills_job_dim ON march_jobs.job_id = skills_job_dim.job_id
WHERE salary_year_avg > 70000
)

SELECT
    skills,
    COUNT(*) AS total_postings
FROM
    q1_postings
LEFT JOIN skills_dim ON q1_postings.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
GROUP BY
    skills
ORDER BY
    total_postings DESC