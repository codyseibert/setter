USE setter;

CREATE TABLE gym_suggestions
(
    id int NOT NULL AUTO_INCREMENT,
    gym_id INT NOT NULL,
    user_id INT NOT NULL,
    message VARCHAR(255) NOT NULL,
    `read` BOOLEAN NOT NULL DEFAULT 0,
    date DATETIME NOT NULL,

    PRIMARY KEY (id),

    FOREIGN KEY (gym_id)
        REFERENCES gyms(account_id)
        ON DELETE CASCADE,

    FOREIGN KEY (user_id)
        REFERENCES users(account_id)
        ON DELETE CASCADE
) ENGINE=InnoDB;
