USE setter;

DROP TABLE IF EXISTS `projects`;
CREATE TABLE projects
(
    id int NOT NULL AUTO_INCREMENT,
    user_id INT NOT NULL,
    route_id INT NOT NULL,
    date DATETIME NOT NULL,

    PRIMARY KEY (id),

    FOREIGN KEY (user_id)
        REFERENCES users(account_id)
        ON DELETE CASCADE,

    FOREIGN KEY (route_id)
        REFERENCES routes(id)
        ON DELETE CASCADE

) ENGINE=InnoDB;
