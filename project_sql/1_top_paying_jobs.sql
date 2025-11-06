/*
Question: What are the top-paying data analyst jobs?
Deliverable:
- Identify the top 10 highest-paying Data Analyst roles that are available remotely.
- Focuses on job postings with specified salaries (remove nulls).
- Why? Highlight the top-paying opportunities for Data Analysts, offering insights 
  into employment for Data Analysts.

*/

SELECT 
  job_id,
  job_title,
  job_location,
  job_schedule_type,
  salary_year_avg,
  job_posted_date,
  cd.name AS company_name
FROM job_postings_fact jp
INNER JOIN company_dim cd
ON cd.company_id = jp.company_id
WHERE (
  job_title_short = 'Data Analyst' AND
  job_location = 'Anywhere' AND
  salary_year_avg IS NOT NULL
)
ORDER BY salary_year_avg DESC
LIMIT 10;
  
/*
Here's a breakdown of the top data anlyst jobs up to June 30, 2025:
Top-end remote analyst salaries exceed $600K, with the highest paid role being a standard “Data Analyst” at Mantys ($650K), showing that remote compensation can reach Silicon-Valley executive levels when tied to high-growth or specialized companies.

Netflix dominates the top tier, consistently offering ~$445K for Analytics Engineer (L5) roles — indicating that “analytics engineer” titles command much higher pay than traditional data analyst positions, especially at tech giants.

Director-level data roles (Meta, Confluent, AT&T) also appear with salaries between ~$255K–$336K, showing that remote leadership positions in analytics remain highly compensated and accessible without geographical restriction.
*/