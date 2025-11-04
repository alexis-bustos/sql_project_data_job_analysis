/*
Find the count of the number of remote jobs postings per skill
  - display the top 5 skills by their demand in remote jobs
  - also filter by data analyst roles
  - include skill ID, name, and count of postings requiring the skill
*/

-- this query counts all the postings per skill
SELECT 
  skill_id,
  count(job_id) AS posted_count
FROM skills_job_dim
GROUP BY skill_id;

-- this query returns a table of skills mentioned by remote jobs
SELECT 
  skill_id,
  count(sj.job_id) as posted_count 
FROM skills_job_dim sj
LEFT JOIN job_postings_fact jp
ON jp.job_id = sj.job_id
WHERE job_work_from_home IS TRUE AND
      job_title_short = 'Data Analyst'
GROUP BY skill_id;

-- solution with subquery
SELECT
  sd.skills AS skill_name,
  COALESCE(skills_count.posted_count, 0) as job_count
FROM skills_dim sd
INNER JOIN (
  SELECT 
  skill_id,
  count(*) as posted_count 
  FROM skills_job_dim sj
  INNER JOIN job_postings_fact jp
  ON jp.job_id = sj.job_id
  WHERE job_work_from_home IS TRUE AND
      job_title_short = 'Data Analyst'
  GROUP BY skill_id
) AS skills_count
ON sd.skill_id = skills_count.skill_id
ORDER BY job_count DESC;

-- Solution with CTE
WITH remote_job_skills AS (
  SELECT 
  skill_id,
  COUNT(*) as skill_count 
  FROM skills_job_dim sj
  INNER JOIN job_postings_fact jp
  ON jp.job_id = sj.job_id
  WHERE job_work_from_home IS TRUE AND
      job_title_short = 'Data Analyst'
  GROUP BY skill_id
)
SELECT  
  sd.skills AS skill_name,
  COALESCE(rjs.skill_count, 0) as skill_count
FROM remote_job_skills rjs
INNER JOIN skills_dim sd
ON rjs.skill_id = sd.skill_id
ORDER BY skill_count DESC
LIMIT 5;