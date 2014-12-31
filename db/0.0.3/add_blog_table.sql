USE setter;

CREATE TABLE blogs
(
    id int NOT NULL AUTO_INCREMENT,
    html TEXT NOT NULL,
    date DATETIME NOT NULL,

    PRIMARY KEY (id)
) ENGINE=InnoDB;
