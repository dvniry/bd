-- Запрос для классификации чисел в таблице Numbers на "negative", "positive" и "zero"
SELECT
    Value,                                    -- Значение из таблицы Numbers
    CASE
        WHEN Value < 0 THEN "negative"         -- Если значение отрицательное, классифицируем как "negative"
        WHEN Value > 0 THEN "positive"         -- Если значение положительное, классифицируем как "positive"
        ELSE "zero"                            -- Если значение равно нулю, классифицируем как "zero"
    END AS Classification                      -- Название столбца с классификацией
FROM Numbers;