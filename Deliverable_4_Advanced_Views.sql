/* Advanced View with Nested Query, Sorting, and Conditional Statements*/
CREATE VIEW AdvancedView_A AS
SELECT
    country_id,
    AVG(Happiness_Score) AS Avg_Happiness,
    CASE
        WHEN AVG(Happiness_Score) > 6 THEN 'High Happiness'
        WHEN AVG(Happiness_Score) > 4 THEN 'Medium Happiness'
        ELSE 'Low Happiness'
    END AS HappinessCategory
FROM data
GROUP BY country_id
ORDER BY Avg_Happiness DESC;

/* Advanced View with GROUP BY and Summary Functions */
CREATE VIEW AdvancedView_B AS
SELECT
    country_id,
    COUNT(*) AS NumRecords,
    MAX(Happiness_Score) AS MaxHappiness,
    MIN(Happiness_Score) AS MinHappiness
FROM data
GROUP BY country_id;

/* Advanced View with WINDOW Functions and CTEs*/
CREATE VIEW AdvancedView_C AS
WITH RankedCountries AS (
    SELECT
        country_id,
        country,
        AVG(Happiness_Score) AS Avg_Happiness,
        RANK() OVER (ORDER BY AVG(Happiness_Score) DESC) AS Ranked
    FROM data
    GROUP BY country_id, country
)
SELECT
    country,
    Avg_Happiness,
    RANK() OVER (ORDER BY Avg_Happiness DESC) AS OverallRank
FROM RankedCountries
ORDER BY OverallRank;
