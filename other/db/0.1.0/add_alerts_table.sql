USE setter;

CREATE TABLE alerts
(
    id int NOT NULL AUTO_INCREMENT,
    gym_id INT NOT NULL,
    message VARCHAR(255) NOT NULL,
    date DATETIME NOT NULL,

    PRIMARY KEY (id),

    FOREIGN KEY (gym_id)
        REFERENCES gyms(account_id)
        ON DELETE CASCADE
) ENGINE=InnoDB;
