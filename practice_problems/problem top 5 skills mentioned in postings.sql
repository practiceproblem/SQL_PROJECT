WITH skill_id_counts AS (
SELECT
    skill_id,
    COUNT(*) AS total_skills
FROM
    skills_job_dim
GROUP BY
    skill_id
)

SELECT
    skills_dim.skills,
    skill_id_counts.total_skills
FROM skills_dim
LEFT JOIN skill_id_counts
ON skills_dim.skill_id = skill_id_counts.skill_id
ORDER BY
    total_skills DESC