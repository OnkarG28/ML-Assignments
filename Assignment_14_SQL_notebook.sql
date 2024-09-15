use b94;
CREATE TABLE heart_disease_data (
    id INT  PRIMARY KEY,
    age INT,
    sex INT,
    cp INT,
    trestbps INT,
    chol INT,
    fbs INT,
    restecg INT,
    thalach INT,
    exang INT,
    oldpeak FLOAT,
    slope INT,
    ca INT,
    thal INT,
    target INT
);
SHOW VARIABLES LIKE 'secure_file_priv';
DESCRIBE heart_disease_data;

LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/heart.csv"
INTO TABLE heart_disease_data
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(age, sex, cp, trestbps, chol, fbs, restecg, thalach, exang, oldpeak, slope, ca, thal, target);

SET SQL_SAFE_UPDATES = 0;

alter table heart_disease_data add column age_group varchar(20);

update heart_disease_data 
set age_group = 
	CASE 
    when age between 0 and 20 then '0-20'
    when age between 21 and 40 then '21-40'
    WHEN age BETWEEN 41 AND 60 THEN '41-60'
        WHEN age BETWEEN 61 AND 80 THEN '61-80'
        ELSE '80+' 
    END;
SET SQL_SAFE_UPDATES = 1;
select * from heart_disease_data

