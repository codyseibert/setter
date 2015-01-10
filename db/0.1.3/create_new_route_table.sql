USE setter;

CREATE TABLE route_new_to_user
(
    id int NOT NULL AUTO_INCREMENT,
    gym_id INT NOT NULL,
    wall_id INT NOT NULL,
    user_id INT NOT NULL,
    route_id INT NOT NULL,

    PRIMARY KEY (id),

    FOREIGN KEY (gym_id)
        REFERENCES gyms(account_id)
        ON DELETE CASCADE,

    FOREIGN KEY (wall_id)
        REFERENCES walls(id)
        ON DELETE CASCADE,

    FOREIGN KEY (user_id)
        REFERENCES users(account_id)
        ON DELETE CASCADE,

    FOREIGN KEY (route_id)
        REFERENCES routes(id)
        ON DELETE CASCADE
) ENGINE=InnoDB;
