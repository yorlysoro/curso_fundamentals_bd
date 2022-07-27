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

CREATE TABLE categories (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    category VARCHAR(30) NOT NULL
);

CREATE TABLE tags (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    tag VARCHAR(30) NOT NULL
);

CREATE TABLE users (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    login VARCHAR(30) NOT NULL,
    password VARCHAR(32) NOT NULL,
    nickname VARCHAR(40) NOT NULL,
    email VARCHAR(40) NOT NULL,
    UNIQUE INDEX `email_UNIQUE` (`email` ASC)
);


CREATE TABLE posts (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(130) NOT NULL,
    date_publish TIMESTAMP,
    content TEXT NOT NULL,
    status CHAR(8) DEFAULT 'active',
    user_id INT NOT NULL,
    categories_id INT NOT NULL,
    KEY `users_posts_idx` (`user_id`),
    KEY `categories_posts_idx` (`categories_id`),
    CONSTRAINT `users_posts` FOREIGN KEY (user_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE NO ACTION,
    CONSTRAINT `categories_posts` FOREIGN KEY (categories_id) REFERENCES categories(id) ON DELETE NO ACTION ON UPDATE CASCADE
);

CREATE TABLE comments (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    content TEXT NOT NULL,
    user_id INT NOT NULL,
    post_id INT NOT NULL,
    KEY `users_comments_idx` (`user_id`),
    KEY `posts_comments_idx` (`post_id`),
    CONSTRAINT `users_comments` FOREIGN KEY (user_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE NO ACTION,
    CONSTRAINT `posts_comments` FOREIGN KEY (post_id) REFERENCES posts(id) ON UPDATE CASCADE ON DELETE NO ACTION
);


CREATE TABLE posts_tags (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    post_id INT NOT NULL, 
    tags_id INT NOT NULL,
    KEY `posts_tags_idx` (`post_id`),
    KEY `tags_posts_idx` (`tags_id`),
    CONSTRAINT `posts_tags` FOREIGN KEY (post_id) REFERENCES posts(id) ON UPDATE CASCADE ON DELETE NO ACTION,
    CONSTRAINT `tags_posts` FOREIGN KEY (tags_id) REFERENCES tags(id) ON DELETE NO ACTION ON UPDATE CASCADE
);
