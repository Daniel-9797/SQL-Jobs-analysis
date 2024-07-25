COPY company_dim
FROM '/Users/danieldelafuenteferre/Desktop/Bigdata/Python/jobs 2023/csv_files/company_dim.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

COPY skills_dim
FROM '/Users/danieldelafuenteferre/Desktop/Bigdata/Python/jobs 2023/csv_files/skills_dim.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

COPY job_postings_fact
FROM '/Users/danieldelafuenteferre/Desktop/Bigdata/Python/jobs 2023/csv_files/job_postings_fact.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

COPY skills_job_dim
FROM '/Users/danieldelafuenteferre/Desktop/Bigdata/Python/jobs 2023/csv_files/skills_job_dim.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');
