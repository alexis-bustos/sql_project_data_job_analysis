-- Get a list of companies that are offering jobs and
-- don't have any requirements for a degree

SELECT DISTINCT 
  company_id,
  name as company_name
from company_dim cd
WHERE cd.company_id IN (
  SELECT company_id
  FROM job_postings_fact
  WHERE job_no_degree_mention IS TRUE
)
ORDER BY company_id;


