SELECT 
    E.FullName AS EmployeeFullNames,
    ROUND(SUM(P.Salary * S.SalaryPercentage)) AS SumSalary
FROM Employees E
JOIN Salaries S ON E.ID = S.EmployeeID
JOIN Positions P ON S.PositionID = P.ID
GROUP BY E.ID
HAVING SUM(P.Salary * S.SalaryPercentage) < (
    SELECT AVG(TotalSalary)
    FROM (
        SELECT SUM(P2.Salary * S2.SalaryPercentage) AS TotalSalary
        FROM Salaries S2
        JOIN Positions P2 ON S2.PositionID = P2.ID
        GROUP BY S2.EmployeeID
    )
)
ORDER BY SumSalary ASC;