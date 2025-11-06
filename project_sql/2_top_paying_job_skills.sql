/*
Question: What skills are required for the top-paying data analyst jobs?
- Use the top 10 highest-paying Data Analyst jobs from first query
- Add the specific skills required for these roles
- Why? It provides a detailed look at which high-paying jobs demadn certain skills,
  helping job seekers understand which skills to develop that align with top salaries
*/

WITH top_paying_jobs AS (
  SELECT 
    jp.job_id,
    job_title,
    salary_year_avg,
    cd.name AS company_name
  FROM job_postings_fact jp
  INNER JOIN company_dim cd ON cd.company_id = jp.company_id
  WHERE (
    job_title_short = 'Data Analyst' AND
    job_location = 'Anywhere' AND
    salary_year_avg IS NOT NULL
  )
  ORDER BY salary_year_avg DESC
  LIMIT 10
)
SELECT 
  top_paying_jobs.*,
  sd.skills as skill_name
FROM top_paying_jobs
INNER JOIN skills_job_dim sjd ON sjd.job_id = top_paying_jobs.job_id
INNER JOIN skills_dim sd ON sd.skill_id = sjd.skill_id
ORDER BY top_paying_jobs.salary_year_avg DESC;

/*
Here's the breakdown of the most demanded skills for data analysts (as of June 30, 2025), based on job postings:
- SQL is leading the pack with a count of 8.
- Python follows closely with a count of 7.
- Tableau is also highly sought after, with a count of 6.
Other skills like R, Snowflake, Pandas, and Excel show varying degrees of deamnd.

[
  {
    "job_id": 1241985,
    "job_title": "Analytics Engineer (L5) - Live Quality of Experience",
    "salary_year_avg": "445000.0",
    "company_name": "Netflix",
    "skill_name": "sql"
  },
  {
    "job_id": 1241985,
    "job_title": "Analytics Engineer (L5) - Live Quality of Experience",
    "salary_year_avg": "445000.0",
    "company_name": "Netflix",
    "skill_name": "python"
  },
  {
    "job_id": 1283788,
    "job_title": "Analytics Engineer (L5) - Live Quality of Experience",
    "salary_year_avg": "445000.0",
    "company_name": "Netflix",
    "skill_name": "sql"
  },
  {
    "job_id": 1283788,
    "job_title": "Analytics Engineer (L5) - Live Quality of Experience",
    "salary_year_avg": "445000.0",
    "company_name": "Netflix",
    "skill_name": "python"
  },
  {
    "job_id": 1598650,
    "job_title": "Analytics Engineer - Playback Data (L5)",
    "salary_year_avg": "445000.0",
    "company_name": "Netflix",
    "skill_name": "sql"
  },
  {
    "job_id": 1598650,
    "job_title": "Analytics Engineer - Playback Data (L5)",
    "salary_year_avg": "445000.0",
    "company_name": "Netflix",
    "skill_name": "python"
  },
  {
    "job_id": 1598650,
    "job_title": "Analytics Engineer - Playback Data (L5)",
    "salary_year_avg": "445000.0",
    "company_name": "Netflix",
    "skill_name": "go"
  },
  {
    "job_id": 1598650,
    "job_title": "Analytics Engineer - Playback Data (L5)",
    "salary_year_avg": "445000.0",
    "company_name": "Netflix",
    "skill_name": "scala"
  },
  {
    "job_id": 1598650,
    "job_title": "Analytics Engineer - Playback Data (L5)",
    "salary_year_avg": "445000.0",
    "company_name": "Netflix",
    "skill_name": "typescript"
  },
  {
    "job_id": 1009426,
    "job_title": "Financial & Data Analyst - Pricing (12 months Contract)",
    "salary_year_avg": "385000.0",
    "company_name": "Siemens",
    "skill_name": "excel"
  },
  {
    "job_id": 1009426,
    "job_title": "Financial & Data Analyst - Pricing (12 months Contract)",
    "salary_year_avg": "385000.0",
    "company_name": "Siemens",
    "skill_name": "sap"
  },
  {
    "job_id": 1213707,
    "job_title": "Director of Engineering - Analytics",
    "salary_year_avg": "296910.0",
    "company_name": "Confluent",
    "skill_name": "kubernetes"
  },
  {
    "job_id": 1274698,
    "job_title": "Data Analyst",
    "salary_year_avg": "264000.0",
    "company_name": "Edge & Node",
    "skill_name": "sql"
  },
  {
    "job_id": 1274698,
    "job_title": "Data Analyst",
    "salary_year_avg": "264000.0",
    "company_name": "Edge & Node",
    "skill_name": "go"
  },
  {
    "job_id": 1274698,
    "job_title": "Data Analyst",
    "salary_year_avg": "264000.0",
    "company_name": "Edge & Node",
    "skill_name": "graphql"
  },
  {
    "job_id": 1274698,
    "job_title": "Data Analyst",
    "salary_year_avg": "264000.0",
    "company_name": "Edge & Node",
    "skill_name": "node"
  },
  {
    "job_id": 1274698,
    "job_title": "Data Analyst",
    "salary_year_avg": "264000.0",
    "company_name": "Edge & Node",
    "skill_name": "tableau"
  },
  {
    "job_id": 1274698,
    "job_title": "Data Analyst",
    "salary_year_avg": "264000.0",
    "company_name": "Edge & Node",
    "skill_name": "looker"
  },
  {
    "job_id": 1274698,
    "job_title": "Data Analyst",
    "salary_year_avg": "264000.0",
    "company_name": "Edge & Node",
    "skill_name": "git"
  },
  {
    "job_id": 1269865,
    "job_title": "Data Analyst",
    "salary_year_avg": "264000.0",
    "company_name": "Edge & Node",
    "skill_name": "sql"
  },
  {
    "job_id": 1269865,
    "job_title": "Data Analyst",
    "salary_year_avg": "264000.0",
    "company_name": "Edge & Node",
    "skill_name": "go"
  },
  {
    "job_id": 1269865,
    "job_title": "Data Analyst",
    "salary_year_avg": "264000.0",
    "company_name": "Edge & Node",
    "skill_name": "graphql"
  },
  {
    "job_id": 1269865,
    "job_title": "Data Analyst",
    "salary_year_avg": "264000.0",
    "company_name": "Edge & Node",
    "skill_name": "node"
  },
  {
    "job_id": 1269865,
    "job_title": "Data Analyst",
    "salary_year_avg": "264000.0",
    "company_name": "Edge & Node",
    "skill_name": "tableau"
  },
  {
    "job_id": 1269865,
    "job_title": "Data Analyst",
    "salary_year_avg": "264000.0",
    "company_name": "Edge & Node",
    "skill_name": "looker"
  },
  {
    "job_id": 1269865,
    "job_title": "Data Analyst",
    "salary_year_avg": "264000.0",
    "company_name": "Edge & Node",
    "skill_name": "git"
  },
  {
    "job_id": 374858,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T",
    "skill_name": "sql"
  },
  {
    "job_id": 374858,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T",
    "skill_name": "python"
  },
  {
    "job_id": 374858,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T",
    "skill_name": "r"
  },
  {
    "job_id": 374858,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T",
    "skill_name": "azure"
  },
  {
    "job_id": 374858,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T",
    "skill_name": "databricks"
  },
  {
    "job_id": 374858,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T",
    "skill_name": "aws"
  },
  {
    "job_id": 374858,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T",
    "skill_name": "pyspark"
  },
  {
    "job_id": 374858,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T",
    "skill_name": "pandas"
  },
  {
    "job_id": 374858,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T",
    "skill_name": "jupyter"
  },
  {
    "job_id": 374858,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T",
    "skill_name": "tableau"
  },
  {
    "job_id": 374858,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T",
    "skill_name": "excel"
  },
  {
    "job_id": 374858,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T",
    "skill_name": "power bi"
  },
  {
    "job_id": 374858,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T",
    "skill_name": "powerpoint"
  }
]
*/

