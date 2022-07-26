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

INSERT INTO people (`last_name`, `first_name`, `address`, `city`)
VALUES ('Vázquez', 'Israel', 'Calle Famosa Num 1', 'México');

INSERT INTO people (`last_name`, `first_name`, `address`, `city`)
VALUES('Hernández', 'Mónica', 'Reforma 222', 'México');

INSERT INTO people (`last_name`, `first_name`, `address`, `city`)
VALUES('Alanis', 'Edgar', 'Central 1', 'Monterrey');

