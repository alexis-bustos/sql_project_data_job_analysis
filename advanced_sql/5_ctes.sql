/*
Find the companies that have the most job openings.
- Get the total number of job postings per company id
- Return the total number of jobs with the company name
*/
WITH company_job_count AS (
  SELECT
    company_id,
    count(*) AS job_postings
  FROM job_postings_fact
  GROUP BY company_id
)
SELECT
  cd.name AS company_name,
  cjc.job_postings
FROM company_dim cd 
LEFT JOIN company_job_count cjc
ON cd.company_id = cjc.company_id
ORDER BY job_postings DESC;

/*
Identify the top 5 skills that are most frequently mentioned in job postings.
Use subquery to find the skill IDs with the highest counts in the skills_job_dim table 
and then join this result with the skills_dim table to get the skill names.
*/
SELECT
  sd.skills,
  t.skill_count
FROM (
  SELECT skill_id, COUNT(*) AS skill_count
  FROM skills_job_dim
  GROUP BY skill_id
  ORDER BY COUNT(*) DESC
  LIMIT 5
) AS t
JOIN skills_dim sd
  ON sd.skill_id = t.skill_id
ORDER BY t.skill_count DESC;


/*
Determine the size category (Small, Medium, or Large) for each company by 
first identifying the number job postings they have. 

Use a subquery to calculate the total job postings per company. A company is considered 'Small' 
if it has less than 10 job postings, 'Medium' if the number of job postings
is between 10 and 50, 'Large' if it has more than 50 job postings. 

Implement a subquery to aggregate job counts per company before classifying them based on size.
*/
SELECT 
  cd.name as company_name,
  CASE 
    WHEN COALESCE(jobs_per_company.jobs_posted, 0) > 50 THEN 'Large'
    WHEN COALESCE(jobs_per_company.jobs_posted, 0) BETWEEN 10 AND 50 THEN 'Medium'
    ELSE 'Small'
  END AS size_category,
  COALESCE(jobs_per_company.jobs_posted, 0) AS jobs_posted
FROM (
  SELECT 
  company_id,
  count(job_id) as jobs_posted
  FROM job_postings_fact
  GROUP BY company_id
) AS jobs_per_company
LEFT JOIN company_dim cd
ON cd.company_id = jobs_per_company.company_id;


WITH jobs_per_company AS (
  SELECT 
  company_id,
  count(job_id) as jobs_posted
  FROM job_postings_fact
  GROUP BY company_id
)
SELECT
  cd.name AS company_name,
  COALESCE(jpc.jobs_posted, 0) AS jobs_posted,
  CASE 
    WHEN COALESCE(jpc.jobs_posted,0) > 50 THEN 'Large'
    WHEN COALESCE(jpc.jobs_posted,0) BETWEEN 10 AND 50 THEN 'Medium'
    ELSE 'Small'
  END AS size_category
FROM company_dim cd
LEFT JOIN jobs_per_company jpc ON jpc.company_id = cd.company_id
ORDER BY jpc.jobs_posted DESC, cd.name;



