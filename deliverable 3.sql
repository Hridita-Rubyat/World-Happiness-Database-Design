-- Insert data into the existing table
INSERT INTO happiness_data (
    Country,
    Region,
    Happiness_Rank,
    Happiness_Score,
    GDP_Capita,
    Family,
    Life_Expectancy,
    Freedom,
    Gov_Corruption,
    Generosity,
    Dystopia_Residual,
    Year,
    country_id,
    cultural_id,
    socialsupport_index,
    crimerate_id,
    crimerate_value,
    user_id,
    user_name,
    user_category,
    dystopia_id,
    utopia_residual,
    z_score,
    socio_id,
    trust_id
)
VALUES (
    'NewCountry',
    'NewRegion',
    999,
    9.999,
    99.999,
    9.999,
    9.999,
    9.999,
    9.999,
    9.999,
    9.999,
    2023,
    'new_country_id',
    'new_cultural_id',
    0.789,
    'new_crimerate_id',
    'NewCrimeRateValue',
    'new_user_id',
    'NewUserName',
    'new_user_category',
    'new_dystopia_id',
    'new_utopia_residual',
    999,
    'new_socio_id',
    'new_trust_id'
);









-- Update data in the existing table
UPDATE happiness_data
SET
    Happiness_Score = 8.888,
    Life_Expectancy = 8.888,
    Freedom = 8.888,
    Gov_Corruption = 8.888
WHERE
    Country = 'Switzerland' AND Year = 2015;





-- Delete data from the existing table
DELETE FROM happiness_data
WHERE
    Country = 'Switzerland' AND Year = 2015;