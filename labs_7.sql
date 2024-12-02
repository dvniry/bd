SELECT
    Value,
    CASE
        WHEN Value < 0 THEN "negative"
        WHEN Value > 0 THEN "positive"
        ELSE "zero"
    END AS Classification
FROM Numbers;