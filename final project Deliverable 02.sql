-- Dystopia table
CREATE TABLE Dystopia (
    Dystopia_id INT PRIMARY KEY,
    Dystopia_Residual DECIMAL(10, 8),
    Z_score DECIMAL(10, 8)
);

-- Socioeconomic table
CREATE TABLE Socioeconomic (
    Socio_id INT PRIMARY KEY,
    GDP_Capita DECIMAL(10, 8),
    Family DECIMAL(10, 8),
    Life_Expectancy DECIMAL(10, 8)
);

-- Base table (Fact table connecting Dystopia and Socioeconomic)
CREATE TABLE Base (
    id INT PRIMARY KEY,
    Rank_Year INT,
    happiness_rank INT,
    happiness_Score DECIMAL(10, 8),
    Dystopia_id INT,
    Socio_id INT,
    FOREIGN KEY (Dystopia_id) REFERENCES Dystopia(Dystopia_id),
    FOREIGN KEY (Socio_id) REFERENCES Socioeconomic(Socio_id)
);


- Assuming your CSV file has a header row

-- Insert data into Dystopia table
LOAD DATA INFILE 'path/to/2015.csv"C:\Users\hridi\OneDrive\Desktop\Fall 2023\DSBA 6160 Database_ Rohrer\final projcet\2015.csv"'
INTO TABLE Dystopia
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(Dystopia_id, Dystopia_Residual, Z_score)
SET
  Dystopia_id = @col13,
  Dystopia_Residual = @col12,
  Z_score = @col14;
 


-- Insert data into Socioeconomic table
LOAD DATA INFILE 'path/to/2015.csv'
INTO TABLE Socioeconomic
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(Socio_id, GDP_Capita, Family, Life_Expectancy)
SET
  Socio_id = @col1,
  GDP_Capita = @col6,  -- Assuming Economy corresponds to GDP_Capita
  Family = @col7,
  Life_Expectancy = @col8;

-- Insert data into Base table
LOAD DATA INFILE 'path/to/2015.csv'
INTO TABLE Base
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(id, Rank_Year, happiness_rank, happiness_Score, Dystopia_id, Socio_id)
SET
  id = @col1,  -- Assuming id corresponds to id
  Rank_Year = @col2,
  happiness_rank = @col3,
  happiness_Score = @col4,
  Dystopia_id = @col5,  -- Assuming Dystopia_id corresponds to Dystopia_Residual
  Socio_id = @col6;  -- Assuming Socio_id corresponds to Socio_id