-- Запрос для вычисления зарплаты сотрудников, чья зарплата меньше среднего по всем сотрудникам
SELECT 
    E.FullName AS EmployeeFullNames,  -- Выбираем полное имя сотрудника
    ROUND(SUM(P.Salary * S.SalaryPercentage)) AS SumSalary -- Вычисляем сумму зарплаты с учетом процентного коэффициента
FROM Employees E
JOIN Salaries S ON E.ID = S.EmployeeID  -- Объединяем таблицы Employees и Salaries по ID сотрудника
JOIN Positions P ON S.PositionID = P.ID -- Объединяем таблицу Salaries с Positions по ID должности
GROUP BY E.ID                         -- Группируем результаты по каждому сотруднику
HAVING SUM(P.Salary * S.SalaryPercentage) < (  -- Отбираем сотрудников, чья зарплата меньше средней
    SELECT AVG(TotalSalary)              -- Вычисляем среднюю зарплату
    FROM (
        SELECT SUM(P2.Salary * S2.SalaryPercentage) AS TotalSalary -- Суммируем зарплату с учетом процентных ставок
        FROM Salaries S2
        JOIN Positions P2 ON S2.PositionID = P2.ID  -- Объединяем Salaries и Positions по ID должности
        GROUP BY S2.EmployeeID               -- Группируем по каждому сотруднику
    )
)
ORDER BY SumSalary ASC;  -- Сортируем по возрастанию суммы зарплаты