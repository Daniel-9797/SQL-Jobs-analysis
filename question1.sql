-- 1. We want to know the top paying jobs. Moreover, we'll also bring out some specific insights from Data Analyst rolls
--We want salaries and companies. We do a JOIN
SELECT *
FROM (
SELECT 
    job_id,
    salary_year_avg,
    job_title,
    job_location,
    job_country,
    name AS company_name
FROM
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id

--We get nulls in the result. So, we filter

WHERE 
salary_year_avg IS NOT NULL 

-- To get sepcific results for Data Analyst rolls and in remote
   AND
   job_title_short = 'Data Analyst' AND
   job_location = 'Anywhere' 
   

ORDER BY   
    salary_year_avg DESC
LIMIT  10
) AS top_paid_jobs

