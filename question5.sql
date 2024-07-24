-- 5. Which are the most optimal skills to learn for a Data Analyst beginner?
-- We create 2 CTE's from previous query
-- We want to know how many times is each skill demanded in Data Analyst rolls. So we use  COUNT

WITH skills_demand AS (   
    SELECT 
        skills_dim.skill_id,
        skills_dim.skills,
        COUNT(skills_job_dim.job_id) AS demand_count
    FROM 
        job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE 
        job_title_short = 'Data Analyst' AND
        job_work_from_home = True
        AND salary_year_avg IS NOT NULL

    GROUP BY
        skills_dim.skill_id
    
    
), avg_salary2 AS (

SELECT 
    skills_job_dim.skill_id,
    ROUND(AVG(salary_year_avg),0) AS avg_salary
FROM 
    job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE 
    job_title_short = 'Data Analyst' 
    AND job_work_from_home = True 
    AND salary_year_avg IS NOT NULL
GROUP BY
    skills_job_dim.skill_id
HAVING
    COUNT(skills_job_dim.job_id) > 10
)

SELECT
    skills_demand.skill_id,
    skills_demand.skills,
    demand_count
   -- ,avg_salary2
FROM 
    skills_demand
INNER JOIN avg_salary2 ON skills_demand.skill_id = avg_salary2.skill_id
ORDER BY
    demand_count DESC,
    avg_salary2 DESC
LIMIT 15