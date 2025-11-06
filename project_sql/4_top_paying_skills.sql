/*
Question: What are the top skills based on salary?
- Look at the average salary associated with each skill for Data Analyst positions
- Focuses on roles with specified salaries, regardless of location
- Why? It reveals how different skills impact salary levels for Data Analysts and
  helps identify the most finanically rewarding skills to acquire or improve
*/

SELECT 
  sd.skills AS skill,
  ROUND(AVG(jp.salary_year_avg),0) AS avg_salary
FROM job_postings_fact jp
INNER JOIN skills_job_dim sjd ON sjd.job_id = jp.job_id
INNER JOIN skills_dim sd ON sd.skill_id = sjd.skill_id 
WHERE (
  jp.job_title_short = 'Data Analyst' AND
  jp.salary_year_avg IS NOT NULL
  )
GROUP BY skill
ORDER BY avg_salary DESC
LIMIT 25;

/*
Some quick data insights:
Even though these are “data analyst” roles, the skills that command the highest salaries reveal a clear trend:
The analysts earning the most money are those closest to software engineering, cloud, and machine learning.

The highest-paid data analyst roles lean toward software engineering skills (FastAPI, Node.js, Golang, TypeScript), 
showing that analysts who can build data applications and automate pipelines earn more than pure reporting analysts.

Cloud, NoSQL, and infrastructure tools (DynamoDB, Terraform, Elasticsearch, Neo4j) appear frequently, meaning companies 
pay premium salaries to analysts who can work with modern, scalable data systems.

AI / Machine Learning ecosystem tools (Hugging Face, MXNet, Watson) show up among the top salaries, indicating that 
analysts who support NLP, LLMs, and advanced ML pipelines are moving into the highest-earning tier.


[
  {
    "skill": "fastapi",
    "avg_salary": "212500"
  },
  {
    "skill": "svn",
    "avg_salary": "185000"
  },
  {
    "skill": "blazor",
    "avg_salary": "161000"
  },
  {
    "skill": "apl",
    "avg_salary": "155000"
  },
  {
    "skill": "mxnet",
    "avg_salary": "149000"
  },
  {
    "skill": "graphql",
    "avg_salary": "137699"
  },
  {
    "skill": "typescript",
    "avg_salary": "135520"
  },
  {
    "skill": "asp.net core",
    "avg_salary": "130500"
  },
  {
    "skill": "dynamodb",
    "avg_salary": "129970"
  },
  {
    "skill": "solidity",
    "avg_salary": "128313"
  },
  {
    "skill": "react.js",
    "avg_salary": "128000"
  },
  {
    "skill": "terraform",
    "avg_salary": "127119"
  },
  {
    "skill": "atlassian",
    "avg_salary": "124636"
  },
  {
    "skill": "node",
    "avg_salary": "124293"
  },
  {
    "skill": "hugging face",
    "avg_salary": "123950"
  },
  {
    "skill": "watson",
    "avg_salary": "123411"
  },
  {
    "skill": "golang",
    "avg_salary": "122203"
  },
  {
    "skill": "dplyr",
    "avg_salary": "122158"
  },
  {
    "skill": "twilio",
    "avg_salary": "120250"
  },
  {
    "skill": "mattermost",
    "avg_salary": "120000"
  },
  {
    "skill": "node.js",
    "avg_salary": "119615"
  },
  {
    "skill": "neo4j",
    "avg_salary": "119579"
  },
  {
    "skill": "perl",
    "avg_salary": "118653"
  },
  {
    "skill": "no-sql",
    "avg_salary": "118553"
  },
  {
    "skill": "elasticsearch",
    "avg_salary": "118378"
  }
]
*/