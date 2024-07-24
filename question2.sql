--2. We want to know which skills are required in the top paying jobs
-- First, we need to get the highest paid jobs. We use the previous query to build a CTE

WITH top_paid_jobs AS (
SELECT 
    job_id,
    salary_year_avg,
    job_title,
    name AS company_name
FROM
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE 
    job_title_short = 'Data Analyst' AND
    job_location = 'Anywhere' AND
    salary_year_avg IS NOT NULL 
   

ORDER BY   
    salary_year_avg DESC
LIMIT  10
)

-- We need to get to the skills table. We can't join directly, so we create 2 joins
SELECT 
    top_paid_jobs.*,
    skills
FROM top_paid_jobs
INNER JOIN skills_job_dim ON top_paid_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    salary_year_avg DESC

LIMIT 10