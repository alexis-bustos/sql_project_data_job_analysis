/*
Identify the top 5 skills that are most frequently mentioned in job postings. 
Use a subquery to find the skill IDs with the highest counts in the skills_job_dim 
table and then join this result with the skills_dim table to get the skill names.
*/

SELECT 
  sd.skills AS skill_name,
  sp.skill_postings as skill_postings
FROM (
  SELECT 
    skill_id,
    count(*) as skill_postings
  FROM skills_job_dim
  GROUP BY skill_id
) AS sp
JOIN skills_dim sd
ON sp.skill_id = sd.skill_id
ORDER BY sp.skill_postings DESC;