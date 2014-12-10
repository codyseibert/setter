USE setter;
DROP SCHEMA setter;
CREATE SCHEMA setter;
USE setter;

CREATE TABLE accounts_types
(
    id int NOT NULL AUTO_INCREMENT,
    name varchar(255) NOT NULL,
    PRIMARY KEY (id)
) ENGINE=InnoDB;

CREATE TABLE accounts
(
    id int NOT NULL AUTO_INCREMENT,
    email varchar(255) NOT NULL,
    password varchar(255) NOT NULL,
    type_id int NOT NULL,

    PRIMARY KEY (id),

    FOREIGN KEY (type_id)
        REFERENCES accounts_types(id)
        ON DELETE CASCADE,

    UNIQUE (email)
) ENGINE=InnoDB;

CREATE TABLE setters
(
    account_id int NOT NULL,
    firstname varchar(255) NOT NULL,
    lastname varchar(255) NOT NULL,

    FOREIGN KEY (account_id)
        REFERENCES accounts(id)
        ON DELETE CASCADE,

    UNIQUE (account_id)
) ENGINE=InnoDB;

CREATE TABLE gyms
(
    account_id int NOT NULL,
    name varchar(255) NOT NULL,
    address varchar(255) NOT NULL,

    FOREIGN KEY (account_id)
        REFERENCES accounts(id)
        ON DELETE CASCADE,

    UNIQUE (account_id)
) ENGINE=InnoDB;

CREATE TABLE users
(
    account_id int NOT NULL,
    gym_id int DEFAULT NULL,
    firstname varchar(255) NOT NULL,
    lastname varchar(255) NOT NULL,

    FOREIGN KEY (account_id)
        REFERENCES accounts(id)
        ON DELETE CASCADE,

    FOREIGN KEY (gym_id)
        REFERENCES accounts(id)
        ON DELETE CASCADE,

    UNIQUE (account_id)
) ENGINE=InnoDB;








CREATE TABLE users_gyms_favorites
(
    user_id int NOT NULL,
    gym_id int NOT NULL,

    PRIMARY KEY (user_id, gym_id),

    FOREIGN KEY (user_id)
        REFERENCES accounts(id)
        ON DELETE CASCADE,

    FOREIGN KEY (gym_id)
        REFERENCES accounts(id)
        ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE TABLE setters_gyms_access
(
    setter_id int NOT NULL,
    gym_id int NOT NULL,

    PRIMARY KEY (setter_id, gym_id),

    FOREIGN KEY (setter_id)
        REFERENCES accounts(id)
        ON DELETE CASCADE,

    FOREIGN KEY (gym_id)
        REFERENCES accounts(id)
        ON DELETE CASCADE
) ENGINE=InnoDB;










CREATE TABLE images
(
    id int NOT NULL AUTO_INCREMENT,
    url varchar(255) NOT NULL,

    PRIMARY KEY (id)
) ENGINE=InnoDB;


CREATE TABLE walls
(
    id int NOT NULL AUTO_INCREMENT,
    account_id int NOT NULL,

    PRIMARY KEY (id),

    FOREIGN KEY (account_id)
        REFERENCES accounts(id)
        ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE TABLE sets
(
    id int NOT NULL AUTO_INCREMENT,
    wall_id int NOT NULL,
    image_id int NOT NULL,
    date datetime NOT NULL,

    PRIMARY KEY (id),

    FOREIGN KEY (wall_id)
        REFERENCES walls(id)
        ON DELETE CASCADE,

    FOREIGN KEY (image_id)
        REFERENCES images(id)
        ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE TABLE boulder_grades
(
    id int NOT NULL AUTO_INCREMENT,
    name varchar(255) NOT NULL,

    PRIMARY KEY (id)
) ENGINE=InnoDB;

CREATE TABLE rope_grades
(
    id int NOT NULL AUTO_INCREMENT,
    name varchar(255) NOT NULL,

    PRIMARY KEY (id)
) ENGINE=InnoDB;

CREATE TABLE colors
(
    id int NOT NULL AUTO_INCREMENT,
    name varchar(255) NOT NULL,
    color varchar(255) NOT NULL,

    PRIMARY KEY (id)
) ENGINE=InnoDB;

CREATE TABLE routes
(
    id int NOT NULL AUTO_INCREMENT,
    set_id int NOT NULL,

    name varchar(255) NOT NULL,

    boulder_grade_id int DEFAULT NULL,
    rope_grade_id int DEFAULT NULL,

    color_id int NOT NULL,

    setter_id int NOT NULL,

    date DATETIME NOT NULL,

    PRIMARY KEY (id),

    FOREIGN KEY (set_id)
        REFERENCES sets(id)
        ON DELETE CASCADE,

    FOREIGN KEY (boulder_grade_id)
        REFERENCES boulder_grades(id)
        ON DELETE CASCADE,

    FOREIGN KEY (rope_grade_id)
        REFERENCES rope_grades(id)
        ON DELETE CASCADE,

    FOREIGN KEY (setter_id)
        REFERENCES accounts(id)
        ON DELETE CASCADE,

    FOREIGN KEY (color_id)
        REFERENCES colors(id)
        ON DELETE CASCADE
) ENGINE=InnoDB;


CREATE TABLE sends
(
    user_id int NOT NULL,
    route_id int NOT NULL,
    date DATETIME NOT NULL,

    PRIMARY KEY (user_id, route_id),

    FOREIGN KEY (user_id)
        REFERENCES accounts(id)
        ON DELETE CASCADE,

    FOREIGN KEY (route_id)
        REFERENCES routes(id)
        ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE TABLE comments
(
    user_id int NOT NULL,
    route_id int NOT NULL,
    comment varchar(255) NOT NULL,
    date DATETIME NOT NULL,

    PRIMARY KEY (user_id, route_id),

    FOREIGN KEY (user_id)
        REFERENCES accounts(id)
        ON DELETE CASCADE,

    FOREIGN KEY (route_id)
        REFERENCES routes(id)
        ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE TABLE ratings
(
    route_id int NOT NULL,
    user_id int NOT NULL,
    rating int NOT NULL,

    PRIMARY KEY (route_id, user_id),

    FOREIGN KEY (route_id)
        REFERENCES routes(id)
        ON DELETE CASCADE,

    FOREIGN KEY (user_id)
        REFERENCES accounts(id)
        ON DELETE CASCADE
) ENGINE=InnoDB;
