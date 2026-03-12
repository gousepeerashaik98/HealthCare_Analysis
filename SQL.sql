use health_analysis;

-- 1.Total Patients
-- 2.Total Doctors
-- 3.Total Visits
SELECT 
    (SELECT COUNT(*) FROM Patient) AS Total_Patients,
    (SELECT COUNT(*) FROM Doctor) AS Total_Doctors,
    (SELECT COUNT(*) FROM Visit) AS Total_Visits;

-- 4.Average Age of Patients
SELECT ROUND(AVG(Age), 2) AS Average_Patient_Age FROM Patient;



-- 5.Top 5 Diagnosed Conditions
SELECT Diagnosis, COUNT(*) AS Frequency
FROM Visit
GROUP BY Diagnosis
ORDER BY Frequency DESC
LIMIT 5;

-- 6.Follow-Up Rate (%)
SELECT 
    ROUND((SUM(CASE WHEN `Follow Up Required` = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100, 2) AS Follow_Up_Rate_Percent
FROM Visit;

-- 7.Average Treatment Cost Per Visit
SELECT ROUND(AVG(`Treatment Cost`), 2) AS Avg_Treatment_Cost_Per_Visit
FROM treatments;

-- 8.Total Lab Tests Conducted
SELECT COUNT(*) AS Total_Lab_Tests FROM Lab_Results;

-- 9.Percentage of Abnormal Lab Results
-- Note: This assumes your 'Comments' or 'Test Result' column contains the word 'Abnormal'
SELECT 
    ROUND((COUNT(CASE WHEN `Test Result` = 'Abnormal' THEN 1 END) / COUNT(*)) * 100, 2) AS Percent_Abnormal_Results
FROM `lab_results`;


DESCRIBE Visit;
-- 10.Doctor Workload (Average Patients per Doctor)
SELECT ROUND(COUNT(`ï»¿Visit ID`) / COUNT(DISTINCT `Doctor ID`), 2) AS Avg_Patients_Per_Doctor
FROM visit;

-- 11.Total Revenue
-- This joins Visits and Treatments to sum up costs
SELECT 
    SUM(`Treatment Cost`) AS Total_Revenue
FROM Treatments;