-- SELECT column_name
-- FROM table_one

-- UNION -- combine the two tables

-- SELECT column_name
-- FROM table_two;

-- Get jobs and companies from January
SELECT
  job_title_short,
  company_id,
  job_location
FROM january_jobs

UNION

SELECT
  job_title_short,
  company_id,
  job_location
FROM february_jobs

UNION

SELECT
  job_title_short,
  company_id,
  job_location
FROM march_jobs;

/*
Get the corresponding skill and skill type for each job posting in q1

Includes those without any skills, too.

Why? Look at the skills and the type for each job in the first quarter that has a salary > $70,000
*/

SELECT
'Jan' AS month,
  jb.job_id,
  sjd.skill_id,
  sd.skills as skill,
  sd.type as skill_type
FROM january_jobs jb
LEFT JOIN skills_job_dim sjd
ON sjd.job_id = jb.job_id
LEFT JOIN skills_dim sd
ON sd.skill_id = sjd.skill_id
WHERE jb.salary_year_avg > 70000

UNION ALL

SELECT
'Feb' AS month,
  fb.job_id,
  sjd.skill_id,
  sd.skills as skill,
  sd.type as skill_type
FROM february_jobs fb
LEFT JOIN skills_job_dim sjd
ON sjd.job_id = fb.job_id
LEFT JOIN skills_dim sd
ON sd.skill_id = sjd.skill_id
WHERE fb.salary_year_avg > 70000

UNION ALL

SELECT
'Mar' AS month,
  mb.job_id,
  sjd.skill_id,
  sd.skills as skill,
  sd.type as skill_type
FROM march_jobs mb
LEFT JOIN skills_job_dim sjd
ON sjd.job_id = mb.job_id
LEFT JOIN skills_dim sd
ON sd.skill_id = sjd.skill_id
WHERE mb.salary_year_avg > 70000;