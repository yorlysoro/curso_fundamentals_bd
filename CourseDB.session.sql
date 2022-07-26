CREATE TABLE IF NOT EXISTS people (
    person_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    last_name VARCHAR(255),
    first_name VARCHAR(255),
    address VARCHAR(255),
    city VARCHAR(255)
) 

ALTER TABLE `platziblog`.`people` 
ADD COLUMN `date_of_bird` DATE NULL DEFAULT NULL;

ALTER TABLE people
DROP COLUMN date_of_bird;