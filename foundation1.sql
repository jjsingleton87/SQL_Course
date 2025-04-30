
-- SELECT * FROM airports

SELECT 
    ps.PatientId
    , ps.Hospital
    , ps.Ward
    , ps.AdmittedDate
    , ps.DischargeDate 
    , DATEDIFF (DAY, ps.AdmittedDate, ps.DischargeDate) AS LengthOfStay
    , DATEADD (DAY, -14, ps.AdmittedDate)   AS ReminderDate
    , ps.Tariff
    , ps.Ethnicity
    FROM PatientStay ps
    WHERE ps.Hospital IN ('PRUH', 'Oxleas')
    AND ps.Ward LIKE '%Surgery'
    AND ps.AdmittedDate BETWEEN '2024-02-27' AND '2024-03-01'
    --AND ps.AdmittedDate >= '2024-02-27'
    --AND ps.AdmittedDate <= '2024-03-01'