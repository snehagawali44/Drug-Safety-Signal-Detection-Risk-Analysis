CREATE DATABASE drug_safety_analysis;
USE drug_safety_analysis;
CREATE TABLE drug_safety_reports;
SELECT * FROM drug_safety_reports LIMIT 10;

-- Q1. Which drugs have the highest number of adverse event reports?
SELECT suspect_drug,
       COUNT(*) AS total_reports
FROM drug_safety_reports
GROUP BY suspect_drug
ORDER BY total_reports DESC
LIMIT 10;

-- Q2. Which drugs are associated with the highest number of fatal outcomes?
SELECT suspect_drug,
       COUNT(*) AS fatal_cases
FROM drug_safety_reports
WHERE is_fatal = TRUE
GROUP BY suspect_drug
ORDER BY fatal_cases DESC
LIMIT 10;

-- Q3. Which drugs are associated with the highest number of hospitalizations?
SELECT suspect_drug,
       COUNT(*) AS hospitalization_cases
FROM drug_safety_reports
WHERE is_hospitalized = TRUE
GROUP BY suspect_drug
ORDER BY hospitalization_cases DESC
LIMIT 10;

-- Q4. Which adverse reactions are reported most frequently?
SELECT primary_reaction,
       COUNT(*) AS reaction_count
FROM drug_safety_reports
GROUP BY primary_reaction
ORDER BY reaction_count DESC
LIMIT 10;

-- Q5. What is the distribution of serious outcomes?
SELECT serious_flags,
       COUNT(*) AS reports
FROM drug_safety_reports
GROUP BY serious_flags
ORDER BY reports DESC;

-- Q6. Which age groups experience the highest number of serious reports?
SELECT age_group,
       COUNT(*) AS serious_reports
FROM drug_safety_reports
WHERE serious = 'Yes'
GROUP BY age_group
ORDER BY serious_reports DESC;

-- Q7. Which countries report the highest number of adverse events?
SELECT country,
       COUNT(*) AS total_reports
FROM drug_safety_reports
GROUP BY country
ORDER BY total_reports DESC
LIMIT 10;

-- Q8. Does polypharmacy increase adverse event risk?
SELECT drug_count_category,
       COUNT(*) AS total_reports,
       SUM(is_fatal) AS fatal_cases,
       SUM(is_hospitalized) AS hospitalization_cases
FROM drug_safety_reports
GROUP BY drug_count_category
ORDER BY total_reports DESC;

-- Q9. Which manufacturers are associated with the most serious reports?
SELECT manufacturer,
       COUNT(*) AS serious_reports
FROM drug_safety_reports
WHERE serious = 'Yes'
GROUP BY manufacturer
ORDER BY serious_reports DESC
LIMIT 10;

-- Q10. What are the yearly trends in adverse event reporting from 2015–2025?
SELECT year,
       COUNT(*) AS total_reports
FROM drug_safety_reports
GROUP BY year
ORDER BY year;

-- Q11. Which drug–reaction combinations occur most frequently and may represent potential safety signals?
SELECT suspect_drug,
       primary_reaction,
       COUNT(*) AS report_count
FROM drug_safety_reports
GROUP BY suspect_drug, primary_reaction
ORDER BY report_count DESC
LIMIT 20;
