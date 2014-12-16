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
    value int NOT NULL,

    PRIMARY KEY (id)
) ENGINE=InnoDB;

CREATE TABLE rope_grades
(
    id int NOT NULL AUTO_INCREMENT,
    name varchar(255) NOT NULL,
    value int NOT NULL,

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

    note varchar(255) NOT NULL DEFAULT '',

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
    id int NOT NULL AUTO_INCREMENT,
    user_id int NOT NULL,
    route_id int NOT NULL,
    message varchar(255) NOT NULL,
    date DATETIME NOT NULL,

    PRIMARY KEY (id),

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

CREATE TABLE suggestions
(
    id int NOT NULL AUTO_INCREMENT,
    account_id int NOT NULL,
    suggestion text NOT NULL,

    PRIMARY KEY (id),

    FOREIGN KEY (account_id)
        REFERENCES accounts(id)
        ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE TABLE suggestions_upvotes
(
    suggestion_id int NOT NULL,
    account_id int NOT NULL,

    PRIMARY KEY (suggestion_id, account_id),

    FOREIGN KEY (suggestion_id)
        REFERENCES suggestions(id)
        ON DELETE CASCADE,

    FOREIGN KEY (account_id)
        REFERENCES accounts(id)
        ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE TABLE feedback
(
    id int NOT NULL AUTO_INCREMENT,
    name varchar(255) NOT NULL,
    message text NOT NULL,

    PRIMARY KEY (id)
) ENGINE=InnoDB;

INSERT INTO boulder_grades (name, value) VALUES ('V0', 0);
INSERT INTO boulder_grades (name, value) VALUES ('V1', 1);
INSERT INTO boulder_grades (name, value) VALUES ('V2', 2);
INSERT INTO boulder_grades (name, value) VALUES ('V3', 3);
INSERT INTO boulder_grades (name, value) VALUES ('V4', 4);
INSERT INTO boulder_grades (name, value) VALUES ('V5', 5);
INSERT INTO boulder_grades (name, value) VALUES ('V6', 6);
INSERT INTO boulder_grades (name, value) VALUES ('V7', 7);
INSERT INTO boulder_grades (name, value) VALUES ('V8', 8);
INSERT INTO boulder_grades (name, value) VALUES ('V9', 9);
INSERT INTO boulder_grades (name, value) VALUES ('V10', 10);
INSERT INTO boulder_grades (name, value) VALUES ('V11', 11);
INSERT INTO boulder_grades (name, value) VALUES ('V12', 12);
INSERT INTO boulder_grades (name, value) VALUES ('V13', 13);

INSERT INTO rope_grades (name, value) VALUES ('5.6', 6);
INSERT INTO rope_grades (name, value) VALUES ('5.7', 7);
INSERT INTO rope_grades (name, value) VALUES ('5.8', 8);
INSERT INTO rope_grades (name, value) VALUES ('5.9', 9);
INSERT INTO rope_grades (name, value) VALUES ('5.10', 10);
INSERT INTO rope_grades (name, value) VALUES ('5.11', 11);
INSERT INTO rope_grades (name, value) VALUES ('5.12', 12);
INSERT INTO rope_grades (name, value) VALUES ('5.13', 13);
INSERT INTO rope_grades (name, value) VALUES ('5.14', 14);
INSERT INTO rope_grades (name, value) VALUES ('5.15', 15);

INSERT INTO accounts_types (name) VALUES ('user');
INSERT INTO accounts_types (name) VALUES ('gym');

INSERT INTO colors (name, value) VALUES ('red', '#FF0000');
INSERT INTO colors (name, value) VALUES ('green', '#00FF00');
INSERT INTO colors (name, value) VALUES ('blue', '#0000FF');
INSERT INTO colors (name, value) VALUES ('orange', '#FF00FF');
INSERT INTO colors (name, value) VALUES ('purple', '#00FF00');
