CREATE DATABASE PatientRiskAnalysis;
USE PatientRiskAnalysis;

CREATE TABLE PatientData (
    PatientID INT PRIMARY KEY,
    Age INT,
    BMI DECIMAL(5,2),
    Glucose INT,
    Outcome INT,
    Risk_Category VARCHAR(20)
);
SELECT COUNT(*) AS TotalPatients
FROM PatientData;
SELECT Risk_Category,
       COUNT(*) AS PatientCount
FROM PatientData
GROUP BY Risk_Category;
SELECT Risk_Category,
       ROUND(AVG(Age),2) AS AverageAge
FROM PatientData
GROUP BY Risk_Category;
SELECT Risk_Category,
       ROUND(AVG(BMI),2) AS AverageBMI
FROM PatientData
GROUP BY Risk_Category;
SELECT Risk_Category,
       ROUND(AVG(Glucose),2) AS AverageGlucose
FROM PatientData
GROUP BY Risk_Category;
SELECT COUNT(*) AS HighRiskPatientsAbove50
FROM PatientData
WHERE Risk_Category = 'High Risk'
AND Age > 50;
SELECT ROUND(AVG(BMI),2) AS AverageBMI_HighRisk
FROM PatientData
WHERE Risk_Category = 'High Risk';
SELECT Risk_Category,
ROUND(
COUNT(*) * 100.0 /
(SELECT COUNT(*) FROM PatientData),
2
) AS Percentage
FROM PatientData
GROUP BY Risk_Category;
SELECT COUNT(*) AS ObesePatients
FROM PatientData
WHERE BMI > 30;
SELECT Risk_Category,
       Outcome,
       COUNT(*) AS PatientCount
FROM PatientData
GROUP BY Risk_Category, Outcome;