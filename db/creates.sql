USE setter;
DROP DATABASE setter;
CREATE DATABASE setter;
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
    token varchar(255) DEFAULT NULL,

    PRIMARY KEY (id),

    FOREIGN KEY (type_id)
        REFERENCES accounts_types(id)
        ON DELETE CASCADE

) ENGINE=InnoDB;
CREATE UNIQUE INDEX account_index ON accounts (email, type_id);

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
    name varchar(255) NOT NULL,
    gym_id int NOT NULL,

    PRIMARY KEY (id),

    FOREIGN KEY (gym_id)
        REFERENCES accounts(id)
        ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE TABLE sets
(
    id int NOT NULL AUTO_INCREMENT,
    wall_id int NOT NULL,
    image_id int DEFAULT NULL,
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
    value varchar(255) NOT NULL,

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


INSERT INTO boulder_grades (name) VALUES ('V0');
INSERT INTO boulder_grades (name) VALUES ('V1');
INSERT INTO boulder_grades (name) VALUES ('V2');
INSERT INTO boulder_grades (name) VALUES ('V3');
INSERT INTO boulder_grades (name) VALUES ('V4');
INSERT INTO boulder_grades (name) VALUES ('V5');
INSERT INTO boulder_grades (name) VALUES ('V6');
INSERT INTO boulder_grades (name) VALUES ('V7');
INSERT INTO boulder_grades (name) VALUES ('V8');
INSERT INTO boulder_grades (name) VALUES ('V9');
INSERT INTO boulder_grades (name) VALUES ('V10');
INSERT INTO boulder_grades (name) VALUES ('V11');
INSERT INTO boulder_grades (name) VALUES ('V12');
INSERT INTO boulder_grades (name) VALUES ('V13');

INSERT INTO rope_grades (name) VALUES ('5.6');
INSERT INTO rope_grades (name) VALUES ('5.7');
INSERT INTO rope_grades (name) VALUES ('5.8');
INSERT INTO rope_grades (name) VALUES ('5.9');
INSERT INTO rope_grades (name) VALUES ('5.10');
INSERT INTO rope_grades (name) VALUES ('5.11');
INSERT INTO rope_grades (name) VALUES ('5.12');
INSERT INTO rope_grades (name) VALUES ('5.13');
INSERT INTO rope_grades (name) VALUES ('5.14');
INSERT INTO rope_grades (name) VALUES ('5.15');

INSERT INTO accounts_types (name) values ('user');
INSERT INTO accounts_types (name) values ('setter');
INSERT INTO accounts_types (name) values ('gym');

INSERT INTO accounts (email, password, type_id) VALUES ('user', '123456', 1);
INSERT INTO users (account_id, firstname, lastname) VALUES (1, 'Cody', 'Seibert');

INSERT INTO accounts (email, password, type_id) VALUES ('setter', '123456', 2);
INSERT INTO setters (account_id, firstname, lastname) VALUES (2, 'Cody', 'Seibert');

INSERT INTO accounts (email, password, type_id) VALUES ('gym', '123456', 3);
INSERT INTO gyms (account_id, name, address) VALUES (3, 'Aiguille', '999 Barton Street');
