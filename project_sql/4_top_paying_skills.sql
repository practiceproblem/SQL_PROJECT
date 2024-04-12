/*
Question: What are the top skills based on salary?
- Look at the average salary associated with each skill for Data Analyst postions
- Focuses on roles with specified salaries, regardless of location
- Why? It reveals how different skills impact salary levels for Data Analysts and
    helps identify the most financially rewarding skills to acquire or improve
*/

SELECT 
    skills,
    ROUND(AVG(salary_year_avg),0) AS average_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_country = 'United Kingdom'
GROUP BY
    skills
ORDER BY
    average_salary DESC
LIMIT 50

/*
Insights into the trends in the top paying skills for Data Analysts:

    Python Dominance: Python-related skills such as NumPy, Pandas, TensorFlow, and PyTorch command the highest average salaries, indicating the strong demand for proficiency in Python for data analysis and machine learning tasks.

    Database Technologies: Database technologies like MongoDB, PostgreSQL, Kafka, Aurora, and NoSQL also rank among the top paying skills, reflecting the importance of data storage, retrieval, and processing in data analysis roles.

    Cloud Computing: Cloud computing skills, including AWS and Azure, are in high demand, suggesting an increasing reliance on cloud platforms for data storage, processing, and analytics solutions.

    Visualization and Reporting Tools: Tools like Tableau, Power BI, and Looker are also among the top paying skills, underscoring the importance of data visualization and reporting capabilities for communicating insights effectively to stakeholders.

These trends highlight the emphasis on proficiency in programming languages, database technologies, cloud platforms, and visualization tools for Data Analyst roles, reflecting the evolving landscape of data analysis and the increasing adoption of advanced technologies in this field.
*/