create schema covid_modified;
select * from covid_modified;

# 1.Find the number of corona patients who faced shortness of breath?
select count(test_result) from covid_modified where test_result='positive' and Shortness_of_breath='true';

#2.Find the number of negative corona patients who have fever and sore_throat?
select count(test_result) from covid_modified where test_result='negative' and sore_throat='True'and fever='true';

#3.Group the data by month and rank the number of positive cases.
select mid(test_date,4,2) as month_name ,count(ID) as no_of_positivecases from covid_modified where test_result='positive' group by month_name order by count(ID) desc;

#4.Find the female negative corona patients who faced cough and headache?
select count(sex)from covid_modified where sex='female'and test_result='negative' and cough_symptoms='true' and headache='true';

# 5.How many elderly corona patients have faced breathing problems?
select count(Age_60_above) from covid_modified where test_result='positive' and Shortness_of_breath='true'and Age_60_above='yes';

#6)	Which three symptoms were more common among COVID positive patients?
SELECT 'Headache' AS Symptom, COUNT(*) AS Count
FROM covid_modified
WHERE Test_result = 'positive' AND Headache = 'True'
UNION ALL
SELECT 'Shortness_of_breath' AS Symptom, COUNT(*) AS Count
FROM covid_modified
WHERE Test_result = 'positive' AND Shortness_of_breath = 'True'
UNION ALL
SELECT 'Sore_throat' AS Symptom, COUNT(*) AS Count
FROM covid_modified
WHERE Test_result = 'positive'  AND Sore_throat = 'True'
UNION ALL
SELECT 'Fever' AS Symptom, COUNT(*) AS Count
FROM covid_modified
WHERE Test_result = 'positive'  AND Fever = 'True'
UNION ALL
SELECT 'Cough_symptoms' AS Symptom, COUNT(*) AS Count
FROM covid_modified
WHERE Test_result = 'positive'  AND Cough_symptoms = 'True'
Order BY count desc;

#7.	Which symptom was less common among COVID negative people?
SELECT 'Headache' AS Symptom, COUNT(*) AS Count
FROM covid_modified
WHERE Test_result = 'negative' AND Headache = 'True'
UNION ALL
SELECT 'Shortness_of_breath' AS Symptom, COUNT(*) AS Count
FROM covid_modified
WHERE Test_result = 'negative' AND Shortness_of_breath = 'True'
UNION ALL
SELECT 'Sore_throat' AS Symptom, COUNT(*) AS Count
FROM covid_modified
WHERE Test_result = 'negative' AND Sore_throat = 'True'
UNION ALL
SELECT 'Fever' AS Symptom, COUNT(*) AS Count
FROM covid_modified
WHERE Test_result = 'negative' AND Fever = 'True'
UNION ALL
SELECT 'Cough_symptoms' AS Symptom, COUNT(*) AS Count
FROM covid_modified
WHERE Test_result = 'negative' AND Cough_symptoms = 'True'
Order BY count;
# 'Least common' symptom among 'Covid Negative' participants is = Headache (179 participants)

#8.What are the most common symptoms among COVID positive males whose known contact was abroad?
SELECT 'Headache' AS Symptom, COUNT(*) AS Count
FROM covid_modified
WHERE Test_result = 'positive' AND Headache = 'True'and sex='male'and known_contact='abroad'
UNION ALL
SELECT 'Shortness_of_breath' AS Symptom, COUNT(*) AS Count
FROM covid_modified
WHERE Test_result = 'positive' AND Shortness_of_breath = 'True' and sex='male'and known_contact='abroad'
UNION ALL
SELECT 'Sore_throat' AS Symptom, COUNT(*) AS Count
FROM covid_modified
WHERE Test_result = 'positive'  AND Sore_throat = 'True' and sex='male'and known_contact='abroad'
UNION ALL
SELECT 'Fever' AS Symptom, COUNT(*) AS Count
FROM covid_modified
WHERE Test_result = 'positive'  AND Fever = 'True' and sex='male'and known_contact='abroad'
UNION ALL
SELECT 'Cough_symptoms' AS Symptom, COUNT(*) AS Count
FROM covid_modified
WHERE Test_result = 'positive'  AND Cough_symptoms = 'True' and sex='male'and known_contact='abroad'
Order BY count desc;


