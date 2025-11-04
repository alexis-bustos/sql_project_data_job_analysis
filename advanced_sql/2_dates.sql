-- Write a query to find the average salary both yearly and hourly
-- for job postings that were posted after June 1, 2023. Group the
-- results by job_schedule_type.
select 
  job_schedule_type,
  avg(salary_hour_avg) as avg_hourly,
  avg(salary_year_avg) as avg_yearly
from job_postings_fact
WHERE job_posted_date >= '2023-06-01'
GROUP BY job_schedule_type;


-- write a query to count the number of job postings for each 
-- month in 2023, adjusting the job_posted_date to be in 
-- 'America/New_York' time zone before extracting the month.
-- assume the job_posted_date is stored in utc. group by and 
-- order by the month.

WITH x AS (
  SELECT (job_posted_date AT TIME ZONE 'America/New_York') AS ny_ts
  FROM job_postings_fact
)
SELECT
  EXTRACT(MONTH FROM ny_ts) AS date_month,
  COUNT(*)                 AS postings
FROM x
WHERE ny_ts >= TIMESTAMP '2023-01-01'
  AND ny_ts < TIMESTAMP '2024-01-01'
GROUP BY date_month
ORDER BY date_month;


WITH x AS (
  SELECT (job_posted_date AT TIME ZONE 'America/New_York') AS ny_ts
  FROM job_postings_fact
)
SELECT
  DATE_TRUNC('month', ny_ts) AS month_local,
  COUNT(*) AS postings
FROM x
WHERE ny_ts >= TIMESTAMP '2023-01-01'
  AND ny_ts <  TIMESTAMP '2024-01-01'
GROUP BY month_local
ORDER BY month_local;



-- write a query to find the companies (include company name) that 
-- have posted jobs offering health insurance, where these postings
-- were made in the second quarter of 2023. use date extraction to
-- filter by quarter.
SELECT DISTINCT
  cd.name as company_name
FROM company_dim cd
INNER JOIN job_postings_fact jp
ON jp.company_id = cd.company_id
WHERE (
  jp.job_health_insurance IS TRUE
  AND EXTRACT(year from jp.job_posted_date) = 2023
  AND EXTRACT(quarter from jp.job_posted_date) = 2
  );

select *
from job_postings_fact
where job_posted_date >= '2023-01-01' AND
  job_posted_date < '2023-02-01'
order by job_posted_date;