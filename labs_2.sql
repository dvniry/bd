-- Запрос для получения минимального, максимального значений, суммы, количества и среднего значения для поля Value в таблице Numbers
SELECT 
    MIN(Value) AS MinValue,            -- Получаем минимальное значение
    MAX(Value) AS MaxValue,            -- Получаем максимальное значение
    SUM(Value) AS SumValue,            -- Получаем сумму всех значений
    COUNT(Value) AS CountValue,        -- Получаем количество значений
    AVG(Value) AS AvgValue             -- Получаем среднее значение
FROM Numbers;