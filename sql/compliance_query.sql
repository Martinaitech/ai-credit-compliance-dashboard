SELECT 
    customer_parish,
    COUNT(application_id) AS total_applications,
    SUM(kyc_failure_flag) AS total_kyc_failures,
    ROUND(
        (SUM(kyc_failure_flag) * 100.0) / COUNT(application_id),
        2
    ) AS kyc_failure_pct
FROM jmmb_lending_data
GROUP BY customer_parish
HAVING kyc_failure_pct > 50.0
ORDER BY kyc_failure_pct DESC;
