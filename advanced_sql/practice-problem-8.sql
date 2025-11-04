SELECT 
  quarter_one_jobs.job_title_short,
  quarter_one_jobs.job_location,
  quarter_one_jobs.job_via,
  quarter_one_jobs.job_posted_date::DATE,
  quarter_one_jobs.salary_year_avg
FROM (
  SELECT * FROM january_jobs
  UNION ALL
  SELECT * FROM february_jobs
  UNION ALL
  SELECT * FROM march_jobs
) AS quarter_one_jobs
WHERE quarter_one_jobs.salary_year_avg > 70000
  AND quarter_one_jobs.job_title_short = 'Data Analyst'
ORDER BY quarter_one_jobs.salary_year_avg DESC;

