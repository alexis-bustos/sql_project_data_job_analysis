SELECT
  job_title_short,
  job_location,
  CASE 
    WHEN job_location = 'New York, NY' THEN  'Local'
    WHEN job_location = 'Anywhere' THEN  'Remote'
    ELSE 'Onsite'
  END as location_category
FROM job_postings_fact;


-- How many jobs can I apply for locally, remote, and onsite?
SELECT
  count(job_id) as job_count,
  CASE 
    WHEN job_location = 'New York, NY' THEN  'Local'
    WHEN job_location = 'Anywhere' THEN  'Remote'
    ELSE 'Onsite'
  END as location_category
FROM job_postings_fact
WHERE job_title_short = 'Data Analyst'
GROUP BY location_category;

/*
I want to categorize the salaries from each job posting. to see if it fits in my desired salary range.
- Put salary into different buckets
- definen what's a high, standard, or low salary with your own conditions
- why? it is easy to determine which job postings are worth looking at based on salary. bucketing is a common practice in data analysis when viewing categories.
- I only want to look at data analyst roles
- order from highest to lowest
*/
SELECT
  CASE 
    WHEN salary_year_avg > 125000 THEN 'High'
    WHEN salary_year_avg > 80000 THEN 'Standard'
    ELSE 'Low' 
  END AS salary_category,
  count(*) as job_postings
FROM job_postings_fact
WHERE
  job_title_short = 'Data Analyst' AND
  salary_year_avg IS NOT NULL
GROUP BY salary_category
ORDER BY salary_category DESC;

