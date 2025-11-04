-- January
CREATE TABLE january_jobs AS (
  SELECT *
  FROM job_postings_fact
  WHERE job_posted_date >= '2023-01-01' AND job_posted_date < '2023-02-01'
);

-- February
CREATE TABLE february_jobs AS (
  SELECT *
  FROM job_postings_fact
  WHERE job_posted_date >= '2023-02-01' AND job_posted_date < '2023-03-01'
);

-- March
CREATE TABLE march_jobs AS (
  SELECT *
  FROM job_postings_fact
  WHERE job_posted_date >= '2023-03-01' AND job_posted_date < '2023-04-01'
);

select *
from march_jobs;

