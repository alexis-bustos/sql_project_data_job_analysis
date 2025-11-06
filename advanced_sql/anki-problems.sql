/*
Identify the top 5 skills that are most frequently mentioned in job postings. 
Use a subquery to find the skill IDs with the highest counts in the skills_job_dim 
table and then join this result with the skills_dim table to get the skill names.
*/

SELECT
  sd.skills as skill,
  jobs_count
FROM (SELECT
  skill_id,
  count(*) AS jobs_count
  FROM skills_job_dim
  GROUP BY skill_id
) AS skills_count
INNER JOIN skills_dim sd
ON sd.skill_id = skills_count.skill_id
ORDER BY jobs_count DESC
limit 5;