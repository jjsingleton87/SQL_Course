
-- SELECT * FROM airports

SELECT 
    ps.PatientId
    , ps.Hospital
    , ps.Ward
    , ps.AdmittedDate
    , ps.DischargeDate 
    , DATEDIFF (DAY, ps.AdmittedDate, ps.DischargeDate) AS LengthOfStay
    , DATEADD (WEEK, -2, ps.AdmittedDate)   AS ReminderDate
    , ps.Tariff
    , ps.Ethnicity
    FROM PatientStay ps
    WHERE ps.Hospital IN ('PRUH', 'Oxleas')
    AND ps.Ward LIKE '%Surgery'
    --AND ps.AdmittedDate BETWEEN '2024-02-27' AND '2024-03-01'
    ORDER BY ps.AdmittedDate DESC , ps.PatientId ASC    


    SELECT
    ps.hospital 
    ,ps.ward
    ,COUNT(*) as NumberOfPatients
    ,SUM(ps.Tariff)  as TotalTariff
    ,AVG(ps.Tariff) as AverageTariff
    ,MAX(ps.Tariff) as HighestTariff
    ,MIN(ps.Tariff) as LowestTariff
    FROM PatientStay ps
    GROUP BY ps.hospital, ps.Ward
    --ORDER BY ps.Hospital, ps.Ward
    Order BY NumberOfPatients DESC

    SELECT
    ps.PatientId
    ,ps.AdmittedDate
    ,ps.Hospital
    ,dh.Hospital
    ,dh.HospitalType
    ,dh.HospitalSize
    FROM
    PatientStay ps 
    INNER JOIN DimHospital dh 
    ON ps.Hospital = dh.Hospital
    --WHERE dh.Hospital IS NULL
