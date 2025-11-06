/*
Question: What are the msot optimal skills to learn (aka it's in high demand and a high-paying skill)?
- Idendify skills in high demand and associated with high average salaryes for Data Analyst roles
- Conceentrates on remote positions iwht specified salaries
- Why? Targets skills that offer job security (high demand) and financial benefits (high salaries),
  offering strategic insights for career development in data analysis
*/

WITH skill_demand AS (
  SELECT 
    sd.skill_id,
    sd.skills AS skill,
    count(sjd.job_id) AS demand_count
  FROM job_postings_fact jp
  INNER JOIN skills_job_dim sjd ON sjd.job_id = jp.job_id
  INNER JOIN skills_dim sd ON sd.skill_id = sjd.skill_id 
  WHERE 
    jp.job_title_short = 'Data Analyst'
    AND jp.salary_year_avg IS NOT NULL
    AND job_work_from_home = TRUE
  GROUP BY sd.skill_id, skill
), average_salaries AS (
  SELECT 
    sd.skill_id,
    sd.skills AS skill,
    ROUND(AVG(jp.salary_year_avg),0) AS avg_salary
  FROM job_postings_fact jp
  INNER JOIN skills_job_dim sjd ON sjd.job_id = jp.job_id
  INNER JOIN skills_dim sd ON sd.skill_id = sjd.skill_id 
  WHERE (
    jp.job_title_short = 'Data Analyst' AND
    jp.salary_year_avg IS NOT NULL AND
    jp.job_work_from_home = TRUE
    )
  GROUP BY sd.skill_id
)
SELECT 
  skill_demand.skill_id,
  skill_demand.skill,
  demand_count,
  avg_salary
FROM skill_demand
INNER JOIN average_salaries ON average_salaries.skill_id = skill_demand.skill_id
WHERE demand_count > 10
ORDER BY 
  demand_count DESC,
  avg_salary DESC
LIMIT 25;

-- Rewriting this same query more concisely
SELECT
    sd.skill_id,
    sd.skills AS skill,
    count(sjd.job_id) AS demand_count,
    ROUND(AVG(jp.salary_year_avg),0) AS average_salary
FROM job_postings_fact jp
INNER JOIN skills_job_dim sjd ON sjd.job_id = jp.job_id
INNER JOIN skills_dim sd ON sd.skill_id = sjd.skill_id
WHERE
    jp.job_title_short = 'Data Analyst' AND
    jp.job_work_from_home = TRUE AND
    jp.salary_year_avg IS NOT NULL
GROUP BY
    sd.skill_id
HAVING count(sjd.job_id) > 10
ORDER BY
    demand_count DESC,
    average_salary DESC
LIMIT 25;